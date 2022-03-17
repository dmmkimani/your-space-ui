import 'package:flutter/material.dart';
import 'package:project/tabs/home/screens/building/drawer/drawer_building.dart';
import 'package:project/tabs/home/screens/building/widgets/home.dart';
import 'package:project/tabs/provider.dart';
import 'package:project/tabs/widgets/app_bar_building.dart';
import 'package:project/tabs/widgets/bottom_nav_bar.dart';

class Building extends StatefulWidget {
  final String _building;

  const Building(this._building, {Key? key}) : super(key: key);

  @override
  _BuildingState createState() => _BuildingState();
}

class _BuildingState extends State<Building> {
  Widget? _body;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: GlobalData.server.getBuildingDetails(widget._building),
        builder: (BuildContext context,
            AsyncSnapshot<Map<String, dynamic>> snapshot) {
          if (snapshot.data == null) {
            return Container(
                color: Colors.white,
                child: const Center(child: CircularProgressIndicator()));
          } else {
            _body ??= Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: BuildingHome(widget._building, snapshot.requireData),
            );
            return Scaffold(
              drawer: BuildingDrawer(
                  widget._building,
                  snapshot.requireData['name'],
                  snapshot.requireData['rooms'],
                  updatePage),
              extendBodyBehindAppBar: false,
              body: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 90),
                    child: _body,
                  ),
                  BuildingAppBar(context, snapshot.requireData['name'])
                ],
              ),
              bottomNavigationBar: BottomNavBar(0),
            );
          }
        });
  }

  void updatePage(bool isRoom, {Widget? room}) {
    if (isRoom) {
      setState(() {
        _body = room;
      });
    } else {
      setState(() {
        _body = null;
      });
    }
  }
}
