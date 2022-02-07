import 'package:flutter/material.dart';
import '../screens/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool user = false;
  @override
  void initState() {
    super.initState();
    _initCheck();
  }

  void _initCheck() async {
    SharedPreferences value = await SharedPreferences.getInstance();
    if (value.getBool('user') != null) {
      setState(() {
        user = value.getBool('user')!;
      });
    }
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AFEX Farmers',
      home: Home(user),
    );
  }
}
