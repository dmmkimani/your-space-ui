import 'package:flutter/material.dart';
import 'package:project/tabs/home/screens/room/icons/projector.dart';

class Projector extends StatefulWidget {
  final bool _hasProjector;

  const Projector(this._hasProjector, {Key? key}) : super(key: key);

  @override
  _ProjectorState createState() => _ProjectorState();
}

class _ProjectorState extends State<Projector> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 30.0,
            child: Icon(CustomIcons.icon_projector, color: Colors.deepPurple, size: 32.5),
          ),
          const Divider(thickness: 2.0),
          Icon(widget._hasProjector ? Icons.check : Icons.clear,
              color: widget._hasProjector ? Colors.green : Colors.red)
        ],
      ),
    );
  }
}
