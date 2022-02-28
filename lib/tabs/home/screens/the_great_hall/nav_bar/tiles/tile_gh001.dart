import 'package:flutter/material.dart';
import 'package:project/tabs/home/screens/room/room.dart';

class GH001Tile extends StatelessWidget {
  final BuildContext _buildContext;
  final Function _changeRoom;

  const GH001Tile(this._buildContext, this._changeRoom, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        _changeRoom(const Room('the_great_hall', 'gh001'));
        Navigator.of(_buildContext).pop();
      },
      title: const Text(
          'GH001',
          style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 18.0,
              color: Colors.black
          )
      ),
      trailing: const Icon(Icons.navigate_next),
    );
  }
}