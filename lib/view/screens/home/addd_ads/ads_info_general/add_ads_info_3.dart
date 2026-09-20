import 'package:ejary_cash/controller/add_ads/add_ads_controller.dart';
import 'package:ejary_cash/core/constant/colors.dart';
import 'package:ejary_cash/generated/l10n.dart';
import 'package:ejary_cash/view/screens/auth/register/sign_up.dart';
import 'package:ejary_cash/view/screens/home/addd_ads/ads_info_owner/ads_info_owner_1.dart';
import 'package:ejary_cash/view/screens/home/addd_ads/ads_info_general/add_ads_info_4.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class AddAdsInfo3 extends StatelessWidget {
  const AddAdsInfo3({super.key});

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
            },S.of(context).addUnitDetails),
            appBarProgress(20.w, 3),
            GetBuilder<AddAdsController>(
              builder: (controller) => SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 5.w, left: 5.w),
                      child: Text(
                        S.of(context).facilites,
                        style: TextStyle(
                            fontSize: 6.w,
                            color: LightMode.blackColor,
                            fontWeight: FontWeight.w800),
                      ),
                    ),
                    SizedBox(
                      height: 5.w,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        checkBoxWithTitle(S.of(context).facilites_2, (val) {
                          controller.changeFacilities_1(val, "مؤثثة");
                        }, controller.facilities_1, false),
                        checkBoxWithTitle(S.of(context).facilites_3, (val) {
                          controller.changeFacilities_2(val, "مطبخ");
                        }, controller.facilities_2, false)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        checkBoxWithTitle(S.of(context).facilites_1, (val) {
                          controller.changeFacilities_3(val, "ماء");
                        }, controller.facilities_3, false),
                        checkBoxWithTitle(S.of(context).facilites_4, (val) {
                          controller.changeFacilities_4(val, "مكيفات");
                        }, controller.facilities_4, false)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        checkBoxWithTitle(S.of(context).facilites_5, (val) {
                          controller.changeFacilities_5(val, "سخان");
                        }, controller.facilities_5, false),
                        checkBoxWithTitle(S.of(context).facilites_6, (val) {
                          controller.changeFacilities_6(val, "انترنت");
                        }, controller.facilities_6, false)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        checkBoxWithTitle(S.of(context).facilites_7, (val) {
                          controller.changeFacilities_7(val, "كهرباء");
                        }, controller.facilities_7, false),
                        checkBoxWithTitle(S.of(context).facilites_8, (val) {
                          controller.changeFacilities_8(val, "تليفزيون");
                        }, controller.facilities_8, false)
                      ],
                    ),
                    checkBoxWithTitle(S.of(context).facilites_9, (val) {
                      controller.changeFacilities_9(val, "مدخل خاص");
                    }, controller.facilities_9, true),
                    checkBoxWithTitle(
                       S.of(context).facilites_10, (val) {
                      controller.changeFacilities_10(
                          val, "قيمة الكهرباء والماء متضمنة في قيمة الايجار");
                    }, controller.facilities_10, true),
                    checkBoxWithTitle(S.of(context).facilites_11, (val) {
                      controller.changeFacilities_11(val, "الصيانة علي المالك");
                    }, controller.facilities_11, true),
                    checkBoxWithTitle(S.of(context).facilites_12, (val) {
                      controller.changeFacilities_12(val, "عداد كهرباء مستقل");
                    }, controller.facilities_12, true),
                    checkBoxWithTitle(S.of(context).facilites_13, (val) {
                      controller.changeFacilities_13(
                          val, "الشقه جديدة (لم تسكن من قبل)");
                    }, controller.facilities_13, true),
                    checkBoxWithTitle(
                       S.of(context).facilites_14,
                        (val) {
                      controller.changeFacilities_14(val,
                          "في حال عدم وجود مكيفات تركيب المطبخ علي المستأجر او المالك");
                    }, controller.facilities_14, true),
                    SizedBox(
                      height: 10.w,
                    ),
                    btnClick(S.of(context).next, () {
                      if (controller.facilitesList.isEmpty) {
                        controller.messageHandleException(
                            S.of(context).chooseFacilities, context);
                      } else {
                        Get.to(() => const AddAdsInfo4(),
                            transition: Transition.leftToRightWithFade,
                            duration: const Duration(milliseconds: 800));
                      }
                    }, LightMode.whiteColor, LightMode.blueColor,
                        LightMode.blueColor),
                    SizedBox(
                      height: 10.w,
                    ),
                  ],
                ),
              ),
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
            LightMode.blueColor.withValues(alpha: .8),
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

Widget checkBoxWithTitle(text, Function(bool?)? onPress, value, type) {
  return Row(
    children: [
      Checkbox(
        value: value,
        onChanged: onPress,
        checkColor: LightMode.whiteColor,
        activeColor: LightMode.yellowColor,
        focusColor: LightMode.yellowColor,
        side: BorderSide(color: LightMode.yellowColor, width: 2),
      ),
      SizedBox(
        width: 3.w,
      ),
      SizedBox(
        width: type == false ? 30.w : 80.w,
        child: Text(
          text,
          style: GoogleFonts.tajawal(
              fontSize: 5.w,
              fontWeight: FontWeight.w700,
              color: LightMode.blackColor),
        ),
      )
    ],
  );
}
