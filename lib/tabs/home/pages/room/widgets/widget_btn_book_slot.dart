import 'package:flutter/material.dart';
import 'package:project/tabs/home/pages/room/widgets/widget_dialog_book.dart';

class BookSlotBtn extends StatefulWidget {
  final Function reload;
  final String building;
  final String room;
  final DateTime date;
  final List<String> timeSlots;
  final String selectedTimeSlot;

  const BookSlotBtn(this.reload, this.building, this.room, this.date, this.timeSlots,
      this.selectedTimeSlot,
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
        showDialog(
            context: context,
            builder: (context) {
              return BookDialog(widget.reload, widget.building, widget.room, widget.date,
                  widget.timeSlots, widget.selectedTimeSlot);
            });
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
