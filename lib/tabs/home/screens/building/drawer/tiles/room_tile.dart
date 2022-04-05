import 'package:flutter/material.dart';
import 'package:project/server/server.dart';
import 'package:project/tabs/home/functions/room_helpers.dart';
import 'package:project/tabs/home/screens/room/room.dart';
import 'package:project/tabs/provider.dart';

class RoomTile extends StatelessWidget {
  final Server _server;
  final UserData _userData;
  final BuildContext _drawerContext;
  final String _building;
  final String _room;
  final Function _changeRoom;

  const RoomTile(this._server, this._userData, this._drawerContext,
      this._building, this._room, this._changeRoom,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        _changeRoom(true, room: Room(_server, _userData, _building, _room));
        Navigator.of(_drawerContext).pop();
      },
      title: Text(RoomHelperFunctions().formatRoom(_building, _room),
          style: const TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 18.0,
              color: Colors.black)),
      trailing: const Icon(Icons.navigate_next),
    );
  }
}
