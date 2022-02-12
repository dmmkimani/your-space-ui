import 'package:flutter/material.dart';

class Speakers extends StatefulWidget {
  final bool _hasSpeakers;

  const Speakers(this._hasSpeakers, {Key? key}) : super(key: key);

  @override
  _SpeakersState createState() => _SpeakersState();
}

class _SpeakersState extends State<Speakers> {
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
            child: Icon(Icons.speaker, color: Colors.deepPurple),
          ),
          const Divider(thickness: 2.0),
          Icon(widget._hasSpeakers ? Icons.check : Icons.clear,
              color: widget._hasSpeakers ? Colors.green : Colors.red)
        ],
      ),
    );
  }
}
