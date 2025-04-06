import 'package:ejary_cash/controller/home/monthlyejar/monthly_ejar_calc_controller.dart';
import 'package:ejary_cash/core/constant/colors.dart';
import 'package:ejary_cash/generated/l10n.dart';
import 'package:ejary_cash/view/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class InfoAboutMonthlyEjar extends StatelessWidget {
  const InfoAboutMonthlyEjar({super.key});

  @override
  Widget build(BuildContext context) {
    MonthlyEjarCalcController controller = Get.put(MonthlyEjarCalcController());
    return Scaffold(
      backgroundColor: LightMode.whiteColor,
      body: Container(
        margin: EdgeInsets.only(right: 5.w, left: 5.w, top: 8.h, bottom: 4.h),
        width: 100.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  S.of(context).monthRentLimit,
                  style: GoogleFonts.tajawal(
                      fontSize: 6.w,
                      fontWeight: FontWeight.w600,
                      color: LightMode.yellowColor),
                ),
                SizedBox(
                  height: 4.w,
                ),
                Text(
                  "${controller.monthlyEjarModel!.expectedMonthlyRent} ريال",
                  style: GoogleFonts.tajawal(
                      fontSize: 7.w,
                      fontWeight: FontWeight.w600,
                      color: LightMode.blueColor),
                ),
                Text(
                  S.of(context).monthly,
                  style: GoogleFonts.tajawal(
                      fontSize: 3.w,
                      fontWeight: FontWeight.w600,
                      color: LightMode.blueColor),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 3.w, bottom: 3.w),
                  margin: EdgeInsets.only(top: 5.w, right: 7.w, left: 7.w),
                  color: LightMode.fillTextFieldColor,
                  height: 10.w,
                  width: 60.w,
                  child: Text(
                    S.of(context).expectedRate,
                    style: GoogleFonts.tajawal(
                        fontSize: 3.w,
                        fontWeight: FontWeight.w600,
                        color: LightMode.greenColor),
                  ),
                ),
              ],
            ),
            Column(
              children: [
                btnClick(S.of(context).goRent, () {
                  Get.offAll(() => const Home(),
                      transition: Transition.leftToRightWithFade,
                      duration: const Duration(milliseconds: 800));
                }, LightMode.whiteColor, LightMode.blueColor,
                    LightMode.blueColor),
                SizedBox(
                  height: 4.w,
                ),
                bottmPageTextClik(() {
                  Get.back();
                },S.of(context).back)
              ],
            )
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

Widget bottmPageTextClik(onPress, title) {
  return InkWell(
    onTap: onPress,
    child: Container(
      width: 100.w,
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.arrow_back,
            color: LightMode.yellowColor,
            size: 8.w,
          ),
          SizedBox(
            width: 3.w,
          ),
          TextButton(
              onPressed: onPress,
              child: Text(
                title,
                style: GoogleFonts.tajawal(
                    fontSize: 5.w,
                    color: LightMode.yellowColor,
                    fontWeight: FontWeight.w700),
              )),
        ],
      ),
    ),
  );
}
