import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project/tabs/home/pages/room/widgets/widget_booking_duration.dart';
import 'package:project/tabs/home/pages/room/widgets/widget_btn_book.dart';
import 'package:project/tabs/home/pages/room/widgets/widget_description_input.dart';

class BookDialog extends StatefulWidget {
  final DateTime date;
  final List<String> timeSlots;
  final String selectedTimeSlot;

  const BookDialog(this.date, this.timeSlots, this.selectedTimeSlot, {Key? key})
      : super(key: key);

  @override
  _BookDialogState createState() => _BookDialogState();
}

class _BookDialogState extends State<BookDialog> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'Book Your Space',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
      content: SizedBox(
        height: 250.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              'Date: ' + formatDate(widget.date),
              style:
                  const TextStyle(fontSize: 16.0, fontStyle: FontStyle.normal),
            ),
            BookingDuration(widget.timeSlots, widget.selectedTimeSlot),
            const DescriptionInput(),
          ],
        ),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: <Widget>[
        Container(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: const BookBtn(),
        )
      ],
    );
  }

  String formatDate(DateTime date) {
    return DateFormat('d MMM yyyy').format(date);
  }
}
