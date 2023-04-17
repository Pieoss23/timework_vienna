import 'package:flutter/material.dart';
import 'package:time_work/service/http_request.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    authenticate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('USERS'),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {},
      ),
    );
  }
}
