import 'package:flutter/material.dart';
import 'package:project/tabs/home/screens/building/drawer/tiles/room_category.dart';

class BuildingDrawer extends StatelessWidget {
  final String _building;
  final String _buildingName;
  final Map<String, dynamic> _categories;
  final Function _updatePage;

  const BuildingDrawer(
      this._building, this._buildingName, this._categories, this._updatePage,
      {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> categoriesList = _categories.keys.toList();
    categoriesList.sort();
    return Drawer(
      child: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(child: null),
          ListTile(
            onTap: () {
              _updatePage(false);
              Navigator.of(context).pop();
            },
            trailing: const Icon(Icons.navigate_next),
            title: Text(_buildingName,
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0,
                    color: Colors.black)),
          ),
          const Divider(),
          const Divider(),
          ListView.builder(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: categoriesList.length,
              itemBuilder: (BuildContext context, int position) {
                return RoomCategory(
                    context,
                    _building,
                    categoriesList[position],
                    _categories[categoriesList[position]],
                    _updatePage);
              }),
        ],
      ),
    );
  }
}
