import 'package:flutter/material.dart';
import 'package:project/tabs/home/screens/building/widgets/dialog_key.dart';

class BuildingAppBar extends StatefulWidget {
  final BuildContext _context;
  final GlobalKey<ScaffoldState> _key;
  final String _title;

  const BuildingAppBar(this._context, this._key, this._title, {Key? key})
      : super(key: key);

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
          leading: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                  padding: const EdgeInsets.only(left: 15.0),
                  constraints: const BoxConstraints(),
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.grey),
                  onPressed: () => Navigator.pop(widget._context)),
              IconButton(
                padding: const EdgeInsets.only(left: 5.0),
                constraints: const BoxConstraints(),
                icon: const Icon(Icons.menu, color: Colors.grey),
                onPressed: () => widget._key.currentState!.openDrawer(),
              ),
            ],
          ),
          actions: [
            IconButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return const KeyDialog();
                      });
                },
                icon: const Icon(Icons.info_outline, color: Colors.grey))
          ],
          leadingWidth: 75.0,
          titleSpacing: 0.0,
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          shape:
              const Border(bottom: BorderSide(color: Colors.grey, width: 0.2)),
          title: Text(
            widget._title,
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ));
  }
}
