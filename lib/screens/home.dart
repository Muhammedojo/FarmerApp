import 'dart:async';

import 'package:flutter/material.dart';
import './login.dart';
import 'dash.dart';

class Home extends StatefulWidget {
  late final bool user;
  Home(this.user);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();
    startHome();
  }

  startHome() {
    var duration = const Duration(seconds: 3);
    return Timer(duration, () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (c) => widget.user ? const Dash() : const LogIn()),
      );
    });
  }

  // late SharedPreferences loginData;
  // late bool newUser;
  // late String username;
  // Future<SharedPreferences> sharedPreferences() async =>
  //     await SharedPreferences.getInstance();

  // void initial() async {
  //   loginData = await SharedPreferences.getInstance();
  //   setState(() {
  //     username = loginData.getString('username')!;
  //   });
  // }

  // void initialState() {
  //   super.initState();
  //   initial();
  // }

  // bool hasLoggedIn = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 100.0),
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset(
                    'assets/images/Afex.png',
                    width: 600,
                    height: 400,
                  ),
                ),
                const SizedBox(
                  height: 40.0,
                ),
                const Text(
                  "Lets Get Started. ",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'We are crazy enough to believe we can feed Africa',
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Container(
                  height: 50.0,
                  margin: const EdgeInsets.all(10),
                  child: RaisedButton(
                    onPressed: () {},
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80.0)),
                    padding: const EdgeInsets.all(0.0),
                    child: Ink(
                      decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Colors.red, Colors.grey],
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                          ),
                          borderRadius: BorderRadius.circular(30.0)),
                      child: Container(
                        constraints: const BoxConstraints(
                            maxWidth: 250.0, minHeight: 50.0),
                        alignment: Alignment.center,
                        child: const Text(
                          "Get Started",
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.white, fontSize: 15),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 150.0),
              ],
            ),
          ),
        ));
  }

  // Future <bool?> hasLoggedIn() async{
  //   return await sharedPreferences().then((value) => value.getBool('isLoggedIn', false));
  // }

  // Future<void> checkIfLoggedIn() async {
  //   bool hasLogged = hasLoggedIn;
  //   if (hasLogged) {
  //     Navigator.push(
  //         context, MaterialPageRoute(builder: (context) => const LogIn()));
  //   } else {
  //     Navigator.push(
  //         context, MaterialPageRoute(builder: (context) => const Dash()));
  //   }
  // }
}
