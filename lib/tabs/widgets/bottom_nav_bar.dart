import 'package:flutter/material.dart';

import 'package:project/server/server.dart';

import 'package:project/tabs/home/home.dart';
import 'package:project/tabs/account/splash_screen_account.dart';
import 'package:project/tabs/provider.dart';

class BottomNavBar extends StatefulWidget {
  final Server _server;
  final UserData _userData;
  int _selectedIndex;

  BottomNavBar(this._server, this._userData, this._selectedIndex, {Key? key})
      : super(key: key);

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            backgroundColor: Colors.white),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Account',
            backgroundColor: Colors.white),
      ],
      currentIndex: widget._selectedIndex,
      selectedItemColor: Colors.blue,
      onTap: _onItemTapped,
    );
  }

  void _onItemTapped(int index) {
    if (index != widget._selectedIndex) {
      switch (index) {
        case 0:
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => HomePage(widget._server, widget._userData)));
          break;

        case 1:
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) =>
                  AccountSplashScreen(widget._server, widget._userData)));
          break;
      }
      setState(() {
        widget._selectedIndex = index;
      });
    }
  }
}
