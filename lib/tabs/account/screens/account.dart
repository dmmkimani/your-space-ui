import 'package:flutter/material.dart';
import 'package:project/tabs/account/pages/account_info.dart';
import 'package:project/tabs/account/pages/your_bookings.dart';

import 'package:project/tabs/widgets/app_bar_account.dart';
import 'package:project/tabs/widgets/bottom_nav_bar.dart';

import '../../provider.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

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
              builder: (BuildContext context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
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
                      YourBookings(snapshot.requireData['response']),
                      AccountInfo(snapshot.requireData['accountInfo'])
                    ],
                  );
                }
          }),
          AccountAppBar(_controller),
        ],
      ),
      bottomNavigationBar: BottomNavBar(1),
    );
  }

  Future<Map<String, dynamic>> loadPageData() async {
    return {
      'response': await GlobalData.server.getUserBookings(GlobalData.currentUser!.email!),
      'accountInfo': await GlobalData.server.getUserInfo(GlobalData.currentUser!.email!)
    };
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}