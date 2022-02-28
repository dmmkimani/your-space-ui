import 'package:flutter/material.dart';

class CapacityWidget extends StatelessWidget {
  final String _capacity;

  const CapacityWidget(this._capacity, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.event_seat, size: 32.5, color: Colors.deepPurple),
          const SizedBox(width: 5),
          Text(_capacity,
              style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}
