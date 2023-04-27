import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:time_work/utils/global.colors.dart';
import 'package:time_work/views/home.view.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 1), () {
      Get.to(HomePage());
    });
    return Scaffold(
      backgroundColor: GlobalColors.tertiaryColor,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'v_logo.png',
            ),
          ],
        ),
      ),
    );
  }
}
