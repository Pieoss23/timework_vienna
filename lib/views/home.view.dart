import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:http/http.dart';

import 'package:time_work/service/http_request.dart';
import 'package:time_work/views/loginPage.view.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isAuthenticated = false;
  @override
  void initState() {
    super.initState();
    authenticate().then((response) {
      setState(() {
        _isAuthenticated = response[0].status == 200;
      });

      // HERE WE CHECK IF ARE LOG IN OR NOT

      Get.to(LoginPage());
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
              ? const Text('✅Authentication successful!')
              : const Text('❌Authentication failed!'),
        ));
  }
}
