import 'package:flutter/material.dart';
import 'package:project/tabs/home/screens/room/widgets/widget_microphone.dart';
import 'package:project/tabs/home/screens/room/widgets/widget_pc.dart';
import 'package:project/tabs/home/screens/room/widgets/widget_projector.dart';
import 'package:project/tabs/home/screens/room/widgets/widget_speakers.dart';

class AmenitiesTable extends StatefulWidget {
  final Map<String,dynamic> _amenities;

  const AmenitiesTable(this._amenities, {Key? key}) : super(key: key);

  @override
  _AmenitiesTableState createState() => _AmenitiesTableState();
}

class _AmenitiesTableState extends State<AmenitiesTable> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Table(
        children: [
          TableRow(children: [
            TableCell(child: Projector(widget._amenities['projector'] as bool)),
            TableCell(child: Microphone(widget._amenities['microphone'] as bool)),
            TableCell(child: PC(widget._amenities['pc'] as bool)),
            TableCell(child: Speakers(widget._amenities['speakers'] as bool))
          ])
        ],
      ),
    );
  }
}
