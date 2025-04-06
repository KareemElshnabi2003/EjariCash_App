import 'dart:async';

import 'package:ejary_cash/controller/on_board_controller.dart';
import 'package:ejary_cash/core/constant/colors.dart';
import 'package:ejary_cash/core/constant/images.dart';
import 'package:ejary_cash/main.dart';
import 'package:ejary_cash/view/screens/auth/forgetPass/verify_forget_pass.dart';
import 'package:ejary_cash/view/screens/auth/register/main_register.dart';
import 'package:ejary_cash/view/screens/auth/register/verify_register.dart';
import 'package:ejary_cash/view/screens/home/home.dart';
import 'package:ejary_cash/view/screens/on_boarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var topBottomImage = 0.0;
  var width = 17.w;
  var height = 45.h;

  var bottom = 45.h;

  @override
  void initState() {
    Timer(const Duration(milliseconds: 1500), () {
      setState(() {
        topBottomImage = 45.h;
      });
    });
    Timer(const Duration(seconds: 3), () {
      setState(() {
        topBottomImage = 45.h;
        width = 15.w;
        height = 42.h;
        bottom = 48.h;
      });
    });

    Timer(const Duration(milliseconds: 3500), () async {
      print(sharedPreferences!.getString("pageStart"));
      if (sharedPreferences!.getString("pageStart") == "Home") {
        Get.off(() => const Home(),
            transition: Transition.fade,
            duration: const Duration(milliseconds: 1300));
      } else if (sharedPreferences!.getString("pageStart") == "mainRegister") {
        Get.off(() => const MainAuth(),
            transition: Transition.fade,
            duration: const Duration(milliseconds: 1300));
      } else if (sharedPreferences!.getString("pageStart") ==
          "verifyRegister") {
        Get.off(() => const VerifyCodeRegister(),
            transition: Transition.fade,
            duration: const Duration(milliseconds: 1300));
      } else if (sharedPreferences!.getString("pageStart") == "verifyForget") {
        Get.off(() => const VerifyCodeForgetPass(),
            transition: Transition.fade,
            duration: const Duration(milliseconds: 1300));
      } else {
        OnBoardController controller = Get.put(OnBoardController());
        await controller.getAllUnites(context);
        Get.to(() => const OnBoarding(),
            transition: Transition.fade,
            duration: const Duration(milliseconds: 1300));
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: LightMode.whiteColor,
      body: Stack(
        children: [
          Positioned(
            top: height,
            bottom: bottom,
            right: width,
            left: width,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 1500),
              curve: Curves.easeInOut,
              width: 60.w,
              height: 5.h, // You can adjust the height as needed
              child: Image.asset(
                ImagesLink.splashLogoImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 1500),
              curve: Curves.easeInOut,
              width: 100.w, // You can adjust the width as needed
              height: topBottomImage,
              child: Image.asset(
                ImagesLink
                    .bottomSplashImage, // Replace with your image URL or asset
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
      //  SizedBox(
      //   child: Stack(
      //     children: [
      //       Positioned(
      //           top: topLogo,
      //           right: rightLogo,
      //           left: leftLogo,
      //           child: Image.asset(
      //             ImagesLink.splashLogoImage,
      //             fit: BoxFit.fill,
      //           )),
      //       Positioned(
      //           top: topBottomImage,
      //           right: 0,
      //           left: 0,
      //           bottom: 0,
      //           child: Image.asset(
      //             ImagesLink.bottomSplashImage,
      //             fit: BoxFit.fill,
      //           )),
      //     ],
      //   ),
      // ),
    );
  }
}
