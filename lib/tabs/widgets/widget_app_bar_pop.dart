import 'package:flutter/material.dart';

class PopAppBar extends StatefulWidget {
  final BuildContext context;
  final String title;

  const PopAppBar(this.context, this.title, {Key? key}) : super(key: key);

  @override
  _PopAppBarState createState() => _PopAppBarState();
}

class _PopAppBarState extends State<PopAppBar> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 0.0,
        left: 0.0,
        right: 0.0,
        child: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios, color: Colors.grey),
            onPressed: () {
              Navigator.pop(widget.context);
            },
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          shape:
          const Border(bottom: BorderSide(color: Colors.grey, width: 0.2)),
          title: Text(
            widget.title,
            style: const TextStyle(color: Colors.black),
          ),
        ));
  }
}