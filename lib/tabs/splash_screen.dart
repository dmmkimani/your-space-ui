import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project/server/server.dart';

import 'package:project/tabs/provider.dart';

import 'package:project/tabs/home/home.dart';

class SplashScreen extends StatefulWidget {
  final Server _server;
  final UserData _userData;

  const SplashScreen(this._server, this._userData, {Key? key})
      : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Widget loading = const Center(
    child: CircularProgressIndicator(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: Firebase.initializeApp(),
          builder: (BuildContext context, AsyncSnapshot<FirebaseApp> snapshot) {
            if (snapshot.data != null) {
              FirebaseAuth auth = FirebaseAuth.instance;
              User? user = auth.currentUser;
              widget._userData.auth = auth;
              WidgetsBinding.instance!.addPostFrameCallback((_) {
                Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (context) {
                  if (user != null) {
                    widget._userData.user = user;
                  }
                  return HomePage(widget._server, widget._userData);
                }));
              });
            }
            return loading;
          }),
    );
  }
}
