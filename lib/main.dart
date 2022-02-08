import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import './screens/dashboard_screen.dart';
import './screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // bool user = false;

  @override
  void initState() {
    super.initState();
    _initCheck();
  }

  void _initCheck() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    bool CheckValue = prefs.containsKey('value');
    if (CheckValue) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (_) => const Dash(),
        ),
      );
    } else {
      MaterialPageRoute(
        builder: (_) => const LogIn(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AFEX Farmers',
      home: Home(),
    );
  }
}
