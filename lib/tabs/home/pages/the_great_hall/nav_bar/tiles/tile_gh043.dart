import 'package:flutter/material.dart';
import 'package:project/tabs/home/pages/room.dart';

class GH043Tile extends StatelessWidget {
  final BuildContext _buildContext;
  final Function updatePage;

  const GH043Tile(this._buildContext, this.updatePage, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: const Icon(Icons.arrow_forward_ios),
      title: const Text(
          'GH043',
          style: TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 18.0,
              color: Colors.black
          )
      ),
      onTap: () {
        updatePage(const Room('the_great_hall', 'gh043'));
        Navigator.of(_buildContext).pop();
      },
    );
  }
}