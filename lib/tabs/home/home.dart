import 'package:flutter/material.dart';

import 'package:project/tabs/widgets/app_bar.dart';
import 'package:project/tabs/widgets/bottom_nav_bar.dart';

import 'package:project/tabs/home/campuses/bay/bay.dart';
import 'package:project/tabs/home/campuses/singleton/singleton.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

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
                    const SingletonCampus(),
                    Container(
                      padding: const EdgeInsets.only(bottom: 10.0),
                      child: const Divider(thickness: 0.75),
                    ),
                    const BayWidget(),
                  ],
                ),
              )
            ]),
          ),
          const DefaultAppBar('Home')
        ],
      ),
      bottomNavigationBar: BottomNavBar(0),
    );
  }
}
