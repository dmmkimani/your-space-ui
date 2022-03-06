import 'package:flutter/material.dart';

class BuildingHome extends StatefulWidget {
  final Map<String, dynamic> _details;

  const BuildingHome(this._details, {Key? key}) : super(key: key);

  @override
  _BuildingHomeState createState() => _BuildingHomeState();
}

class _BuildingHomeState extends State<BuildingHome> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: 150.0,
        ),
        Container(
          padding: const EdgeInsets.only(bottom: 15.0),
          child: Text(
            widget._details['name'],
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22.0,
                color: Colors.black
            ),
          ),
        ),
        Text(
          widget._details['description'],
          textAlign: TextAlign.center,
          style: const TextStyle(
              fontWeight: FontWeight.normal,
              fontSize: 16.0,
              color: Colors.black
          ),
        ),
      ],
    );
  }
}
