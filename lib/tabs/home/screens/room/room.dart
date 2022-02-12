import 'package:flutter/material.dart';

import 'package:project/server/localhost.dart';
import 'package:project/tabs/helpers.dart';
import 'package:project/tabs/home/screens/room/functions/helpers_room.dart';

import 'package:project/tabs/home/screens/room/widgets/widget_amenities_table.dart';
import 'package:project/tabs/home/screens/room/widgets/widget_bookings.dart';
import 'package:project/tabs/home/screens/room/widgets/widget_calendar.dart';
import 'package:project/tabs/home/screens/room/widgets/widget_capacity.dart';

class Room extends StatefulWidget {
  final String _building;
  final String _room;

  const Room(this._building, this._room, {Key? key}) : super(key: key);

  @override
  _RoomState createState() => _RoomState();
}

class _RoomState extends State<Room> {
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
          future: loadWidgets(),
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
                    padding: const EdgeInsets.only(top: 15.0, bottom: 10.0),
                    child: Text(
                      widget._room.toUpperCase(),
                      style: const TextStyle(
                          fontSize: 22.0, fontWeight: FontWeight.normal),
                    ),
                  ),
                  CapacityWidget(details['capacity']),
                  AmenitiesTable(details['amenities']),
                  Calendar(_currentDate, changeDate),
                  Expanded(
                      child: Bookings(reload, widget._building, widget._room,
                          _selectedDate, bookings))
                ],
              );
            }
          }),
    );
  }

  Future<Map<String, dynamic>> loadWidgets() async {
    return {
      'roomDetails':
          await LocalHost().getRoomDetails(widget._building, widget._room),
      'roomBookings': await LocalHost().getBookings(widget._building,
          widget._room, RoomHelpers().formatDate(_selectedDate))
    };
  }

  void reload(String message) {
    setState(() {});
    Helpers().showSnackBar(context, message);
  }

  void changeDate(DateTime date) {
    setState(() {
      _selectedDate = date;
    });
  }
}
