import 'package:flutter/material.dart';
import 'package:project/server/server.dart';
import 'package:project/tabs/home/functions/room_helpers.dart';
import 'package:project/tabs/provider.dart';

import '../../../helpers.dart';

import 'package:project/tabs/account/pages/widgets/btn_delete.dart';
import 'package:project/tabs/account/pages/widgets/btn_amend.dart';

class Booking extends StatefulWidget {
  final Server _server;
  final UserData _userData;
  final int _position;
  final Map<String, dynamic> _details;
  final Function _removeFromList;
  final Function _refresh;
  final Animation<double> _animation;

  const Booking(this._server, this._userData, this._position, this._details,
      this._removeFromList, this._refresh, this._animation,
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
    String startTime = widget._details['startTime'];
    String endTime = widget._details['endTime'];
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
                    Text(
                        RoomHelperFunctions()
                                .formatRoom(widget._details['building'], room) +
                            ' in ' +
                            buildingName,
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
              hasBookingStarted(bookingDate, startTime)
                  ? hasBookingExpired(bookingDate, endTime)
                      ? DeleteBtn(
                          widget._server,
                          widget._userData,
                          widget._position,
                          widget._details,
                          widget._removeFromList)
                      : Container()
                  : AmendBtn(widget._server, widget._userData, widget._position,
                      widget._details, widget._refresh, widget._removeFromList),
            ],
          ),
        ],
      ),
    );
  }

  bool hasBookingStarted(String bookingDate, String startTime) {
    return DateTime.now()
        .isAfter(HelperFunctions().parseDate(bookingDate, startTime));
  }

  bool hasBookingExpired(String bookingDate, String endTime) {
    return DateTime.now()
        .isAfter(HelperFunctions().parseDate(bookingDate, endTime));
  }
}
