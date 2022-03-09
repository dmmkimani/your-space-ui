import 'package:flutter/material.dart';
import 'package:project/tabs/home/functions/helpers.dart';
import 'package:project/tabs/home/screens/building/drawer/tiles/room_tile.dart';

class RoomCategory extends StatelessWidget {
  final BuildContext _drawerContext;
  final String _building;
  final String _category;
  final List<dynamic> _rooms;
  final Function _changeRoom;

  const RoomCategory(this._drawerContext, this._building, this._category,
      this._rooms, this._changeRoom,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    _rooms.sort();
    return Column(
      children: [
        ListTile(
          title: Text(RoomHelpers().formatTitle(_category),
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
                  RoomTile(
                      _drawerContext, _building, _rooms[position], _changeRoom),
                  const Divider()
                ],
              );
            }),
      ],
    );
  }
}
