import 'package:flutter/material.dart';

class Speakers extends StatefulWidget {
  final bool hasSpeakers;

  const Speakers(this.hasSpeakers, {Key? key}) : super(key: key);

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
          const Icon(Icons.speaker, color: Colors.deepPurple),
          const Divider(thickness: 2.0),
          Icon(widget.hasSpeakers ? Icons.check : Icons.clear,
              color: widget.hasSpeakers ? Colors.green : Colors.red)
        ],
      ),
    );
  }
}
