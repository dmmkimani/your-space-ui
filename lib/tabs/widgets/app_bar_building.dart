import 'package:flutter/material.dart';
import 'package:project/tabs/home/widgets/dialog_key.dart';

class BuildingAppBar extends StatefulWidget {
  final BuildContext context;
  final String title;

  const BuildingAppBar(this.context, this.title, {Key? key}) : super(key: key);

  @override
  _BuildingAppBarState createState() => _BuildingAppBarState();
}

class _BuildingAppBarState extends State<BuildingAppBar> {
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
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(context: context, builder: (context) {
                    return const KeyDialog();
                  });
                },
                icon: const Icon(Icons.info_outline, color: Colors.grey))
          ],
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          shape:
              const Border(bottom: BorderSide(color: Colors.grey, width: 0.2)),
          title: Text(
            widget.title,
            style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ));
  }
}
