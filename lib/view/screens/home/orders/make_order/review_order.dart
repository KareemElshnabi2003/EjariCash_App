import 'package:ejary_cash/controller/home/home_controller.dart';
import 'package:ejary_cash/controller/home/notification/notify_controller.dart';
import 'package:ejary_cash/controller/home/orders/orders_controller.dart';
import 'package:ejary_cash/core/constant/colors.dart';
import 'package:ejary_cash/generated/l10n.dart';
import 'package:ejary_cash/view/screens/auth/register/sign_up.dart';
import 'package:ejary_cash/view/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class ReviewOrder extends StatelessWidget {
  const ReviewOrder({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotifyController());
    Get.put(OrdersController());
    return Scaffold(
      backgroundColor: LightMode.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appBarSign(() {
              Get.back();
            },S.of(context).requestNow),
            Container(
              margin: EdgeInsets.only(
                  right: 5.w, left: 5.w, top: 10.w, bottom: 2.w),
              child: Text(
                S.of(context).review,
                style: GoogleFonts.tajawal(
                    fontSize: 4.w,
                    fontWeight: FontWeight.w700,
                    color: LightMode.blackColor),
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 5.w, left: 5.w),
              width: 100.w,
              height: 2.h,
              child: Row(
                children: [
                  Container(
                    width: 30.w,
                    height: 2.h,
                    color: LightMode.yellowColor,
                  ),
                  Container(
                    width: 60.w,
                    height: 2.h,
                    color: LightMode.blueColor,
                  ),
                ],
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(right: 20.w, left: 20.w),
              width: 100.w,
              height: 60.h,
              child: Text(
                S.of(context).messageReview,
                textAlign: TextAlign.center,
                style: GoogleFonts.tajawal(
                    fontSize: 8.w,
                    fontWeight: FontWeight.w700,
                    color: LightMode.yellowColor),
              ),
            ),
            btnClick(S.of(context).homePage, () {
              HomeController homeController = Get.put(HomeController());
              homeController.currentIndex = 0;
              Get.offAll(() => const Home(),
                  transition: Transition.leftToRightWithFade,
                  duration: const Duration(milliseconds: 800));
            }, LightMode.whiteColor, LightMode.blueColor, LightMode.blueColor),
            SizedBox(
              height: 5.w,
            ),
          
          ],
        ),
      ),
    );
  }
}
