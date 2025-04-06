import 'package:ejary_cash/core/constant/colors.dart';
import 'package:ejary_cash/core/constant/images.dart';
import 'package:ejary_cash/generated/l10n.dart';
import 'package:ejary_cash/main.dart';
import 'package:ejary_cash/view/screens/auth/login/login.dart';
import 'package:ejary_cash/view/screens/auth/register/note_auth.dart';
import 'package:ejary_cash/view/screens/home/home.dart';
import 'package:ejary_cash/view/screens/on_boarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class MainAuth extends StatelessWidget {
  const MainAuth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightMode.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            appBarMainRegister(() {
              Navigator.canPop(context)
                  ? Get.back()
                  : Get.off(() => const OnBoarding());
            }, () {
              sharedPreferences!.setBool("visit", true);
              Get.offAll(() => const Home(),
                  transition: Transition.leftToRightWithFade,
                  duration: const Duration(milliseconds: 800));
            }, context),
            Container(
              width: 100.w,
              height: 40.h,
              margin: EdgeInsets.all(7.w),
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(ImagesLink.mainAuthImage),
                      fit: BoxFit.fill)),
            ),
            Container(
                margin: EdgeInsets.only(
                    right: 7.w, left: 7.w, bottom: 4.w, top: 5.h),
                child: Text(
                  S.of(context).mainAuth,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.tajawal(
                      fontSize: 5.w,
                      fontWeight: FontWeight.w600,
                      color: LightMode.blackColor),
                )),
            btnClick(S.of(context).login, () {
              Get.to(() => const Login(),
                  transition: Transition.leftToRightWithFade,
                  duration: const Duration(milliseconds: 800));
            }, LightMode.whiteColor, LightMode.blueColor, LightMode.blueColor),
            SizedBox(
              height: 2.h,
            ),
            btnClick(S.of(context).signup, () {
              Get.to(() => const NotePage(),
                  transition: Transition.leftToRightWithFade,
                  duration: const Duration(milliseconds: 800));
            }, LightMode.yellowColor, LightMode.yellowColor,
                LightMode.whiteColor),
            SizedBox(
              height: 5.w,
            ),
          ],
        ),
      ),
    );
  }
}

Widget appBarMainRegister(onPressback, onPressSkip, context) {
  return Container(
    margin: EdgeInsets.only(top: 7.h, right: 7.w, left: 7.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: onPressback,
          child: Container(
            width: 10.w,
            height: 7.w,
            decoration: BoxDecoration(
               gradient: LinearGradient(colors: [
            LightMode.blueColor,
            LightMode.blueColor.withOpacity(.8),
          ]),
                borderRadius: BorderRadius.circular(3.w),
                color: LightMode.blueColor),
            child: Icon(
              Icons.arrow_back,
              size: 6.w,
              color: LightMode.whiteColor,
            ),
          ),
        ),
        textClik(onPressSkip, S.of(context).skip)
      ],
    ),
  );
}

Widget textClik(onPress, title) {
  return TextButton(
      onPressed: onPress,
      child: Text(
        title,
        style: GoogleFonts.tajawal(
            fontSize: 4.w,
            color: LightMode.yellowColor,
            fontWeight: FontWeight.w700),
      ));
}

Widget btnClick(title, onPress, colorText, colorBorder, colorBackGround) {
  return InkWell(
    onTap: onPress,
    child: Container(
      margin: EdgeInsets.only(right: 5.w, left: 5.w),
      width: 100.w,
      height: 6.h,
      decoration: BoxDecoration(
          border: Border.all(color: colorBorder, width: 2),
          borderRadius: BorderRadius.circular(7.w),
          color: colorBackGround),
      child: Center(
        child: Text(
          title,
          style: GoogleFonts.tajawal(
              fontSize: 5.w, fontWeight: FontWeight.bold, color: colorText),
        ),
      ),
    ),
  );
}
