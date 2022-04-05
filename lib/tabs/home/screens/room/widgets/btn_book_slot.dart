import 'package:flutter/material.dart';
import 'package:project/server/server.dart';
import 'package:project/tabs/provider.dart';
import 'package:project/tabs/account/splash_screen_account.dart';
import 'package:project/tabs/home/screens/room/widgets/dialog_book.dart';

class BookSlotBtn extends StatefulWidget {
  final Server _server;
  final UserData _userData;
  final Function _refresh;
  final String _building;
  final String _room;
  final DateTime _date;
  final List<String> _timeSlots;
  final String _selectedTimeSlot;

  const BookSlotBtn(this._server, this._userData, this._refresh, this._building,
      this._room, this._date, this._timeSlots, this._selectedTimeSlot,
      {Key? key})
      : super(key: key);

  @override
  _BookSlotBtnState createState() => _BookSlotBtnState();
}

class _BookSlotBtnState extends State<BookSlotBtn> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        if (widget._userData.user == null) {
          Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) =>
                  AccountSplashScreen(widget._server, widget._userData)));
          return;
        }
        showDialog(
            context: context,
            builder: (context) => BookDialog(
                widget._server,
                widget._userData,
                widget._refresh,
                widget._building,
                widget._room,
                widget._date,
                widget._timeSlots,
                widget._selectedTimeSlot));
      },
      child: const Text('Book',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0),
          )),
          backgroundColor: MaterialStateProperty.all(Colors.green)),
    );
  }
}
