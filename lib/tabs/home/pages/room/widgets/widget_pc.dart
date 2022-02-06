import 'package:flutter/material.dart';

class PC extends StatefulWidget {
  final bool hasPC;

  const PC(this.hasPC, {Key? key}) : super(key: key);

  @override
  _PCState createState() => _PCState();
}

class _PCState extends State<PC> {
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
            child: Icon(Icons.computer, color: Colors.deepPurple),
          ),
          const Divider(thickness: 2.0),
          Icon(widget.hasPC ? Icons.check : Icons.clear,
              color: widget.hasPC ? Colors.green : Colors.red)
        ],
      ),
    );
  }
}
