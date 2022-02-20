import 'package:flutter/material.dart';

import '../../../function_helpers.dart';

import 'package:project/tabs/account/pages/widgets/btn_delete.dart';
import 'package:project/tabs/account/pages/widgets/btn_edit.dart';

class Booking extends StatefulWidget {
  final int _position;
  final Map<String, dynamic> _details;
  final Function _deleteBooking;
  final Animation<double> _animation;

  const Booking(
      this._position, this._details, this._deleteBooking, this._animation,
      {Key? key})
      : super(key: key);

  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  @override
  Widget build(BuildContext context) {
    String bookingDate = widget._details['bookingDate'];
    String buildingName = widget._details['buildingName'];
    String room = widget._details['room'];
    String startTime = widget._details['from'];
    String endTime = widget._details['to'];
    String description = widget._details['description'];

    return SizeTransition(
      sizeFactor: widget._animation,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width - 120.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(room.toUpperCase() + ' in ' + buildingName,
                        style: const TextStyle(
                          fontSize: 17.0,
                          fontWeight: FontWeight.bold,
                        )),
                    Text(
                        'From ' +
                            startTime +
                            ' to ' +
                            endTime +
                            ' on ' +
                            HelperFunctions()
                                .formatDate(parseDate(bookingDate, endTime)),
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal,
                        )),
                    Text('\"$description\"',
                        style: const TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.italic)),
                  ],
                ),
              ),
              hasBookingExpired(bookingDate, endTime)
                  ? DeleteBtn(
                      widget._position, widget._details, widget._deleteBooking)
                  : const EditBtn(),
            ],
          ),
        ],
      ),
    );
  }

  bool hasBookingExpired(String bookingDate, String endTime) {
    return DateTime.now().isAfter(parseDate(bookingDate, endTime));
  }

  DateTime parseDate(String date, String endTime) {
    String day = date.split('.')[0].toString();
    String month = date.split('.')[1].toString();
    String year = date.split('.')[2].toString();

    if (month.length == 1) {
      month = '0$month';
    }

    return DateTime.parse('$year-$month-$day $endTime:00.000');
  }
}
