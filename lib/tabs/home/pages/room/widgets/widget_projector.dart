import 'package:flutter/material.dart';

class Projector extends StatefulWidget {
  final bool hasProjector;

  const Projector(this.hasProjector, {Key? key}) : super(key: key);

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
          const Icon(Icons.details, color: Colors.deepPurple),
          const Divider(thickness: 2.0),
          Icon(widget.hasProjector ? Icons.check : Icons.clear,
              color: widget.hasProjector ? Colors.green : Colors.red)
        ],
      ),
    );
  }
}
