import 'package:ejary_cash/controller/add_ads/add_ads_controller.dart';
import 'package:ejary_cash/core/constant/colors.dart';
import 'package:ejary_cash/generated/l10n.dart';
import 'package:ejary_cash/view/screens/auth/register/sign_up.dart';
import 'package:ejary_cash/view/screens/home/addd_ads/choose_user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class ChooseTypeOfAds extends StatelessWidget {
  const ChooseTypeOfAds({super.key});

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
            }, S.of(context).addUnit),
            GetBuilder<AddAdsController>(
              builder: (controller) => Column(
                children: [
                  cardTypeAds(
                      LightMode.greenColor.withOpacity(.5),
                      Icons.category_outlined,
                      S.of(context).bodyAddAds_1,
                      S.of(context).bodyAddAds_2, () {
                    controller.changeChoose("1");
                    controller.choose_1 == false && controller.choose_2 == false
                        ? null
                        : Get.to(() => const ChooseUser(),
                            transition: Transition.leftToRightWithFade,
                            duration: const Duration(milliseconds: 800));
                  }, controller.choose_1, 1, 46.h),
                  cardTypeAds(
                      LightMode.yellowColor.withOpacity(.3),
                      Icons.electric_bolt_rounded,
                      S.of(context).bodyAddAds_3,
                      S.of(context).bodyAddAds_4, () {
                    controller.changeChoose("2");
                    controller.choose_1 == false && controller.choose_2 == false
                        ? null
                        : Get.to(() => const ChooseUser(),
                            transition: Transition.leftToRightWithFade,
                            duration: const Duration(milliseconds: 800));
                  }, controller.choose_2, 2, 32.h),
                  SizedBox(
                    height: 7.w,
                  ),
                  if (controller.choose_1 == false &&
                      controller.choose_2 == false)
                    Container(
                      margin: EdgeInsets.only(right: 5.w, left: 5.w),
                      width: 100.w,
                      alignment: Alignment.centerRight,
                      child: Text(
                        S.of(context).choose,
                        style: GoogleFonts.tajawal(
                            fontSize: 5.w,
                            color: Colors.red,
                            fontWeight: FontWeight.w600),
                      ),
                    )
                ],
              ),
            ),
            SizedBox(
              height: 7.w,
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

Widget cardTypeAds(color, icon, title, body, onPress, choose, index, height) {
  return Container(
    width: 100.w,
    // height: height,
    padding: EdgeInsets.only(right: 5.w, left: 5.w, top: 5.w),
    margin: EdgeInsets.only(
      right: 5.w,
      left: 5.w,
      top: 5.w,
    ),
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.w),
        border:
            Border.all(color: LightMode.greycolor.withOpacity(.5), width: 2)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 15.w,
              height: 15.w,
              decoration: BoxDecoration(shape: BoxShape.circle, color: color),
              child: Icon(
                icon,
                size: 6.w,
                color: LightMode.blackColor,
              ),
            ),
            btnClick(S.of(Get.context!).next, onPress, LightMode.whiteColor,
                LightMode.blueColor, LightMode.blueColor,
                width: 25.w),
          ],
        ),
        SizedBox(
          height: 5.w,
        ),
        SizedBox(
            width: 70.w,
            child: Text(
              title,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.tajawal(
                  fontSize: 6.w,
                  fontWeight: FontWeight.w700,
                  color: LightMode.blackColor),
            )),
        SizedBox(
          height: 3.w,
        ),
        index == 1
            ? Text(
                S.of(Get.context!).recommend,
                style: GoogleFonts.tajawal(
                    fontSize: 6.w,
                    fontWeight: FontWeight.w500,
                    color: LightMode.blueColor),
              )
            : const SizedBox(),
        SizedBox(
          height: 3.w,
        ),
        SizedBox(
            width: 70.w,
            child: Text(
              body,
              maxLines: 5,
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.tajawal(
                  fontSize: 4.w,
                  fontWeight: FontWeight.w700,
                  color: LightMode.blackColor.withOpacity(.5)),
            ))
      ],
    ),
  );
}

Widget btnClick(title, onPress, colorText, colorBorder, colorBackGround,
    {width}) {
  return InkWell(
    onTap: onPress,
    child: Container(
      margin: EdgeInsets.only(right: 5.w, left: 5.w),
      width: width ?? 100.w,
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
