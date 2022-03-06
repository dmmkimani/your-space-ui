import 'package:flutter/material.dart';
import 'package:project/tabs/home/screens/building/building.dart';

class CollegeOfEngineering extends StatelessWidget {
  const CollegeOfEngineering({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const Building('college_of_engineering')));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'images/buildings/college_of_engineering.jpg',
            width: double.infinity,
            height: 300,
            fit: BoxFit.cover,
          ),
          Container(
            padding: const EdgeInsets.only(top: 10),
            child: const Text(
              'College of Engineering',
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
