import 'package:flutter/material.dart';

import 'package:project/server/server.dart';
import 'package:project/tabs/provider.dart';

import 'package:project/tabs/widgets/app_bar.dart';
import 'package:project/tabs/widgets/bottom_nav_bar.dart';

import 'package:project/tabs/home/campuses/bay/bay.dart';
import 'package:project/tabs/home/campuses/singleton/singleton.dart';

class HomePage extends StatefulWidget {
  final Server _server;
  final UserData _userData;

  const HomePage(this._server, this._userData, {Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 70.0),
            child: ListView(physics: const BouncingScrollPhysics(), children: [
              Container(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, bottom: 15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SingletonWidget(widget._server, widget._userData),
                    Container(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: const Divider(thickness: 0.75),
                    ),
                    BayWidget(widget._server, widget._userData),
                  ],
                ),
              )
            ]),
          ),
          const DefaultAppBar('Home')
        ],
      ),
      bottomNavigationBar: BottomNavBar(widget._server, widget._userData, 0),
    );
  }
}
