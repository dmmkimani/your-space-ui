import 'package:flutter/material.dart';
import 'package:project/server/localhost.dart';

class GH001 extends StatefulWidget {
  const GH001({Key? key}) : super(key: key);

  @override
  _GH001State createState() => _GH001State();
}

class _GH001State extends State<GH001> {
  static const String currentBuilding = "the_great_hall";
  static const String currentRoom = "gh001";
  static final LocalHost server = LocalHost();

  Widget title = Container(
    padding: const EdgeInsets.all(20.0),
    child: Text(
      currentRoom.toUpperCase(),
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.bold
      ),
    ),
  );

  Widget capacity = FutureBuilder(
      future: server.getCapacity(currentBuilding, currentRoom),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        // Might need switch statements here
        Widget _widget;
        if (snapshot.data == null) {
          _widget = const CircularProgressIndicator();
        } else {
          _widget = Container(
              padding: const EdgeInsets.only(left: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.event_seat, size: 50.0),
                  const SizedBox(width: 10),
                  Text(snapshot.requireData,
                      style: const TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)
                  )
                ],
              ));
        }
        return _widget;
      });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          title,
          capacity
        ],
      ),
    );
  }
}
