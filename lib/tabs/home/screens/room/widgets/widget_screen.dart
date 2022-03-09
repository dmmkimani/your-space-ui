import 'package:flutter/material.dart';

class Screen extends StatefulWidget {
  final bool _hasScreen;

  const Screen(this._hasScreen, {Key? key}) : super(key: key);

  @override
  _ScreenState createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
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
            child: Icon(Icons.tv, color: Colors.deepPurple),
          ),
          const Divider(thickness: 2.0),
          Icon(widget._hasScreen ? Icons.check : Icons.clear,
              color: widget._hasScreen ? Colors.green : Colors.red)
        ],
      ),
    );
  }
}
