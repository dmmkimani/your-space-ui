import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:project/tabs/provider.dart';

import 'package:project/tabs/home/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

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
              FirebaseAuth _auth = FirebaseAuth.instance;
              User? _user = _auth.currentUser;
              GlobalData.auth = _auth;
              WidgetsBinding.instance!.addPostFrameCallback((_) {
                Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (context) {
                  if (_user != null) {
                    GlobalData.currentUser = _user;
                  }
                  return const HomePage();
                }));
              });
            }
            return loading;
          }),
    );
  }
}
