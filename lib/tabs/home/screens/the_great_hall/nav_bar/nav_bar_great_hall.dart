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
  final Function _changeRoom;

  const GHNavBar(this._changeRoom, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        physics: const BouncingScrollPhysics(),
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
          GH037Tile(context, _changeRoom),
          const Divider(),
          GH043Tile(context, _changeRoom),
          const Divider(),
          GH049Tile(context, _changeRoom),
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
          GH001Tile(context, _changeRoom),
          const Divider(),
          GH011(context, _changeRoom),
          const Divider(),
          GH014Tile(context, _changeRoom),
          const Divider(),
          GH018Tile(context, _changeRoom),
          const Divider(),
          GH022Tile(context, _changeRoom),
          const Divider(),
          GH029Tile(context, _changeRoom),
        ],
      ),
    );
  }
}