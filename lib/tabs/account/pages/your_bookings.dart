import 'package:flutter/material.dart';
import 'package:project/tabs/account/pages/widgets/listview_bookings_user.dart';
import 'package:project/tabs/account/pages/widgets/no_bookings.dart';
import 'package:project/tabs/function_helpers.dart';

import '../../provider.dart';

class YourBookings extends StatefulWidget {
  const YourBookings({Key? key}) : super(key: key);

  @override
  _YourBookingsState createState() => _YourBookingsState();
}

class _YourBookingsState extends State<YourBookings>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return FutureBuilder(
        future: GlobalData.server.getUserBookings('booker.csc354@gmail.com'),
        builder: (BuildContext context,
            AsyncSnapshot<Map<String, dynamic>> snapshot) {
          if (snapshot.data == null) {
            return Center(
              child: Container(
                padding: const EdgeInsets.only(top: 120.0),
                child: const CircularProgressIndicator(),
              ),
            );
          } else {
            if (snapshot.requireData['success']) {
              Map<String, dynamic> bookings = snapshot.requireData['response'];
              List<String> bookingDates = bookings.keys.toList();
              bookingDates.sort((b, a) => a.compareTo(b));
              return Container(
                padding:
                    const EdgeInsets.only(top: 205.0, left: 20.0, right: 20.0),
                child: UserBookings(bookings, bookingDates, refresh),
              );
            } else {
              return Container(
                padding:
                    const EdgeInsets.only(top: 200.0, left: 20.0, right: 20.0),
                child: const NoBookings(),
              );
            }
          }
        });
  }

  void refresh(String message) {
    setState(() {});
    if (message.isNotEmpty) {
      HelperFunctions().showSnackBar(context, message);
    }
  }

  @override
  bool get wantKeepAlive => true;
}
