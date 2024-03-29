import 'package:flutter/material.dart';
import 'package:project/server/server.dart';
import 'package:project/tabs/home/campuses/singleton/buildings/buildings.dart';
import 'package:project/tabs/provider.dart';

class SingletonWidget extends StatelessWidget {
  final Server _server;
  final UserData _userData;

  const SingletonWidget(this._server, this._userData, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => SingletonCampus(_server, _userData)));
      },
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
