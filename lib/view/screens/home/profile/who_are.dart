import 'package:ejary_cash/core/constant/colors.dart';
import 'package:ejary_cash/generated/l10n.dart';
import 'package:ejary_cash/view/screens/auth/register/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class WhoAre extends StatelessWidget {
  const WhoAre({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightMode.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            appBarSign(() {
              Get.back();
            }, S.of(context).whoAreTitle),
            Container(
              width: 80.w,
              margin:
                  EdgeInsets.only(right: 7.w, left: 7.w, top: 7.w, bottom: 7.w),
              child: Text(
                S.of(context).whoAreText,
                textAlign: TextAlign.justify,
                style: GoogleFonts.tajawal(
                    height: 1.5,
                    fontSize: 5.w,
                    fontWeight: FontWeight.bold,
                    color: LightMode.blueColor),
              ),
            )
          ],
        ),
      ),
    );
  }
}
