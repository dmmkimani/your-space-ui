import 'package:flutter/material.dart';

class DescriptionInput extends StatefulWidget {
  final ScrollController _controller;
  final String description;

  const DescriptionInput(this._controller, {this.description = '', Key? key})
      : super(key: key);

  @override
  DescriptionInputState createState() => DescriptionInputState();
}

class DescriptionInputState extends State<DescriptionInput> {
  static final description = TextEditingController();

  @override
  void initState() {
    if (widget.description.isNotEmpty) {
      description.text = widget.description;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: () {
        widget._controller.animateTo(
            widget._controller.position.maxScrollExtent + 55.0,
            duration: const Duration(milliseconds: 250),
            curve: Curves.ease);
      },
      keyboardType: TextInputType.multiline,
      textInputAction: TextInputAction.done,
      maxLines: 3,
      maxLength: 75,
      controller: description,
      textAlign: TextAlign.start,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Briefly describe the purpose of your booking...',
      ),
    );
  }
}
