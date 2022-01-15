import 'package:flutter/material.dart';

class Inputs extends StatefulWidget {
  const Inputs({Key? key}) : super(key: key);

  @override
  InputsState createState() => InputsState();
}

class InputsState extends State<Inputs> {
  static final email = TextEditingController();
  static final password = TextEditingController();
  static bool _isHidden = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: TextField(
            controller: email,
            textAlign: TextAlign.start,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Email',
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: TextField(
            controller: password,
            textAlign: TextAlign.start,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: 'Password',
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
        )
      ],
    );
  }

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  Map<String,String> getInputs() {
    return {
      'email' : email.text.toString(),
      'password' : password.text.toString()
    };
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}