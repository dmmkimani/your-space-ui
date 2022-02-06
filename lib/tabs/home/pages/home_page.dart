import 'package:flutter/material.dart';
import 'package:project/tabs/widgets/widget_app_bar.dart';
import 'package:project/tabs/widgets/widget_bottom_nav_bar.dart';

import '../widgets/college_of_engineering.dart';
import '../widgets/esri.dart';
import '../widgets/school_of_management.dart';
import '../widgets/the_college.dart';
import '../widgets/widget_the_great_hall.dart';
import '../widgets/y_twyni.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Widget> buildings = [
    const TheGreatHall(),
    const SchoolOfManagement(),
    const TheCollege(),
    const YTwyni(),
    const ESRI(),
    const CollegeOfEngineering()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 65),
            child: ListView.builder(
                itemCount: buildings.length,
                itemBuilder: (BuildContext context, int position) {
                  return Container(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                    child: Container(
                      decoration: (position != (buildings.length - 1))
                          ? const BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      color: Colors.grey, width: 0.5)))
                          : null,
                      child: _getBuilding(position),
                    ),
                  );
                }),
          ),
          const DefaultAppBar('Home')
        ],
      ),
      bottomNavigationBar: BottomNavBar(0),
    );
  }

  Widget _getBuilding(int i) {
    return buildings.elementAt(i);
  }
}
