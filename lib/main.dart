import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:time_work/views/home.view.dart';
import 'package:time_work/service/http_request.dart';
import 'dart:io';

import 'package:time_work/utils/global.colors.dart';
import 'package:time_work/views/splash.view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Time Work ⏲️',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const SplashPage(),
    );
  }
}
