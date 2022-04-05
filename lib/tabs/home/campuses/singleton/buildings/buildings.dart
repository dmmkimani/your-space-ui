import 'package:flutter/material.dart';
import 'package:project/server/server.dart';
import 'package:project/tabs/home/campuses/singleton/buildings/widgets/faraday.dart';
import 'package:project/tabs/home/campuses/singleton/buildings/widgets/fulton_house.dart';
import 'package:project/tabs/home/campuses/singleton/buildings/widgets/james_callaghan.dart';
import 'package:project/tabs/home/campuses/singleton/buildings/widgets/keir_hardie.dart';

import 'package:project/tabs/widgets/app_bar_pop.dart';
import 'package:project/tabs/widgets/bottom_nav_bar.dart';

class SingletonCampus extends StatefulWidget {
  final Server _server;

  const SingletonCampus(this._server, {Key? key}) : super(key: key);

  @override
  _SingletonCampusState createState() => _SingletonCampusState();
}

class _SingletonCampusState extends State<SingletonCampus> {
  @override
  Widget build(BuildContext context) {
    final List<Widget> _buildings = [
      FultonHouse(widget._server),
      Faraday(widget._server),
      JamesCallaghan(widget._server),
      KeirHardie(widget._server),
    ];
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 70),
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: _buildings.length,
                itemBuilder: (BuildContext context, int position) {
                  return Container(
                    padding:
                        const EdgeInsets.only(left: 15, right: 15, bottom: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildings.elementAt(position),
                        (position != (_buildings.length - 1))
                            ? const Divider(thickness: 0.75)
                            : const Padding(
                                padding: EdgeInsets.only(bottom: 5.0))
                      ],
                    ),
                  );
                }),
          ),
          PopAppBar(context, 'Singleton Park Campus')
        ],
      ),
      bottomNavigationBar: BottomNavBar(widget._server, 0),
    );
  }
}
