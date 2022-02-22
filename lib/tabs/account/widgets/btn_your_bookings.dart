import 'package:flutter/material.dart';

class YourBookingsBtn extends StatefulWidget {
  bool isSelected;

  YourBookingsBtn(this.isSelected, {Key? key}) : super(key: key);

  @override
  _YourBookingsBtnState createState() => _YourBookingsBtnState();
}

class _YourBookingsBtnState extends State<YourBookingsBtn> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 65.0,
          height: 65.0,
          child: Icon(
            Icons.perm_contact_calendar,
            size: 50.0,
            color: widget.isSelected ? Colors.blue : Colors.grey,
          ),
        ),
        Text(
          'Your Bookings',
          style:
              TextStyle(color: widget.isSelected ? Colors.blue : Colors.grey),
        ),
      ],
    );
  }
}
