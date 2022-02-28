import 'package:flutter/material.dart';
import 'package:project/tabs/account/screens/settings.dart';
import 'package:project/tabs/account/widgets/page_controller.dart';

class AccountAppBar extends StatefulWidget {
  final PageController _controller;

  const AccountAppBar(this._controller, {Key? key}) : super(key: key);

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
        child: Column(
          children: [
            AppBar(
              centerTitle: true,
              elevation: 0,
              backgroundColor: Colors.white,
              title: const Text(
                'Account',
                style: TextStyle(color: Colors.black),
              ),
              actions: <Widget>[
                InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SettingsScreen()));
                  },
                  child: Container(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: const Icon(Icons.settings, color: Colors.grey),
                  ),
                )
              ],
            ),
            AccountViewController(widget._controller)
          ],
        ));
  }
}
