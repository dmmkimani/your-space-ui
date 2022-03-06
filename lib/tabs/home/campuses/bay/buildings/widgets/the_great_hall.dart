import 'package:flutter/material.dart';
import 'package:project/tabs/home/screens/building/building.dart';

class TheGreatHallWidget extends StatelessWidget {
  const TheGreatHallWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const Building('the_great_hall')));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'images/buildings/the_great_hall.jpg',
            width: double.infinity,
            height: 300.0,
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
    );
  }
}
