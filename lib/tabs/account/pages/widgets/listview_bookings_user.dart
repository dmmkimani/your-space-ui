import 'package:flutter/material.dart';
import 'package:project/server/server.dart';
import 'package:project/tabs/account/pages/widgets/booking.dart';
import 'package:project/tabs/provider.dart';

class UserBookings extends StatefulWidget {
  final Server _server;
  final UserData _userData;
  final Map<String, dynamic> _bookings;
  final List<String> _bookingDates;
  final Function _refresh;

  const UserBookings(this._server, this._userData, this._bookings,
      this._bookingDates, this._refresh,
      {Key? key})
      : super(key: key);

  @override
  _UserBookingsState createState() => _UserBookingsState();
}

class _UserBookingsState extends State<UserBookings> {
  final key = GlobalKey<AnimatedListState>();

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
        key: key,
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        initialItemCount: widget._bookingDates.length,
        itemBuilder: (context, position, animation) {
          String bookingDate = widget._bookingDates[position];
          Map<String, dynamic> details = widget._bookings[bookingDate];
          return FutureBuilder(
              future: widget._server.getBuildingDetails(details['building']),
              builder: (BuildContext context,
                  AsyncSnapshot<Map<String, dynamic>> snapshot) {
                if (snapshot.data == null) {
                  return Container();
                } else {
                  details.addAll({
                    'bookingDate': bookingDate,
                    'buildingName': snapshot.requireData['name'],
                  });
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      buildBooking(position, details, animation),
                      (position != (widget._bookingDates.length - 1))
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

  Widget buildBooking(int position, Map<String, dynamic> details,
          Animation<double> animation) =>
      Booking(widget._server, widget._userData, position, details,
          removeFromList, widget._refresh, animation);

  void removeFromList(
      int position, Map<String, dynamic> details, bool isCancelling) {
    widget._bookingDates.removeAt(position);
    key.currentState!.removeItem(position,
        (context, animation) => buildBooking(position, details, animation));
    if (isCancelling) {
      widget._refresh('Booking cancelled.',
          bookings: widget._bookingDates.length);
    } else {
      widget._refresh('Booking deleted from your booking history.',
          bookings: widget._bookingDates.length);
    }
  }
}
