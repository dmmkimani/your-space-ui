import 'package:flutter/material.dart';

import 'package:project/tabs/function_helpers.dart';

import 'package:project/tabs/account/pages/widgets/listview_bookings_user.dart';
import 'package:project/tabs/account/pages/widgets/no_bookings.dart';

class YourBookings extends StatefulWidget {
  final Map<String, dynamic> _response;

  const YourBookings(this._response, {Key? key}) : super(key: key);

  @override
  _YourBookingsState createState() => _YourBookingsState();
}

class _YourBookingsState extends State<YourBookings>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    if (widget._response['success']) {
      Map<String, dynamic> bookings = widget._response['response'];
      List<String> bookingDates = bookings.keys.toList();
      bookingDates.sort((b, a) => a.compareTo(b));
      return Container(
        padding: const EdgeInsets.only(top: 205.0, left: 20.0, right: 20.0),
        child: UserBookings(bookings, bookingDates, refresh),
      );
    } else {
      return Container(
        padding: const EdgeInsets.only(top: 200.0, left: 20.0, right: 20.0),
        child: const NoBookings(),
      );
    }
  }

  void refresh(String message) {
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {});
      if (message.isNotEmpty) {
        HelperFunctions().showSnackBar(context, message);
      }
    });
  }

  @override
  bool get wantKeepAlive => true;
}
