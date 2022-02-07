import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:dashboard/models/login_model.dart';
import 'package:dashboard/theme/theme_constant.dart';
import 'package:dashboard/theme/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import './signup.dart';
import '../services/http_service.dart';
import 'login.dart';

ThemeManager _themeManager = ThemeManager();

class Dash extends StatefulWidget {
  const Dash({Key? key, UserModel? user}) : super(key: key);

  @override
  _DashState createState() => _DashState();
}

class _DashState extends State<Dash> {
  final HttpService _httpService = HttpService();

  @override
  void dispose() {
    _themeManager.removeListener(themeListener);
    super.dispose();
  }

  @override
  void initState() {
    _themeManager.addListener(themeListener);
    super.initState();
  }

  themeListener() {
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: lightTheme,
        darkTheme: darkTheme,
        themeMode: _themeManager.themeMode,
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.blueGrey[900],
              actions: [
                IconButton(
                  onPressed: () async {
                    logOut();
                  },
                  icon: const Icon(Icons.logout),
                  color: Colors.white,
                ),
                Switch(
                  value: _themeManager.themeMode == ThemeMode.dark,
                  onChanged: (newValue) {
                    _themeManager.toggleTheme(newValue);
                  },
                )
              ],
            ),
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: const Search(),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: const [
                      Text(
                        "Registered Farmers",
                        style: TextStyle(
                          color: Colors.blueGrey,
                          fontSize: 20,
                          letterSpacing: 2.1,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: ListView.builder(
                        itemCount: 5,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 2,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 20),
                            child: ListTile(
                                onTap: () {},
                                title: const Text('Folio ID :'),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    SizedBox(height: 10),
                                    Text(
                                      'Muhammad',
                                      style: TextStyle(
                                        fontSize: 17.0,
                                        color: Colors.blueGrey,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text('Cooperative ID :'),
                                  ],
                                ),
                                leading: const CircleAvatar(
                                  radius: 30.0,
                                  backgroundImage:
                                      AssetImage('assets/images/girl.jpeg'),
                                  backgroundColor: Colors.blueGrey,
                                )),
                          );
                        }))
              ],
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.miniEndFloat,
            floatingActionButton: FloatingActionButton(
                child: const Icon(Icons.person_add),
                backgroundColor: Colors.blueGrey[900],
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const SignUp()));
                }),
            bottomNavigationBar: ConvexAppBar(
              backgroundColor: Colors.blueGrey[900],
              items: const [
                TabItem(icon: Icons.home, title: 'Home'),
                TabItem(icon: Icons.map, title: 'Discovery'),
                TabItem(icon: Icons.message, title: 'Message'),
                TabItem(icon: Icons.people, title: 'Profile'),
              ],
            )));
  }

  void logOut() async {
    SharedPreferences value = await SharedPreferences.getInstance();
    value.setString('token', '');
    value.setBool('login', false);
    value.commit();
    value.remove('token');
    Navigator.of(context).push(MaterialPageRoute(
      builder: (BuildContext context) => const LogIn(),
    ));
  }
}

class Search extends StatelessWidget {
  const Search({
    Key? key,
  }) : super(key: key);

  onSearch(String search) {}

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: TextField(
        onChanged: (value) => onSearch(value),
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: const Icon(Icons.search),
          hintText: "Search",
          hintStyle: TextStyle(color: Colors.blueGrey[900], letterSpacing: 2.0),
          //onChanged: searchOperation,
        ),
      ),
    );
  }
}
