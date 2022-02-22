import 'package:flutter/material.dart';
import 'package:project/tabs/account/widgets/btn_account_info.dart';
import 'package:project/tabs/account/widgets/btn_your_bookings.dart';

class AccountViewController extends StatefulWidget {
  final PageController _controller;

  const AccountViewController(this._controller, {Key? key}) : super(key: key);

  @override
  _AccountViewControllerState createState() => _AccountViewControllerState();
}

class _AccountViewControllerState extends State<AccountViewController> {
  bool isSelected = true;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 79.0,
      left: 0.0,
      right: 0.0,
      child: Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              border:
              Border(bottom: BorderSide(color: Colors.grey, width: 0.25))),
          padding: const EdgeInsets.only(top: 10.0, bottom: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                  child: InkWell(
                    onTap: () {
                      if (!isSelected) {
                        changePage();
                      }
                    },
                    child: YourBookingsBtn(isSelected),
                  )),
              Expanded(
                  child: InkWell(
                    onTap: () {
                      if (isSelected) {
                        changePage();
                      }
                    },
                    child: AccountInfoBtn(!isSelected),
                  )),
            ],
          )),
    );
  }

  void changePage() {
    setState(() {
      isSelected = !isSelected;
    });
    switch (isSelected) {
      case true:
        widget._controller.previousPage(
            duration: const Duration(milliseconds: 500), curve: Curves.ease);
        return;

      case false:
        widget._controller.nextPage(
            duration: const Duration(milliseconds: 500), curve: Curves.ease);
        return;
    }
  }
}
