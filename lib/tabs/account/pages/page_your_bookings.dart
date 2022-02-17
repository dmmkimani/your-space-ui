import 'package:flutter/material.dart';

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
        future: loadWidgetData(),
        builder: (BuildContext context,
            AsyncSnapshot<Map<String, dynamic>> snapshot) {
          if (snapshot.data == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else {
            Map<String, dynamic> bookings = snapshot.requireData['response'];
            List<String> bookingDates = bookings.keys.toList();
            bookingDates.sort((b, a) => a.compareTo(b));
            return Container(
              padding:
                  const EdgeInsets.only(top: 185.0, left: 20.0, right: 20.0),
              child: ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: bookingDates.length,
                  itemBuilder: (BuildContext context, int position) {
                    Map<String, dynamic> details =
                        bookings[bookingDates[position]];
                    String description = details['description'];
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 250.0,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                      details['room'].toString().toUpperCase() +
                                          ' in The Great Hall', // CHANGE THIS
                                      style: const TextStyle(
                                        fontSize: 17.0,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  Text(
                                      'From ' +
                                          details['from'] +
                                          ' to ' +
                                          details['to'] +
                                          ' on Feb 16 2022', // CHANGE THIS
                                      style: const TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.normal,
                                      )),
                                  Text('For ' + details['people'] + ' people',
                                      style: const TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.normal,
                                      )),
                                  Text('\"$description\"',
                                      style: const TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.normal,
                                      )),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(15.0),
                              child: InkWell(
                                onTap: () {},
                                splashColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                child: const Icon(Icons.edit),
                              ),
                            )
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
                  }),
            );
          }
        });
  }

  Future<Map<String, dynamic>> loadWidgetData() async {
    return await GlobalData.server.getUserBookings('booker.csc354@gmail.com');
  }

  @override
  bool get wantKeepAlive => true;
}
