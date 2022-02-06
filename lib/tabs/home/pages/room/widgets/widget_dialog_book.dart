import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:project/server/localhost.dart';
import 'package:project/tabs/home/pages/room/functions/helpers_room.dart';
import 'package:project/tabs/home/pages/room/widgets/widget_btn_book.dart';
import 'package:project/tabs/home/pages/room/widgets/widget_description_input.dart';
import 'package:project/tabs/home/pages/room/widgets/widget_drop_down_time_slots.dart';
import 'package:project/tabs/home/pages/room/widgets/widget_num_people.dart';

class BookDialog extends StatefulWidget {
  final Function reload;
  final String building;
  final String room;
  final DateTime date;
  final List<String> timeSlots;
  final String selectedTimeSlot;

  const BookDialog(this.reload, this.building, this.room, this.date,
      this.timeSlots, this.selectedTimeSlot,
      {Key? key})
      : super(key: key);

  @override
  BookDialogState createState() => BookDialogState();
}

class BookDialogState extends State<BookDialog> {
  late TimeSlotsDropDown from;
  late TimeSlotsDropDown to;

  @override
  Widget build(BuildContext context) {
    from = TimeSlotsDropDown(widget.timeSlots, widget.selectedTimeSlot);
    to = TimeSlotsDropDown(widget.timeSlots, widget.selectedTimeSlot);
    return AlertDialog(
      title: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              Navigator.pop(context);
              clearInputs();
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Container(
              alignment: FractionalOffset.topRight,
              child: const Icon(Icons.close),
            ),
          ),
          const Text(
            'Book Your Space',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
          )
        ],
      ),
      content: SizedBox(
        height: 350.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Text(
                'Date: ' + dayMonthYear(widget.date),
                style: const TextStyle(
                    fontSize: 16.0, fontStyle: FontStyle.normal),
              ),
            ),
            const Divider(),
            const NumPeople(),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  'From:',
                  style: TextStyle(fontSize: 16.0, fontStyle: FontStyle.normal),
                ),
                from,
                const Text(
                  'To:',
                  style: TextStyle(fontSize: 16.0, fontStyle: FontStyle.normal),
                ),
                to,
              ],
            ),
            const Divider(),
            const DescriptionInput(),
          ],
        ),
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: <Widget>[
        Container(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: BookBtn(book),
        )
      ],
    );
  }

  void book() async {
    Map<String, dynamic> response = await LocalHost().book({
      'building': widget.building,
      'room': widget.room,
      'date': RoomHelpers().formatDate(widget.date),
      'startTime': startTime,
      'details': details
    });
    Navigator.of(context).pop();
    clearInputs();
    widget.reload(response);
  }

  String dayMonthYear(DateTime date) {
    return DateFormat('d MMM yyyy').format(date);
  }

  String get date {
    return widget.date.day.toString() +
        '.' +
        widget.date.month.toString() +
        '.' +
        widget.date.year.toString();
  }

  String get numPeople {
    return NumPeopleState.numPeople.text;
  }

  String get startTime {
    return from.selectedTimeSlot;
  }

  int get duration {
    int fromTimeSlot = int.parse(from.selectedTimeSlot.split(':')[0]);
    int toTimeSlot = int.parse(to.selectedTimeSlot.split(':')[0]);
    return (toTimeSlot - fromTimeSlot);
  }

  String get description {
    return DescriptionInputState.description.text;
  }

  Map<String, dynamic> get details {
    return {
      'booker': 'dmmk@app.com',
      'duration': duration,
      'people': numPeople,
      'description': description
    };
  }

  void clearInputs() {
    NumPeopleState.numPeople.clear();
    DescriptionInputState.description.clear();
  }
}
