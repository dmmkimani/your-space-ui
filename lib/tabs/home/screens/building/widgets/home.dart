import 'package:flutter/material.dart';

class BuildingHome extends StatefulWidget {
  final String _building;
  final Map<String, dynamic> _details;

  const BuildingHome(this._building, this._details, {Key? key})
      : super(key: key);

  @override
  _BuildingHomeState createState() => _BuildingHomeState();
}

class _BuildingHomeState extends State<BuildingHome> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            'images/buildings/' + widget._building + '.jpg',
            width: double.infinity,
            height: 300.0,
            fit: BoxFit.cover,
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
            child: Text(
              widget._details['description'],
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                  color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
