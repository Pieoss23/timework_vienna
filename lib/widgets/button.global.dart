import 'package:flutter/material.dart';
import 'package:time_work/service/http_request.dart';
import 'package:time_work/utils/global.colors.dart';

class ButtonGlobal extends StatelessWidget {
  const ButtonGlobal({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: GlobalColors.tertiaryColor,
      onTap: () {
        // getEmployee(res),
        print('logged!');
      },
      child: Container(
        alignment: Alignment.center,
        height: 50,
        width: 180,
        decoration: BoxDecoration(
          color: GlobalColors.secondaryColor,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          'Entra',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
