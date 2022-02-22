import 'package:flutter/material.dart';

class PasswordInput extends StatefulWidget {
  const PasswordInput({Key? key}) : super(key: key);

  @override
  PasswordInputState createState() => PasswordInputState();
}

class PasswordInputState extends State<PasswordInput> {
  static final password = TextEditingController();
  bool _isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextField(
        controller: password,
        textAlign: TextAlign.start,
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          hintText: 'Password',
          prefixIcon: const Icon(
            Icons.password
          ),
          suffixIcon: InkWell(
              onTap: _togglePasswordView,
              child: _isHidden
                  ? const Icon(Icons.visibility)
                  : const Icon(Icons.visibility_off)),
        ),
        obscureText: _isHidden,
        enableSuggestions: false,
        autocorrect: false,
      ),
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
}