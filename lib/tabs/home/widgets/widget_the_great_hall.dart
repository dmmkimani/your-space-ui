import 'package:flutter/material.dart';

import 'package:project/tabs/home/pages/the_great_hall/the_great_hall.dart' as route;

class TheGreatHall extends StatelessWidget {
  const TheGreatHall({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'images/buildings/the_great_hall.jpg',
            width: double.infinity,
            height: 300,
            fit: BoxFit.cover,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: const Text(
              'The Great Hall',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.black),
            ),
          ),
        ],
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => const route.TheGreatHall()
            )
        );
      },
    );
  }
}