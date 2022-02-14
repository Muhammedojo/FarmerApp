import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:dashboard/models/cooperative_model.dart';
import 'package:dashboard/models/login_model.dart';
import 'package:dashboard/theme/theme_constant.dart';
import 'package:dashboard/theme/theme_manager.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'signup_screen.dart';
import '../services/http_service.dart';
import '../screens/dashboard_screen.dart';
import 'login_screen.dart';

ThemeManager _themeManager = ThemeManager();

class CooperativeDashboard extends StatefulWidget {
  const CooperativeDashboard({Key? key, UserModel? user}) : super(key: key);

  @override
  _CooperativeDashboardState createState() => _CooperativeDashboardState();
}

class _CooperativeDashboardState extends State<CooperativeDashboard> {
  //final HttpService _httpService = HttpService();

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
      home: Center(
        child: FutureBuilder<List<Data>?>(

            future: HttpService().getCooperative(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title:Text(snapshot.data![index].name) ,
                      );
                    });
              }
            }),
      ),
    );
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
