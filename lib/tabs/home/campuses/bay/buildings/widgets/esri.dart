import 'package:flutter/material.dart';
import 'package:project/tabs/home/screens/building/building.dart';

class ESRI extends StatelessWidget {
  const ESRI({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const Building('esri')));
      },
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'images/buildings/esri.jpg',
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: const Text(
                'ESRI',
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
