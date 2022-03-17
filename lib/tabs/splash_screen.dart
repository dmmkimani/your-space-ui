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
              FirebaseAuth auth = FirebaseAuth.instance;
              User? user = auth.currentUser;
              GlobalData.auth = auth;
              WidgetsBinding.instance!.addPostFrameCallback((_) {
                Navigator.of(context)
                    .pushReplacement(MaterialPageRoute(builder: (context) {
                  if (user != null) {
                    GlobalData.currentUser = user;
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
