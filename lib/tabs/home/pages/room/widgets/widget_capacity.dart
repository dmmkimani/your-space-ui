import 'package:flutter/material.dart';

class CapacityWidget extends StatelessWidget {
  final String capacity;

  const CapacityWidget(this.capacity, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.event_seat, size: 35.0, color: Colors.deepPurple),
          const SizedBox(width: 10),
          Text(capacity,
              style: const TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.normal,
                  color: Colors.black))
        ],
      ),
    );
  }
}
