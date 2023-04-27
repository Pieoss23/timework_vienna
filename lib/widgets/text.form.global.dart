import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:time_work/utils/global.colors.dart';

class TextFormGlobal extends StatelessWidget {
  const TextFormGlobal(
      {Key? key,
      required this.controller,
      required this.text,
      required this.textInputType,
      required this.obscure})
      : super(key: key);
  final TextEditingController controller;
  final String text;
  final TextInputType textInputType;
  final bool obscure;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      padding: const EdgeInsets.only(
        top: 2,
        left: 16,
      ),
      decoration: BoxDecoration(
        color: GlobalColors.lightColor,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
          controller: controller,
          keyboardType: TextInputType.text,
          obscureText: obscure,
          cursorColor: GlobalColors.primaryColor,
          style: TextStyle(
            color: GlobalColors.darkColor,
          ),
          decoration: InputDecoration(
              hintText: text,
              border: InputBorder.none,
              hintStyle: TextStyle(
                color: GlobalColors.darkColor.withOpacity(0.4),
              ),
              contentPadding: const EdgeInsets.all(0)),
        ),
      ),
    );
  }
}
