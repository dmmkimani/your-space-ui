import 'package:flutter/material.dart';

class CustomAppBar extends StatefulWidget {
  final String title;

  const CustomAppBar(this.title, {Key? key}) : super(key: key);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();
}

class _CustomAppBarState extends State<CustomAppBar> {
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