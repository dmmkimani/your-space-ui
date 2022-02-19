import 'package:flutter/material.dart';
import 'package:project/tabs/account/pages/widgets/listview_bookings.dart';

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
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            Map<String, dynamic> bookings =
                snapshot.requireData['response'];
            return Container(
              padding:
                  const EdgeInsets.only(top: 185.0, left: 20.0, right: 20.0),
              child: BookingsList(bookings),
            );
          }
        });
  }

  @override
  bool get wantKeepAlive => true;
}
