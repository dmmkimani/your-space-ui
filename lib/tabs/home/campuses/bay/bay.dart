import 'package:flutter/material.dart';
import 'package:project/server/server.dart';
import 'package:project/tabs/home/campuses/bay/buildings/buildings.dart';

class BayWidget extends StatelessWidget {
  final Server _server;

  const BayWidget(this._server, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => BayCampus(_server)));
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'images/campuses/bay.jpg',
            width: double.infinity,
            height: 270.0,
            fit: BoxFit.cover,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: const Text(
              'Bay Campus',
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
