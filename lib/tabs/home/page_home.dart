import 'package:flutter/material.dart';

import 'package:project/tabs/widgets/widget_app_bar.dart';
import 'package:project/tabs/widgets/widget_bottom_nav_bar.dart';

import 'widgets/college_of_engineering.dart';
import 'widgets/esri.dart';
import 'widgets/school_of_management.dart';
import 'widgets/the_college.dart';
import 'widgets/widget_the_great_hall.dart';
import 'widgets/y_twyni.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Widget> _buildings = [
    const TheGreatHallWidget(),
    const SchoolOfManagement(),
    const TheCollege(),
    const YTwyni(),
    const ESRI(),
    const CollegeOfEngineering()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 65),
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: _buildings.length,
                itemBuilder: (BuildContext context, int position) {
                  return Container(
                    padding:
                    const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildings.elementAt(position),
                        (position != (_buildings.length - 1))
                            ? const Divider(thickness: 1)
                            : const Padding(
                            padding: EdgeInsets.only(bottom: 5.0))
                      ],
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
}
