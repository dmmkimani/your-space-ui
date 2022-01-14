import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart';

import 'package:project/server/localhost.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LocalHost server = LocalHost();
  static FirebaseAuth? auth;
  User? user;
  static final email = TextEditingController();
  static final password = TextEditingController();
  static bool _isHidden = true;

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      auth = FirebaseAuth.instance;
      user = auth?.currentUser;
      if (user != null) {
        // Go To Next Page
      }
    });
  }

  Widget logo = Container(
    padding: const EdgeInsets.only(bottom: 30.0),
    child: Image.asset(
      'images/su-logo.png',
      width: 300,
      height: 150,
      fit: BoxFit.fill,
    ),
  );

  Widget emailInput = Container(
    padding: const EdgeInsets.only(bottom: 10.0),
    child: TextField(
      controller: email,
      textAlign: TextAlign.start,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        hintText: 'Email',
      ),
    ),
  );

  Widget forgotPassword = Container(
    alignment: Alignment.center,
    padding: const EdgeInsets.symmetric(vertical: 10),
    child: GestureDetector(
      onTap: () {
        // Forgot Password
      },
      child: const Text(
        'Forgot Your Password?',
        style: TextStyle(color: Colors.blue),
      ),
    ),
  );

  void _togglePasswordView() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            logo,
            emailInput,
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
            ),
            forgotPassword,
            Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: SizedBox(
                  width: double.infinity,
                  height: 50.0,
                  child: ElevatedButton(
                    child: const Text('Login',
                        style: TextStyle(
                            fontWeight: FontWeight.normal, fontSize: 18.0)),
                    onPressed: () {
                      login();
                    },
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),
                      ),
                    ),
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }

  void login() async {
    String userEmail = email.text.toString();
    String userPassword = password.text.toString();

    auth?.authStateChanges().listen((User? user) {
      if (user != null) {
        setState(() {
          // User is logged in
        });
      } else {
        setState(() {
          // User is not logged in
        });
      }
    });

    if (filledIn(userEmail, userPassword)) {
      Map<String, String> body = {'email': userEmail, 'password': userPassword};
      final credentials = json.encode(body);

      Response response =
          await post(Uri.parse(server.localhost() + "/login"), body: credentials);

      String token = response.body.toString();

      try {
        await auth?.signInWithCustomToken(token);
      } on FirebaseAuthException catch (e) {
        // User will always be found... need to change this!
        if (e.code == 'user-not-found') {
          userNotFound();
        }
      }
    }
  }

  bool filledIn(String username, String password) {
    if (username.isNotEmpty && password.isNotEmpty) {
      return true;
    }

    Fluttertoast.showToast(
        msg: 'Please enter a username and password',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0);

    return false;
  }

  void userNotFound() {
    Fluttertoast.showToast(
        msg: 'Incorrect email address or password',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.SNACKBAR,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.grey,
        textColor: Colors.white,
        fontSize: 16.0);
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
