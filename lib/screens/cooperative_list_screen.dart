import 'package:dashboard/models/cooperative.dart';
import 'package:flutter/material.dart';
import '../services/http_service.dart';

class Cooperative extends StatefulWidget {
  @override
  _CooperativeState createState() => _CooperativeState();
}

class _CooperativeState extends State<Cooperative> {
  final HttpService _client = HttpService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Info'),
      ),


    );
  }
}