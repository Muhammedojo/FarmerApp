import 'package:dashboard/models/login_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:shared_preferences/shared_preferences.dart';
import 'dashboard_screen.dart';
import '../models/login_model.dart';
import 'package:dashboard/services/http_service.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final HttpService _httpService = HttpService();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  bool _isObscure = true;

  bool requestGranted = false;

  bool isLoggedIn = true;

  _showCircularProgress() {
    setState(() {
      requestGranted = true;
    });
  }

  _hideCircularProgress() {
    setState(() {
      requestGranted = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //key: globalKey,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        centerTitle: true,

        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back, color: Colors.black),
        ),

        // backgroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.black,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: Builder(
        builder: (context) {
          return Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Container(
                child: SafeArea(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 50.0),
                          const Center(
                            child: Text(
                              'LOGIN',
                              style: TextStyle(
                                fontSize: 33,
                                fontWeight: FontWeight.bold,
                                color: Colors.red,
                                letterSpacing: 3.1,
                              ),
                            ),
                          ),
                          const SizedBox(height: 20.0),
                          Container(
                            margin: const EdgeInsets.all(8.0),
                            child: TextField(
                              decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.person,
                                    color: Colors.blueGrey[900],
                                  ),
                                  border: InputBorder.none,
                                  hintText: "Username",
                                  hintStyle: TextStyle(
                                    color: Colors.blueGrey[900],
                                    fontSize: 15,
                                    letterSpacing: 2.1,
                                  )),
                              textInputAction: TextInputAction.next,
                              controller: nameController,
                            ),
                          ),

                          const SizedBox(height: 20.0),
                          Container(
                            margin: const EdgeInsets.all(8.0),
                            child: TextField(
                              obscureText: _isObscure,
                              decoration: InputDecoration(
                                  icon: Icon(
                                    Icons.lock,
                                    color: Colors.blueGrey[900],
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(_isObscure
                                        ? Icons.visibility
                                        : Icons.visibility_off),
                                    onPressed: () {
                                      setState(() {
                                        _isObscure = !_isObscure;
                                      });
                                    },
                                  ),
                                  border: InputBorder.none,
                                  hintText: 'Password',
                                  hintStyle: TextStyle(
                                    color: Colors.blueGrey[900],
                                    fontSize: 15,
                                    letterSpacing: 2.1,
                                  )),
                              controller: passwordController,
                              textInputAction: TextInputAction.done,
                            ),
                          ),

                          const SizedBox(height: 10.0),
                          requestGranted
                              ? const Center(
                                  child: CircularProgressIndicator(
                                      color: Colors.red))
                              : Center(
                                  child: Container(
                                    height: 50.0,
                                    margin: const EdgeInsets.all(10),
                                    child: RaisedButton(
                                      onPressed: () async {
                                        if (nameController.text.isNotEmpty &&
                                            passwordController
                                                .text.isNotEmpty) {
                                          _showCircularProgress();
                                          UserDetailsModel? user =
                                              await _httpService.login(
                                                  nameController.text.trim(),
                                                  passwordController.text
                                                      .trim());
                                          _hideCircularProgress();
                                          print("Test 1");
                                          if (user!.isRequestSuccessful()) {
                                            setLoggedIn();
                                            print("Test 1.5");
                                            _httpService.saveToken(user.token!);
                                            print("Test 2");
                                            print(user.token);
                                            Navigator.of(context)
                                                .pushReplacement(
                                              MaterialPageRoute(
                                                builder: (_) => const Dash(),
                                              ),
                                            );
                                          } else {
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                duration:
                                                    const Duration(seconds: 3),
                                                content: Text(user.message ??
                                                    "Invalid credentials"),
                                              ),
                                            );
                                            return;
                                          }
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            const SnackBar(
                                              duration: Duration(seconds: 3),
                                              content: Text(
                                                  'Enter Username and Password'),
                                            ),
                                          );
                                        }
                                      },
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(80.0)),
                                      padding: const EdgeInsets.all(0.0),
                                      child: Ink(
                                        decoration: BoxDecoration(
                                            color: Colors.blueGrey[900],
                                            borderRadius:
                                                BorderRadius.circular(30.0)),
                                        child: Container(
                                          constraints: const BoxConstraints(
                                              maxWidth: 250.0, minHeight: 50.0),
                                          alignment: Alignment.center,
                                          child: const Text(
                                            "Sign In",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15,
                                                letterSpacing: 2.1),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                          const SizedBox(
                            height: 20.0,
                          ),

                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 0, 0),
                            child: Row(
                              children: const [
                                Text(
                                  'Forgot Password',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 3.1,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20.0,
                          ),

                          //action bar for create account

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  // @override
  // void dispose() {
  //   nameController.dispose();
  //   passwordController.dispose();
  //   super.dispose();
  // }

  // Future<SharedPreferences> sharedPreferences() async =>
  //     await SharedPreferences.getInstance();

  Future<void> setLoggedIn() async {
    SharedPreferences value = await SharedPreferences.getInstance();
    // await sharedPreferences()
    // .then((value) => value.setBool('isLoggedIn', true));
    Future.delayed(const Duration(seconds: 1), () {
      value.setBool('isLoggedIn', true);
    });
  }
}
