import 'package:flutter/material.dart';

import 'package:project/server/localhost.dart';

import 'package:project/tabs/home/widgets/widget_amenities_table.dart';
import 'package:project/tabs/home/widgets/widget_capacity.dart';
import 'package:project/widgets/widget_bottom_nav_bar.dart';

class Room extends StatefulWidget {
  final String building;
  final String room;

  const Room(this.building, this.room, {Key? key}) : super(key: key);

  @override
  _RoomState createState() => _RoomState();
}

class _RoomState extends State<Room> {
  static final LocalHost server = LocalHost();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: FutureBuilder(
              future: server.getRoomDetails(widget.building, widget.room),
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
                      AmenitiesTable(snapshot.requireData['amenities'])
                    ],
                  );
                }
              })),
      bottomNavigationBar: BottomNavBar(0),
    );
  }
}