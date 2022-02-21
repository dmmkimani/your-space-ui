import 'package:flutter/material.dart';
import 'package:project/tabs/home/screens/room/icons/custom_icons.dart';

class KeyDialog extends StatelessWidget {
  const KeyDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Container(
              alignment: FractionalOffset.topRight,
              child: const Icon(Icons.close),
            ),
          ),
          const Text(
            'Key',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          )
        ],
      ),
      content: SizedBox(
        height: 300.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.event_seat, size: 30.0, color: Colors.deepPurple),
                SizedBox(width: 20.0),
                SizedBox(
                  width: 120.0,
                  child: Text('Capacity',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.normal,
                          color: Colors.black)),
                )
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(CustomIcons.icon_projector,
                    size: 32.5, color: Colors.deepPurple),
                SizedBox(width: 20.0),
                SizedBox(
                  width: 120.0,
                  child: Text('Projector',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.normal,
                          color: Colors.black)),
                )
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.mic, size: 30.0, color: Colors.deepPurple),
                SizedBox(width: 20.0),
                SizedBox(
                  width: 120.0,
                  child: Text('Microphone',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.normal,
                          color: Colors.black)),
                )
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.computer, size: 30.0, color: Colors.deepPurple),
                SizedBox(width: 20.0),
                SizedBox(
                  width: 120.0,
                  child: Text('PC',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.normal,
                          color: Colors.black)),
                )
              ],
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.speaker, size: 30.0, color: Colors.deepPurple),
                SizedBox(width: 20.0),
                SizedBox(
                  width: 120.0,
                  child: Text('Speakers',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.normal,
                          color: Colors.black)),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
