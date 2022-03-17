import 'package:flutter/material.dart';

import 'package:project/tabs/widgets/app_bar_pop.dart';
import 'package:project/tabs/widgets/bottom_nav_bar.dart';

import 'widgets/school_of_management.dart';
import 'widgets/the_college.dart';
import 'widgets/the_great_hall.dart';
import 'widgets/y_twyni.dart';

class BayCampus extends StatefulWidget {
  const BayCampus({Key? key}) : super(key: key);

  @override
  _BayCampusState createState() => _BayCampusState();
}

class _BayCampusState extends State<BayCampus> {
  final List<Widget> _buildings = [
    const TheGreatHall(),
    const SchoolOfManagement(),
    const TheCollege(),
    const YTwyni(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 70),
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
                            ? const Divider(thickness: 0.75)
                            : const Padding(
                                padding: EdgeInsets.only(bottom: 5.0))
                      ],
                    ),
                  );
                }),
          ),
          PopAppBar(context, 'Bay Campus')
        ],
      ),
      bottomNavigationBar: BottomNavBar(0),
    );
  }
}
