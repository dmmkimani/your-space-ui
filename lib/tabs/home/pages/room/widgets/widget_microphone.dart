import 'package:flutter/material.dart';

class Microphone extends StatefulWidget {
  final bool hasMic;

  const Microphone(this.hasMic, {Key? key}) : super(key: key);

  @override
  _MicrophoneState createState() => _MicrophoneState();
}

class _MicrophoneState extends State<Microphone> {
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
            child: Icon(Icons.mic, color: Colors.deepPurple),
          ),
          const Divider(thickness: 2.0),
          Icon(widget.hasMic ? Icons.check : Icons.clear,
              color: widget.hasMic ? Colors.green : Colors.red)
        ],
      ),
    );
  }
}
