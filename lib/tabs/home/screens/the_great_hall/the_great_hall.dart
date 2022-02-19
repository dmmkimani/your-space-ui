import 'package:flutter/material.dart';
import 'package:project/tabs/home/screens/the_great_hall/nav_bar/nav_bar_the_great_hall.dart';
import 'package:project/tabs/widgets/app_bar_building.dart';
import 'package:project/tabs/widgets/bottom_nav_bar.dart';

class TheGreatHall extends StatefulWidget {
  const TheGreatHall({Key? key}) : super(key: key);

  @override
  _TheGreatHallState createState() => _TheGreatHallState();
}

class _TheGreatHallState extends State<TheGreatHall> {
  Widget _body = Container();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: GHNavBar(updatePage),
      extendBodyBehindAppBar: false,
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 90),
            child: _body,
          ),
          BuildingAppBar(context, 'The Great Hall')
        ],
      ),
      bottomNavigationBar: BottomNavBar(0),
    );
  }

  void updatePage(Widget room) {
    setState(() {
      _body = room;
    });
  }
}