import 'package:flutter/material.dart';
import 'package:project/tabs/home/screens/building/building.dart';

class YTwyni extends StatelessWidget {
  const YTwyni({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => const Building('y_twyni')));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'images/buildings/y_twyni.jpg',
            width: double.infinity,
            height: 300,
            fit: BoxFit.cover,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: const Text(
              'Y Twyni',
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
