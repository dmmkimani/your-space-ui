import 'package:flutter/material.dart';
import 'package:project/tabs/account/screens/login.dart';
import 'package:project/tabs/home/home.dart';

class BottomNavBar extends StatefulWidget {
  int selectedIndex;

  BottomNavBar(this.selectedIndex, {Key? key}) : super(key: key);

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
      currentIndex: widget.selectedIndex,
      selectedItemColor: Colors.blue,
      onTap: _onItemTapped,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      widget.selectedIndex = index;
    });
  }
}
