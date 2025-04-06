import 'package:ejary_cash/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

Widget loading(height) {
  return SizedBox(
    height: height,
    width: 100.w,
    child: Center(
      child: CircularProgressIndicator(
        color: LightMode.yellowColor,
      ),
    ),
  );
}
