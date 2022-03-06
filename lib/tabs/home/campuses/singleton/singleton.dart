import 'package:flutter/material.dart';

class SingletonCampus extends StatelessWidget {
  const SingletonCampus({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'images/campuses/singleton.jpg',
            width: double.infinity,
            height: 270.0,
            fit: BoxFit.cover,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: const Text(
              'Singleton Park Campus',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                  color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}
