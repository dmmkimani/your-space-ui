import 'package:flutter/material.dart';
import 'package:project/server/server.dart';
import 'package:project/tabs/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  final bool? isLoggingIn;

  const MyApp({Key? key, this.isLoggingIn = false}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your Space',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      home: SplashScreen(Server(), widget.isLoggingIn!),
    );
  }
}
