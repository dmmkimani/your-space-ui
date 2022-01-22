import 'package:flutter/material.dart';

class AccountAppBar extends StatefulWidget {
  const AccountAppBar({Key? key}) : super(key: key);

  @override
  _AccountAppBarState createState() => _AccountAppBarState();
}

class _AccountAppBarState extends State<AccountAppBar> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 0.0,
        left: 0.0,
        right: 0.0,
        child: AppBar(
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                  Icons.settings,
                  color: Colors.grey),
              onPressed: () {

              },
            )
          ],
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          shape:
          const Border(bottom: BorderSide(color: Colors.grey, width: 0.2)),
          title: const Text(
            'Account',
            style: TextStyle(color: Colors.black),
          ),
          bottom: const TabBar(
              indicatorColor: Colors.blue,
              unselectedLabelColor: Colors.grey,
              tabs: <Tab>[
                Tab(
                  icon: Icon(Icons.perm_contact_calendar, size: 65.0),
                  text: 'Your Bookings',
                ),
                Tab(
                  icon: Icon(Icons.info_outline, size: 65.0),
                  text: 'Account Information',
                )
              ]
          ),
        )
    );
  }
}