import 'package:flutter/material.dart';

import 'tiles/auditorium.dart';
import 'tiles/tile_gh001.dart';
import 'tiles/tile_gh011.dart';
import 'tiles/tile_gh014.dart';
import 'tiles/tile_gh018.dart';
import 'tiles/tile_gh022.dart';
import 'tiles/tile_gh029.dart';
import 'tiles/tile_gh037.dart';
import 'tiles//tile_gh043.dart';
import 'tiles/tile_gh049.dart';

class GHNavBar extends StatelessWidget {
  final Function updatePage;

  const GHNavBar(this.updatePage, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(child: null),
          const Auditorium(),
          const Divider(),
          const Divider(),
          const ListTile(
            title: Text(
                'Tiered Lecture Theatres',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: Colors.black
                )
            ),
          ),
          const Divider(),
          GH037Tile(context, updatePage),
          const Divider(),
          GH043Tile(context, updatePage),
          const Divider(),
          GH049Tile(context, updatePage),
          const Divider(),
          const ListTile(
            title: Text(
                'Flat Floor Rooms',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: Colors.black
                )
            ),
          ),
          const Divider(),
          GH001Tile(context, updatePage),
          const Divider(),
          GH011(context, updatePage),
          const Divider(),
          GH014Tile(context, updatePage),
          const Divider(),
          GH018Tile(context, updatePage),
          const Divider(),
          GH022Tile(context, updatePage),
          const Divider(),
          GH029Tile(context, updatePage),
        ],
      ),
    );
  }
}