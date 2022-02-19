import 'package:flutter/material.dart';
import 'package:project/tabs/account/pages/account_info.dart';
import 'package:project/tabs/account/pages/your_bookings.dart';

import 'package:project/tabs/account/widgets/widget_controller.dart';
import 'package:project/tabs/widgets/app_bar.dart';
import 'package:project/tabs/widgets/bottom_nav_bar.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final PageController _controller = PageController(initialPage: 0);
  final List<Widget> _pages = [const YourBookings(), const AccountInfo()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _controller,
            physics: const NeverScrollableScrollPhysics(),
            children: _pages,
          ),
          const DefaultAppBar('Account'),
          AccountViewController(_controller),
        ],
      ),
      bottomNavigationBar: BottomNavBar(1),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}