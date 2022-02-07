import 'package:dashboard/models/cooperative.dart';
import 'package:flutter/material.dart';
import '../services/http_service.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final HttpService _client = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Info'),
      ),
      body: Center(
        child: FutureBuilder<Cooperative?>(
          future: _client.getCooperative(id: '1'),
          builder: (context, snapshot) {

            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}