import 'package:flutter/material.dart';
import 'package:project/server/localhost.dart';
import 'package:project/tabs/home/widgets/widget_amenities_table.dart';
import 'package:project/tabs/home/widgets/widget_capacity.dart';
import 'package:project/widgets/widget_app_bar.dart';
import 'package:project/widgets/widget_bottom_nav_bar.dart';

class Room extends StatefulWidget {
  const Room({Key? key}) : super(key: key);

  @override
  _RoomState createState() => _RoomState();
}

class _RoomState extends State<Room> {
  static const String currentBuilding = "the_great_hall";
  static const String currentRoom = "gh001";
  static final LocalHost server = LocalHost();

  Widget title = Container(
    padding: const EdgeInsets.all(20.0),
    child: const Text(
      'GH001',
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: FutureBuilder(
                  future: server.getRoomDetails(currentBuilding, currentRoom),
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
          const DefaultAppBar('The Great Hall'),
        ],
      ),
      bottomNavigationBar: BottomNavBar(0),
    );
  }
}
