import 'package:flutter/material.dart';
import 'package:project/tabs/home/functions/helpers.dart';
import 'package:project/tabs/home/screens/room/room.dart';

class RoomTile extends StatelessWidget {
  final BuildContext _drawerContext;
  final String _building;
  final String _room;
  final Function _changeRoom;

  const RoomTile(
      this._drawerContext, this._building, this._room, this._changeRoom,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        _changeRoom(true, room: Room(_building, _room));
        Navigator.of(_drawerContext).pop();
      },
      title: Text(RoomHelpers().formatRoom(_building, _room),
          style: const TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 18.0,
              color: Colors.black)),
      trailing: const Icon(Icons.navigate_next),
    );
  }
}
