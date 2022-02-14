import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import '../screens/dashboard_screen.dart';
import '../screens/cooperative_list_screen.dart';
import '../screens/signup_screen.dart';

class Nav extends StatefulWidget {
  const Nav({Key? key}) : super(key: key);

  @override
  _NavState createState() => _NavState();
}

class _NavState extends State<Nav> {
  int currentIndex = 0;
  List pages = const [Dash(),CooperativeDashboard(),SignUp(),];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
        bottomNavigationBar: ConvexAppBar(
            backgroundColor: Colors.blueGrey[900],
            items: const [

              TabItem(icon: Icons.person, title: 'Farmers'),
              TabItem(icon: Icons.people, title: 'Cooperatives'),
              TabItem(icon: Icons.add_chart, title: 'Chart'),
            ],
            initialActiveIndex: 0,
            onTap:(int i){
              setState(() {
                currentIndex =i;
              });
            }
        )
    );
  }
}
