import 'package:flutter/material.dart';

import 'tiles/auditorium.dart';
import 'tiles/gh001.dart';
import 'tiles/gh011.dart';
import 'tiles/gh014.dart';
import 'tiles/gh018.dart';
import 'tiles/gh022.dart';
import 'tiles/gh029.dart';
import 'tiles/gh037.dart';
import 'tiles//gh043.dart';
import 'tiles/gh049.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: const [
          DrawerHeader(child: null),
          Auditorium(),
          Divider(),
          Divider(),
          ListTile(
            title: Text(
                'Tiered Lecture Theatres',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: Colors.black
                )
            ),
          ),
          Divider(),
          GH037(),
          Divider(),
          GH043(),
          Divider(),
          GH049(),
          Divider(),
          ListTile(
            title: Text(
                'Flat Floor Rooms',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: Colors.black
                )
            ),
          ),
          Divider(),
          GH001(),
          Divider(),
          GH011(),
          Divider(),
          GH014(),
          Divider(),
          GH018(),
          Divider(),
          GH022(),
          Divider(),
          GH029(),
        ],
      ),
    );
  }

}