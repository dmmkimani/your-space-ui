import 'package:flutter/material.dart';
import 'package:project/tabs/home/pages/the_great_hall/nav_bar/nav_bar_great_hall.dart';
import 'package:project/tabs/widgets/widget_app_bar_building.dart';

class TheGreatHall extends StatefulWidget {
  const TheGreatHall({Key? key}) : super(key: key);

  @override
  _TheGreatHallState createState() => _TheGreatHallState();
}

class _TheGreatHallState extends State<TheGreatHall> {
  Widget body = Container();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: GHNavBar(updatePage),
      extendBodyBehindAppBar: false,
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 90),
            child: body,
          ),
          BuildingAppBar(context, 'The Great Hall')
        ],
      ),
    );
  }

  void updatePage(Widget room) {
    setState(() {
      body = room;
    });
  }
}