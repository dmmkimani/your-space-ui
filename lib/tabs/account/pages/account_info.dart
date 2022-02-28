import 'package:flutter/material.dart';
import 'package:project/tabs/account/pages/widgets/btn_edit_profile.dart';

class AccountInfo extends StatefulWidget {
  final Map<String, dynamic> _accountInfo;

  const AccountInfo(this._accountInfo, {Key? key}) : super(key: key);

  @override
  _AccountInfoState createState() => _AccountInfoState();
}

class _AccountInfoState extends State<AccountInfo>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      padding: const EdgeInsets.only(top: 205.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.only(top: 15.0, bottom: 5.0),
            child: Text(
              widget._accountInfo['name'],
              style:
                  const TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 5.0),
            child: Text(
              widget._accountInfo['email'],
              style: const TextStyle(
                  color: Colors.blue,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 5.0, bottom: 15.0),
            child: Text(
              widget._accountInfo['numBookings'].toString() + ' Bookings Made',
              style: const TextStyle(
                  color: Colors.grey,
                  fontSize: 16.0,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            width: 180.0,
            height: 47.5,
            child: EditProfileBtn(_editProfile),
          ),
        ],
      ),
    );
  }

  void _editProfile() {}

  @override
  bool get wantKeepAlive => true;
}
