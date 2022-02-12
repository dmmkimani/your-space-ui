import 'package:flutter/material.dart';
import 'package:project/tabs/home/screens/room/room.dart';

class GH014Tile extends StatelessWidget {
  final BuildContext _buildContext;
  final Function _changeRoom;

  const GH014Tile(this._buildContext, this._changeRoom, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: const Icon(Icons.arrow_forward_ios),
      title: const Text(
          'GH014',
          style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 18.0,
              color: Colors.black
          )
      ),
      onTap: () {
        _changeRoom(const Room('the_great_hall', 'gh014'));
        Navigator.of(_buildContext).pop();
      },
    );
  }
}