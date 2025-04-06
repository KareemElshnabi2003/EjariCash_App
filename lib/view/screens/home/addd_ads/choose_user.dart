import 'package:ejary_cash/controller/add_ads/add_ads_controller.dart';
import 'package:ejary_cash/core/constant/colors.dart';
import 'package:ejary_cash/generated/l10n.dart';
import 'package:ejary_cash/view/screens/auth/register/sign_up.dart';
import 'package:ejary_cash/view/screens/home/addd_ads/ads_info_owner/ads_info_owner_1.dart';
import 'package:ejary_cash/view/screens/home/addd_ads/ads_info_broker/ads_info_broker_1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class ChooseUser extends StatelessWidget {
  const ChooseUser({super.key});

  @override
  Widget build(BuildContext context) {
     Get.put(AddAdsController());
    return Scaffold(
      backgroundColor: LightMode.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            appBarSign(() {
              Get.back();
            }, S.of(context).chooseTypeUser),
            SizedBox(
              height: 15.w,
            ),
            GetBuilder<AddAdsController>(
              builder: (controller) => Column(
                children: [
                  cardTypeAds(LightMode.blackColor, Icons.people,
                      S.of(context).broker, S.of(context).bodyBroker, () {
                    controller.changeType("broker");

                    Get.to(() => const AdsInfoBroker1(),
                        transition: Transition.leftToRightWithFade,
                        duration: const Duration(milliseconds: 800));
                  }, controller.broker),
                  cardTypeAds(LightMode.blueColor, Icons.copyright_outlined,
                      S.of(context).owner, S.of(context).bodyOwner, () {
                    controller.changeType("owner");
                    Get.to(() => const AdsInfoOwner1(),
                        transition: Transition.leftToRightWithFade,
                        duration: const Duration(milliseconds: 800));
                  }, controller.owner),
                ],
              ),
            ),
            SizedBox(
              height: 15.w,
            ),
            SizedBox(
              height: 7.w,
            ),
          ],
        ),
      ),
    );
  }
}

Widget btnClick(title, onPress, colorText, colorBorder, colorBackGround) {
  return InkWell(
    onTap: onPress,
    child: Container(
      margin: EdgeInsets.only(right: 5.w, left: 5.w),
      width: 100.w,
      height: 6.h,
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            LightMode.blueColor,
            LightMode.blueColor.withOpacity(.8),
          ]),
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

Widget cardTypeAds(color, icon, title, body, onPress, choose) {
  return Container(
    width: 100.w,
    // height: 27.h,
    padding: EdgeInsets.only(right: 5.w, left: 5.w, top: 10.w, bottom: 10.w),
    margin: EdgeInsets.only(
      right: 5.w,
      left: 5.w,
      top: 5.w,
    ),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.w),
        border: Border.all(
            color: choose == true
                ? LightMode.greenColor
                : LightMode.greycolor.withOpacity(.5),
            width: 2)),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 15.w,
              height: 15.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color,
              ),
              child: Icon(
                icon,
                size: 8.w,
                color: LightMode.whiteColor,
              ),
            ),
            SizedBox(
              width: 5.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                    width: 55.w,
                    child: Text(
                      title,
                      style: GoogleFonts.tajawal(
                          fontSize: 6.w,
                          fontWeight: FontWeight.w700,
                          color: LightMode.blackColor),
                    )),
                SizedBox(
                  height: 5.w,
                ),
                SizedBox(
                    width: 50.w,
                    child: Text(
                      body,
                      maxLines: 5,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.tajawal(
                          fontSize: 4.w,
                          fontWeight: FontWeight.w700,
                          color: LightMode.blackColor.withOpacity(.5)),
                    )),
              ],
            )
          ],
        ),
        SizedBox(
          height: 5.w,
        ),
        btnClick(S.of(Get.context!).next, onPress, LightMode.whiteColor,
            LightMode.blueColor, LightMode.blueColor),
      ],
    ),
  );
}
