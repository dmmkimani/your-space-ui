import 'package:flutter/material.dart';
import 'package:project/tabs/provider.dart';
import 'package:project/tabs/home/screens/room/widgets/widget_dialog_book.dart';

class BookSlotBtn extends StatefulWidget {
  final Function _reload;
  final String _building;
  final String _room;
  final DateTime _date;
  final List<String> _timeSlots;
  final String _selectedTimeSlot;

  const BookSlotBtn(this._reload, this._building, this._room, this._date,
      this._timeSlots, this._selectedTimeSlot,
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
        if (GlobalData.currentUser == null) {
          // Go to login page but keep this page alive
        }
        showDialog(
            context: context,
            builder: (context) => BookDialog(
                widget._reload,
                widget._building,
                widget._room,
                widget._date,
                widget._timeSlots,
                widget._selectedTimeSlot));
      },
      child: const Text('Book', style: TextStyle(color: Colors.white)),
      style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          )),
          backgroundColor: MaterialStateProperty.all(Colors.green)),
    );
  }
}
