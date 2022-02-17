import 'package:flutter/material.dart';
import 'package:project/tabs/account/screens/screen_account.dart';
import 'package:project/tabs/screen_splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wall Mounted Room Calendar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AccountPage(),
    );
  }
}
