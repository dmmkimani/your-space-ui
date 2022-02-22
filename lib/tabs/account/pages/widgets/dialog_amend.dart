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
  final Map<String, dynamic> _details;
  final Function _refresh;

  const AmendDialog(this._details, this._refresh, {Key? key}) : super(key: key);

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
    String from = widget._details['from'];
    String to = widget._details['to'];
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
                        const NumPeople(),
                        const Divider(),
                        BookingDuration(_from, _to),
                        const Divider(),
                        DescriptionInput(_controller)
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
                        const CancelBtn()
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
    Map<String, dynamic> response = await GlobalData.server.amendBooking({
      'userEmail': GlobalData.auth!.currentUser!.email,
      'id': widget._details['id'],
      'building': widget._details['building'],
      'room': widget._details['room'],
      'date': widget._details['bookingDate'],
      'people': widget._details['people'],
      'description': widget._details['description']
    });
    FocusManager.instance.primaryFocus?.unfocus();
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

  void clearInputs() {
    NumPeopleState.numPeople.clear();
    DescriptionInputState.description.clear();
  }
}
