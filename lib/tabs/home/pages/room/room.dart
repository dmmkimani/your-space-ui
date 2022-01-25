import 'package:flutter/material.dart';

import 'package:project/server/localhost.dart';

import 'package:project/tabs/home/pages/room/widgets/widget_amenities_table.dart';
import 'package:project/tabs/home/pages/room/widgets/widget_bookings.dart';
import 'package:project/tabs/home/pages/room/widgets/widget_calendar.dart';
import 'package:project/tabs/home/pages/room/widgets/widget_capacity.dart';
import 'package:project/widgets/widget_bottom_nav_bar.dart';

class Room extends StatefulWidget {
  final String building;
  final String room;

  const Room(this.building, this.room, {Key? key}) : super(key: key);

  @override
  _RoomState createState() => _RoomState();
}

class _RoomState extends State<Room> {
  DateTime selectedDate = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: FutureBuilder(
              future: LocalHost().getRoomDetails(widget.building, widget.room),
              builder: (BuildContext context,
                  AsyncSnapshot<Map<String, dynamic>> snapshot) {
                if (snapshot.data == null) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CapacityWidget(snapshot.requireData['capacity']),
                      AmenitiesTable(snapshot.requireData['amenities']),
                      Calendar(widget.building, widget.room, selectedDate),
                      Bookings(widget.building, widget.room,
                          formatDate(selectedDate))
                    ],
                  );
                }
              })),
      bottomNavigationBar: BottomNavBar(0),
    );
  }

  String formatDate(DateTime date) {
    return date.day.toString() +
        '.' +
        date.month.toString() +
        '.' +
        date.year.toString();
  }
}
