import 'package:flutter/material.dart';

import '../../../function_helpers.dart';

import 'package:project/tabs/account/pages/widgets/btn_delete.dart';
import 'package:project/tabs/account/pages/widgets/btn_amend.dart';

class Booking extends StatefulWidget {
  final int _position;
  final Map<String, dynamic> _details;
  final Function _deleteBooking;
  final Function _refresh;
  final Animation<double> _animation;

  const Booking(this._position, this._details, this._deleteBooking,
      this._refresh, this._animation,
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
                            HelperFunctions().formatDate(HelperFunctions()
                                .parseDate(bookingDate, endTime)),
                        style: const TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal,
                        )),
                    Text('"' + description + '"',
                        style: const TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.normal,
                            fontStyle: FontStyle.italic)),
                  ],
                ),
              ),
              hasBookingExpired(bookingDate, startTime)
                  ? DeleteBtn(
                      widget._position, widget._details, widget._deleteBooking)
                  : AmendBtn(widget._details, widget._refresh),
            ],
          ),
        ],
      ),
    );
  }

  bool hasBookingExpired(String bookingDate, String startTime) {
    int hour = HelperFunctions().timeSlotToInt(startTime);
    hour -= 3;
    startTime = HelperFunctions().intToTimeSlot(hour);
    return DateTime.now()
        .isAfter(HelperFunctions().parseDate(bookingDate, startTime));
  }
}
