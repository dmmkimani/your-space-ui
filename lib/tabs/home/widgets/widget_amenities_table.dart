import 'package:flutter/material.dart';
import 'package:project/server/localhost.dart';
import 'package:project/tabs/home/widgets/widget_microphone.dart';
import 'package:project/tabs/home/widgets/widget_pc.dart';
import 'package:project/tabs/home/widgets/widget_projector.dart';
import 'package:project/tabs/home/widgets/widget_speakers.dart';

class AmenitiesTable extends StatefulWidget {
  final Map<String,dynamic> amenities;

  const AmenitiesTable(this.amenities, {Key? key}) : super(key: key);

  @override
  _AmenitiesTableState createState() => _AmenitiesTableState();
}

class _AmenitiesTableState extends State<AmenitiesTable> {
  static const String currentBuilding = "the_great_hall";
  static const String currentRoom = "gh001";
  static final LocalHost server = LocalHost();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: Table(
        children: [
          TableRow(children: [
            TableCell(child: Projector(widget.amenities['projector'] as bool)),
            TableCell(child: Microphone(widget.amenities['microphone'] as bool)),
            TableCell(child: PC(widget.amenities['pc'] as bool)),
            TableCell(child: Speakers(widget.amenities['speakers'] as bool))
          ])
        ],
      ),
    );
  }

  Future<bool> getAmenities() async {
    Map<String, dynamic> details =
        await server.getRoomDetails(currentBuilding, currentRoom);
    Map<String, dynamic> amenities = await details['amenities'];

    return true;
  }
}
