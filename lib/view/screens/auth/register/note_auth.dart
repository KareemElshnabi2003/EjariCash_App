import 'package:ejary_cash/core/constant/colors.dart';
import 'package:ejary_cash/generated/l10n.dart';
import 'package:ejary_cash/view/screens/auth/register/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class NotePage extends StatelessWidget {
  const NotePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightMode.whiteColor,
      body: Column(
        children: [
          appBarSign(() {
            Get.back();
          }, S.of(context).signup),
          Container(
            margin: EdgeInsets.only(right: 7.w, left: 7.w),
            alignment: Alignment.center,
            height: 70.h,
            width: 100.w,
            child: Text(
              "يجب مراعاة البيانات الخاصة بك وكتابتها بشكل صحيح ",
              textAlign: TextAlign.center,
              style: GoogleFonts.tajawal(
                  fontSize: 5.w,
                  color: LightMode.blackColor,
                  fontWeight: FontWeight.w700),
            ),
          ),
          btnClick("التالي", () {
            Get.to(() => const SignUp(),
                transition: Transition.leftToRightWithFade,
                duration: const Duration(milliseconds: 800));
          }, LightMode.whiteColor, LightMode.blueColor, LightMode.blueColor)
        ],
      ),
    );
  }
}
