import 'package:flutter/material.dart';
import 'package:project/tabs/home/functions/helpers.dart';
import 'package:project/tabs/home/screens/room/widgets/widget_date.dart';
import 'package:project/tabs/home/screens/room/widgets/widget_duration.dart';

import 'package:project/tabs/provider.dart';
import 'package:project/tabs/function_helpers.dart';

import 'package:project/tabs/home/screens/room/widgets/btn_book.dart';
import 'package:project/tabs/home/screens/room/widgets/textfield_description.dart';
import 'package:project/tabs/home/screens/room/widgets/dd_time_slots.dart';
import 'package:project/tabs/home/screens/room/widgets/widget_num_people.dart';

class BookDialog extends StatefulWidget {
  final Function _reload;
  final String _building;
  final String _room;
  final DateTime _date;
  final List<String> _timeSlots;
  final String _selectedTimeSlot;

  const BookDialog(this._reload, this._building, this._room, this._date,
      this._timeSlots, this._selectedTimeSlot,
      {Key? key})
      : super(key: key);

  @override
  _BookDialogState createState() => _BookDialogState();
}

class _BookDialogState extends State<BookDialog> {
  final ScrollController _controller = ScrollController();
  late TimeSlotsDropDown _from;
  late TimeSlotsDropDown _to;

  @override
  Widget build(BuildContext context) {
    _from =
        TimeSlotsDropDown(widget._timeSlots, widget._selectedTimeSlot, false);
    _to = TimeSlotsDropDown(widget._timeSlots, widget._selectedTimeSlot, false);
    return ScaffoldMessenger(child: Builder(
      builder: (dialogContext) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          body: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => Navigator.of(context).pop(),
            child: GestureDetector(
              onTap: () {},
              child: AlertDialog(
                title: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
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
                      style: TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                content: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  controller: _controller,
                  child: SizedBox(
                    height: 350.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        BookingDate(widget._date),
                        const Divider(),
                        const NumPeople(),
                        const Divider(),
                        BookingDuration(_from, _to),
                        const Divider(),
                        DescriptionInput(_controller),
                      ],
                    ),
                  ),
                ),
                actions: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: BookBtn(dialogContext, book),
                  )
                ],
                actionsAlignment: MainAxisAlignment.center,
              ),
            ),
          ),
        );
      },
    ));
  }

  void book(BuildContext dialogContext) async {
    Map<String, dynamic> response = await GlobalData.server.book({
      'userEmail': GlobalData.currentUser!.email,
      'date': RoomHelpers().formatDate(widget._date),
      'building': widget._building,
      'room': widget._room,
      'people': numPeople,
      'description': description,
      'startTime': startTime,
      'duration': duration,
    });
    FocusManager.instance.primaryFocus?.unfocus();
    switch (response['success']) {
      case true:
        Navigator.of(context).pop();
        clearInputs();
        widget._reload(response['message']);
        break;
      case false:
        HelperFunctions().showSnackBar(dialogContext, response['message']);
        break;
    }
  }

  String get date {
    return widget._date.day.toString() +
        '.' +
        widget._date.month.toString() +
        '.' +
        widget._date.year.toString();
  }

  String get startTime {
    return _from.selectedTimeSlot;
  }

  int get duration {
    int from = int.parse(_from.selectedTimeSlot.split(':')[0]);
    int to = int.parse(_to.selectedTimeSlot.split(':')[0]);
    return (to - from);
  }

  String get numPeople {
    return NumPeopleState.numPeople.text;
  }

  String get description {
    return DescriptionInputState.description.text;
  }

  void clearInputs() {
    NumPeopleState.numPeople.clear();
    DescriptionInputState.description.clear();
  }
}
