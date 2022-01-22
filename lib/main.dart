import 'package:flutter/material.dart';

import 'package:project/tabs/account/pages/page_account.dart';
import 'package:project/tabs/home/pages/home_page.dart';
import 'package:project/tabs/account/pages/page_login.dart';
import 'package:project/tabs/home/pages/room.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wall Mounted Room Calendar',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Room(),
    );
  }
}