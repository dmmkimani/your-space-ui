import 'package:flutter/material.dart';
import 'package:project/server/server.dart';
import 'package:project/tabs/home/functions/room_helpers.dart';
import 'package:project/tabs/home/screens/building/drawer/tiles/room_tile.dart';
import 'package:project/tabs/provider.dart';

class RoomCategory extends StatelessWidget {
  final Server _server;
  final UserData _userData;
  final BuildContext _drawerContext;
  final String _building;
  final String _category;
  final List<dynamic> _rooms;
  final Function _changeRoom;

  const RoomCategory(this._server, this._userData, this._drawerContext,
      this._building, this._category, this._rooms, this._changeRoom,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    _rooms.sort();
    return Column(
      children: [
        ListTile(
          title: Text(RoomHelperFunctions().formatRoomCategory(_category),
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                  color: Colors.black)),
        ),
        const Divider(),
        ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _rooms.length,
            itemBuilder: (BuildContext context, int position) {
              return Column(
                children: [
                  RoomTile(_server, _userData, _drawerContext, _building,
                      _rooms[position], _changeRoom),
                  const Divider()
                ],
              );
            }),
      ],
    );
  }
}
