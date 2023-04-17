import 'package:flutter/material.dart';
import 'package:time_work/service/http_request.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isAuthenticated = false;
  @override
  void initState() {
    super.initState();
    authenticate().then((isAuthenticated) {
      _isAuthenticated = isAuthenticated as bool;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Auth'),
        ),
        body: Center(
          child: _isAuthenticated
              ? const Text('✔️Authentication successful!')
              : const Text('❌Authentication failed!'),
        ));
  }
}
