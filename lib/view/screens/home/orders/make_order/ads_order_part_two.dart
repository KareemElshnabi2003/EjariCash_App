import 'package:ejary_cash/controller/home/orders/orders_controller.dart';
import 'package:ejary_cash/core/class/status_request.dart';
import 'package:ejary_cash/core/constant/colors.dart';
import 'package:ejary_cash/generated/l10n.dart';
import 'package:ejary_cash/main.dart';
import 'package:ejary_cash/view/screens/auth/register/sign_up.dart';
import 'package:ejary_cash/view/screens/home/orders/make_order/ads_order.dart';
import 'package:ejary_cash/view/screens/home/profile/privacy.dart';
import 'package:ejary_cash/view/widget/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class AdsOrderPartTwo extends StatelessWidget {
  final String adsId;
  final dynamic yearlyRent;
  const AdsOrderPartTwo({super.key, required this.adsId, required this.yearlyRent});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersController());
    return Scaffold(
      backgroundColor: LightMode.whiteColor,
      body: GetBuilder<OrdersController>(
        builder: (controller) => controller.statuesRequest ==
                StatuesRequest.loading
            ? loading(90.h)
            : ListView(
                padding: EdgeInsets.zero,
                children: [
                  appBarSign(() {
                    Get.back();
                  }, S.of(context).requestNow),
                  infoEjar(),
                  infoUser(controller.phoneController.text == ""
                      ? sharedPreferences!.getString("phone")!
                      : controller.phoneController.text),
                  Container(
                    margin: EdgeInsets.only(top: 3.h, right: 5.w, left: 5.w),
                    height: 3.88.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GetBuilder<OrdersController>(
                          builder: (controller) => termsText((val) {
                            controller.checkValue();
                          },
                              controller.choose,
                              controller.choose == true
                                  ? LightMode.yellowColor
                                  : Colors.white),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        SizedBox(
                            width: 80.w,
                            height: 3.88.h,
                            child: multiTextSignUp(
                                S.of(context).multiText_1,
                                S.of(context).multiText_3,
                                S.of(context).multiText_5, () {
                              Get.to(() => const Privacy(),
                                  transition: Transition.leftToRightWithFade,
                                  duration: const Duration(milliseconds: 800));

                              //1
                            }, () {
                              Get.to(() => const Privacy(),
                                  transition: Transition.leftToRightWithFade,
                                  duration: const Duration(milliseconds: 800));

                              //2
                            }, S.of(context).multiText_2,
                                S.of(context).multiText_4)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  btnClick(S.of(context).rentOrder, () {
                    controller.rentOwnAds(context, adsId, yearlyRent);
                  }, LightMode.whiteColor, LightMode.blueColor,
                      LightMode.blueColor)
                ],
              ),
      ),
    );
  }
}

Widget infoUser(phone) {
  return Container(
    padding: EdgeInsets.all(3.w),
    margin: EdgeInsets.only(right: 5.w, left: 5.w, top: 10.w, bottom: 3.w),
    decoration: BoxDecoration(
      color: LightMode.greycolor,
    ),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              S.of(Get.context!).userName,
              style: GoogleFonts.tajawal(
                  fontSize: 5.w,
                  fontWeight: FontWeight.w500,
                  color: LightMode.blackColor),
            ),
            Text(
              sharedPreferences!.getString("name")!,
              style: GoogleFonts.tajawal(
                  fontSize: 5.w,
                  fontWeight: FontWeight.w500,
                  color: LightMode.blueColor),
            ),
          ],
        ),
        SizedBox(
          height: 7.w,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              S.of(Get.context!).phone,
              style: GoogleFonts.tajawal(
                  fontSize: 5.w,
                  fontWeight: FontWeight.w500,
                  color: LightMode.blackColor),
            ),
            Text(
              phone,
              style: GoogleFonts.tajawal(
                  fontSize: 5.w,
                  fontWeight: FontWeight.w500,
                  color: LightMode.blueColor),
            ),
          ],
        ),
      ],
    ),
  );
}
