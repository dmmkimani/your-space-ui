import 'package:flutter/material.dart';
import 'package:project/tabs/account/pages/widgets/btn_delete.dart';
import 'package:project/tabs/account/pages/widgets/btn_edit.dart';

import '../../../provider.dart';
import '../../../function_helpers.dart';

class BookingsList extends StatefulWidget {
  final Map<String, dynamic> _bookings;

  const BookingsList(this._bookings, {Key? key}) : super(key: key);

  @override
  _BookingsListState createState() => _BookingsListState();
}

class _BookingsListState extends State<BookingsList> {
  @override
  Widget build(BuildContext context) {
    List<String> bookingDates = widget._bookings.keys.toList();
    bookingDates.sort((b, a) => a.compareTo(b));
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: bookingDates.length,
        itemBuilder: (BuildContext context, int position) {
          String bookingDate = bookingDates[position];
          Map<String, dynamic> details = widget._bookings[bookingDate];
          String endTime = details['to'];
          String description = details['description'];
          return FutureBuilder(
              future: GlobalData.server.getBuildingName(details['building']),
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                if (snapshot.data == null) {
                  return Container();
                } else {
                  return Column(
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
                                    details['room'].toString().toUpperCase() +
                                        ' in ' +
                                        snapshot.requireData,
                                    style: const TextStyle(
                                      fontSize: 17.0,
                                      fontWeight: FontWeight.bold,
                                    )),
                                Text(
                                    'From ' +
                                        details['from'] +
                                        ' to ' +
                                        details['to'] +
                                        ' on ' +
                                        HelperFunctions().formatDate(
                                            parseDate(bookingDate, endTime)),
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
                              ? const DeleteBtn()
                              : const EditBtn(),
                        ],
                      ),
                      (position != (bookingDates.length - 1))
                          ? Container(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 10.0),
                              child: const Divider(),
                            )
                          : const Divider(
                              color: Colors.transparent, thickness: 0.0)
                    ],
                  );
                }
              });
        });
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
