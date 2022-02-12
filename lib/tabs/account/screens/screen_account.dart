import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project/tabs/account/widgets/widget_app_bar_account.dart';
import 'package:project/tabs/widgets/widget_app_bar.dart';

class AccountPage extends StatefulWidget {
  final User _user;

  const AccountPage(this._user, {Key? key}) : super(key: key);

  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final PageController _controller = PageController(initialPage: 0);
  final List<Widget> _pages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const DefaultAppBar('Account'),
          AccountViewController(_controller),
          PageView(
            controller: _controller,
            physics: const NeverScrollableScrollPhysics(),
            children: _pages,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}