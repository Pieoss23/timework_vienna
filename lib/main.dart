import 'package:flutter/material.dart';
import 'package:time_work/screen/home.dart';
import 'package:time_work/service/http_request.dart';

void main() {
  runApp(const MyApp());
  authenticate();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
