import 'package:flutter/material.dart';
import 'package:project/screens/the_great_hall/nav_bar/nav_bar.dart';

class TheGreatHall extends StatefulWidget {
  const TheGreatHall({Key? key}) : super(key: key);

  @override
  _TheGreatHallState createState() => _TheGreatHallState();
}

class _TheGreatHallState extends State<TheGreatHall> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      extendBodyBehindAppBar: false,
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 65),
            child: null,
          ),
          Positioned(
              top: 0.0,
              left: 0.0,
              right: 0.0,
              child: AppBar(
                leading: IconButton(
                  icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.grey),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
                centerTitle: true,
                elevation: 0,
                backgroundColor: Colors.white,
                shape: const Border(
                    bottom: BorderSide(color: Colors.grey, width: 0.2)),
                title: const Text(
                  'The Great Hall',
                  style: TextStyle(
                      fontSize: 25.0,
                      color: Colors.black),
                ),
              )
          ),
        ],
      ),
    );
  }
}