import 'package:flutter/material.dart';
import 'package:project/server/server.dart';
import 'package:project/tabs/account/pages/account_info.dart';
import 'package:project/tabs/account/pages/your_bookings.dart';

import 'package:project/tabs/widgets/app_bar_account.dart';
import 'package:project/tabs/widgets/bottom_nav_bar.dart';

import '../../provider.dart';

class AccountPage extends StatefulWidget {
  final Server _server;
  final UserData _userData;

  const AccountPage(this._server, this._userData, {Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final PageController _controller = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FutureBuilder(
              future: loadPageData(),
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
                  return PageView(
                    controller: _controller,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      YourBookings(widget._server, widget._userData,
                          snapshot.requireData['response'], refresh),
                      AccountInfo(snapshot.requireData['accountInfo'])
                    ],
                  );
                }
              }),
          AccountAppBar(widget._server, widget._userData, _controller),
        ],
      ),
      bottomNavigationBar: BottomNavBar(widget._server, widget._userData, 1),
    );
  }

  void refresh() {
    setState(() {});
  }

  Future<Map<String, dynamic>> loadPageData() async {
    return {
      'response':
          await widget._server.getUserBookings(widget._userData.user!.email!),
      'accountInfo':
          await widget._server.getUserInfo(widget._userData.user!.email!)
    };
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
