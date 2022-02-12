import 'package:flutter/material.dart';

class AccountViewController extends StatefulWidget {
  final PageController _controller;

  const AccountViewController(this._controller, {Key? key}) : super(key: key);

  @override
  _AccountViewControllerState createState() => _AccountViewControllerState();
}

class _AccountViewControllerState extends State<AccountViewController> {
  bool bookingsView = true;
  bool accountInfoView = false;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 75.0,
      left: 0.0,
      right: 0.0,
      child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              border: Border(bottom: BorderSide(color: Colors.grey, width: 0.25))),
          padding: const EdgeInsets.only(top: 10.0, bottom: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        bookingsView = true;
                        accountInfoView = false;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 65.0,
                          height: 65.0,
                          child: Icon(
                            Icons.perm_contact_calendar,
                            size: 50.0,
                            color: bookingsView ? Colors.blue : Colors.grey,
                          ),
                        ),
                        Text(
                          'Your Bookings',
                          style: TextStyle(
                              color: bookingsView ? Colors.blue : Colors.grey),
                        ),
                      ],
                    ),
                  )
              ),
              Expanded(
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        bookingsView = false;
                        accountInfoView = true;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 65.0,
                          height: 65.0,
                          child: Icon(
                            Icons.info_outline,
                            size: 50.0,
                            color: accountInfoView ? Colors.blue : Colors.grey,
                          ),
                        ),
                        Text(
                          'Account Information',
                          style: TextStyle(
                              color: accountInfoView ? Colors.blue : Colors.grey),
                        ),
                      ],
                    ),
                  )
              ),
            ],
          )),
    );
  }
}
