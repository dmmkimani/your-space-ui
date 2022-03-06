import 'package:flutter/material.dart';
import 'package:project/tabs/home/screens/building/building.dart';

class SchoolOfManagement extends StatelessWidget {
  const SchoolOfManagement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const Building('school_of_management')));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'images/buildings/school_of_management.jpg',
            width: double.infinity,
            height: 300,
            fit: BoxFit.cover,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: const Text(
              'School of Management',
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
