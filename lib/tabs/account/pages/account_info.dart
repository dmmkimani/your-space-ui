import 'package:flutter/material.dart';

class AccountInfo extends StatefulWidget {
  const AccountInfo({Key? key}) : super(key: key);

  @override
  _AccountInfoState createState() => _AccountInfoState();
}

class _AccountInfoState extends State<AccountInfo>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 3,
        itemBuilder: (BuildContext context, int position) {
          return Container(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center, children: []));
        });
  }

  @override
  bool get wantKeepAlive => true;
}
