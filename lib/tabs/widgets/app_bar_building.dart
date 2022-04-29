import 'package:flutter/material.dart';
import 'package:project/tabs/home/screens/building/widgets/dialog_key.dart';
import 'package:popup_menu/popup_menu.dart';
import 'package:project/tabs/provider.dart';

class BuildingAppBar extends StatefulWidget {
  final BuildContext _context;
  final UserData _userData;
  final GlobalKey<ScaffoldState> _key;
  final String _title;

  const BuildingAppBar(this._context, this._userData, this._key, this._title,
      {Key? key})
      : super(key: key);

  @override
  _BuildingAppBarState createState() => _BuildingAppBarState();
}

class _BuildingAppBarState extends State<BuildingAppBar> {
  final GlobalKey menuIcon = GlobalKey();

  final PopupMenu tip = PopupMenu(
      backgroundColor: Colors.blue,
      highlightColor: Colors.blue,
      maxColumn: 1,
      items: [
        MenuItem(
            title: 'Tap Here to View the List of Rooms',
            textStyle: const TextStyle(
                fontSize: 15.0,
                color: Colors.white,
                fontWeight: FontWeight.bold))
      ]);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance!
        .addPostFrameCallback((_) => tip.show(widgetKey: menuIcon));
  }

  @override
  Widget build(BuildContext context) {
    PopupMenu.context = context;
    PopupMenu.itemWidth = 275.0;
    PopupMenu.itemHeight = 50.0;
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
                key: menuIcon,
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
