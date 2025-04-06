import 'package:ejary_cash/core/constant/colors.dart';
import 'package:ejary_cash/view/screens/auth/register/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllChats extends StatelessWidget {
  const AllChats({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightMode.whiteColor,
      body: Column(
        children: [
          appBarSign(() {
            Get.back();
          }, "الرسائل")
        ],
      ),
    );
  }
}
