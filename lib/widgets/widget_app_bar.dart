import 'package:flutter/material.dart';

class DefaultAppBar extends StatefulWidget {
  final String title;

  const DefaultAppBar(this.title, {Key? key}) : super(key: key);

  @override
  _DefaultAppBarState createState() => _DefaultAppBarState();
}

class _DefaultAppBarState extends State<DefaultAppBar> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 0.0,
        left: 0.0,
        right: 0.0,
        child: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          shape:
              const Border(bottom: BorderSide(color: Colors.grey, width: 0.2)),
          title: Text(
            widget.title,
            style: const TextStyle(color: Colors.black),
          ),
        )
    );
  }
}