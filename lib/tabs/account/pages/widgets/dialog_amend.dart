import 'package:flutter/material.dart';
import 'package:project/tabs/account/pages/widgets/btn_cancel.dart';
import 'package:project/tabs/account/pages/widgets/btn_save.dart';
import 'package:project/tabs/function_helpers.dart';

import 'package:project/tabs/home/screens/room/widgets/dd_time_slots.dart';
import 'package:project/tabs/home/screens/room/widgets/textfield_description.dart';
import 'package:project/tabs/home/screens/room/widgets/widget_date.dart';
import 'package:project/tabs/home/screens/room/widgets/widget_duration.dart';
import 'package:project/tabs/home/screens/room/widgets/widget_num_people.dart';

import '../../../provider.dart';

class AmendDialog extends StatefulWidget {
  final int _position;
  final Map<String, dynamic> _details;
  final Function _refresh;
  final Function _removeFromList;

  const AmendDialog(
      this._position, this._details, this._refresh, this._removeFromList,
      {Key? key})
      : super(key: key);

  @override
  _AmendDialogState createState() => _AmendDialogState();
}

class _AmendDialogState extends State<AmendDialog> {
  final ScrollController _controller = ScrollController();
  late TimeSlotsDropDown _from;
  late TimeSlotsDropDown _to;

  @override
  Widget build(BuildContext context) {
    String date = widget._details['bookingDate'].toString().split('-')[0];
    String time = widget._details['bookingDate'].toString().split('-')[1];
    String from = widget._details['startTime'];
    String to = widget._details['endTime'];
    _from = TimeSlotsDropDown([from], from, true);
    _to = TimeSlotsDropDown([to], to, true);
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
                      'Amend Your Booking',
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
                        BookingDate(HelperFunctions().parseDate(date, time)),
                        const Divider(),
                        NumPeople(people: widget._details['people']),
                        const Divider(),
                        BookingDuration(_from, _to),
                        const Divider(),
                        DescriptionInput(_controller,
                            description: widget._details['description'])
                      ],
                    ),
                  ),
                ),
                actions: <Widget>[
                  Container(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20.0, bottom: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SaveBtn(dialogContext, amend),
                        const SizedBox(height: 15.0),
                        CancelBtn(cancel)
                      ],
                    ),
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

  void amend(BuildContext dialogContext) async {
    FocusManager.instance.primaryFocus?.unfocus();
    Map<String, dynamic> response = await GlobalData.server.amendBooking({
      'userEmail': GlobalData.auth!.currentUser!.email,
      'id': widget._details['id'],
      'building': widget._details['building'],
      'room': widget._details['room'],
      'date': widget._details['bookingDate'],
      'people': numPeople,
      'description': description
    });
    switch (response['success']) {
      case true:
        Navigator.of(context).pop();
        clearInputs();
        widget._refresh(response['message']);
        break;
      case false:
        HelperFunctions().showSnackBar(dialogContext, response['message']);
        break;
    }
  }

  void cancel() async {
    FocusManager.instance.primaryFocus?.unfocus();
    Navigator.of(context).pop();
    clearInputs();
    await GlobalData.server.cancelBooking({
      'userEmail': GlobalData.auth!.currentUser!.email,
      'id': widget._details['id'],
      'building': widget._details['building'],
      'room': widget._details['room'],
      'date': widget._details['bookingDate'],
      'startTime': widget._details['startTime'],
      'duration': duration
    });
    widget._removeFromList(widget._position, widget._details, true);
    widget._refresh('');
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
