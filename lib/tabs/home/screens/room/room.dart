import 'package:flutter/material.dart';
import 'package:project/server/server.dart';
import 'package:project/tabs/home/functions/room_helpers.dart';

import 'package:project/tabs/home/screens/room/widgets/table_amenities.dart';
import 'package:project/tabs/home/screens/room/widgets/listview_bookings_room.dart';
import 'package:project/tabs/home/screens/room/widgets/widget_calendar.dart';
import 'package:project/tabs/home/screens/room/widgets/widget_capacity.dart';
import 'package:project/tabs/account/screens/account.dart';
import 'package:project/tabs/provider.dart';

class Room extends StatefulWidget {
  final Server _server;
  final UserData _userData;
  final String _building;
  final String _room;

  const Room(this._server, this._userData, this._building, this._room,
      {Key? key})
      : super(key: key);

  @override
  RoomState createState() => RoomState();
}

class RoomState extends State<Room> {
  final DateTime _currentDate = DateTime.now();
  late DateTime _selectedDate;

  @override
  void initState() {
    _selectedDate = _currentDate;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: FutureBuilder(
          future: loadWidgetData(),
          builder: (BuildContext context,
              AsyncSnapshot<Map<String, dynamic>> snapshot) {
            if (snapshot.data == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              Map<String, dynamic> details =
                  snapshot.requireData['roomDetails'];
              Map<String, dynamic> bookings =
                  snapshot.requireData['roomBookings'];
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 7.5, bottom: 10.0),
                    child: Text(
                      room,
                      style: const TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  CapacityWidget(details['capacity']),
                  AmenitiesTable(details['amenities']),
                  Calendar(_currentDate, changeDate),
                  Expanded(
                      child: RoomBookings(
                          widget._server,
                          widget._userData,
                          refresh,
                          widget._building,
                          widget._room,
                          _selectedDate,
                          bookings))
                ],
              );
            }
          }),
    );
  }

  String get room {
    return RoomHelperFunctions().formatRoom(widget._building, widget._room);
  }

  String get date {
    return RoomHelperFunctions().formatDate(_selectedDate);
  }

  Future<Map<String, dynamic>> loadWidgetData() async {
    return {
      'roomDetails': await widget._server
          .getRoomDetails({'building': widget._building, 'room': widget._room}),
      'roomBookings': await widget._server.getRoomBookings(
          {'building': widget._building, 'room': widget._room, 'date': date})
    };
  }

  void refresh(String message) {
    setState(() {});
    final scaffold = ScaffoldMessenger.of(context);
    Future.delayed(const Duration(milliseconds: 500), () {
      scaffold.showSnackBar(SnackBar(
        content: Text(message),
        action: SnackBarAction(
          label: 'VIEW BOOKING',
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (context) =>
                    AccountPage(widget._server, widget._userData)));
          },
        ),
        duration: const Duration(seconds: 5),
      ));
    });
  }

  void changeDate(DateTime date) {
    setState(() {
      _selectedDate = date;
    });
  }
}
