import 'package:ejary_cash/controller/home/ads/report_controller.dart';
import 'package:ejary_cash/core/constant/colors.dart';
import 'package:ejary_cash/generated/l10n.dart';
import 'package:ejary_cash/view/screens/auth/register/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class Report extends StatelessWidget {
  const Report({super.key});

  @override
  Widget build(BuildContext context) {
    ReportController controller = Get.put(ReportController());
    return Scaffold(
      backgroundColor: LightMode.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            appBarSign(() {
              Get.back();
            },S.of(context).reportAd),
            GetBuilder<ReportController>(
              builder: (controller) => typeOfReport((val) {
                controller.changeTytpe(val);
              }, (val) {
                controller.changeTytpe(val);
              }, (val) {
                controller.changeTytpe(val);
              }, (val) {
                controller.changeTytpe(val);
              }, (val) {
                controller.changeTytpe(val);
              }, controller.report, controller.reportController, context),
            ),
            SizedBox(
              height: 10.h,
            ),
            btnClick(S.of(context).report, () {
              controller.makeReport(context);
            }, LightMode.whiteColor, LightMode.yellowColor.withOpacity(0),
                LightMode.yellowColor),
            SizedBox(
              height: 2.h,
            ),
            btnClick(S.of(context).cancel, () {
              Get.back();
            }, LightMode.blackColor, LightMode.blackColor,
                LightMode.whiteColor),
            SizedBox(
              height: 20.w,
            ),
          ],
        ),
      ),
    );
  }
}

Widget typeOfReport(
    Function(String?)? onChanged1,
    Function(String?)? onChanged2,
    Function(String?)? onChanged3,
    Function(String?)? onChanged4,
    Function(String?)? onChanged5,
    type,
    controller,
    context) {
  return Container(
    width: 100.w,
    margin: EdgeInsets.only(right: 4.w, left: 4.w, top: 2.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 80.w,
          child: Row(
            children: [
              Radio<String>(
                  activeColor: LightMode.blueColor,
                  value: '1',
                  groupValue: type,
                  onChanged: onChanged1),
              Text(
                S.of(context).unitNotFree,
                style: GoogleFonts.tajawal(
                    fontSize: 5.w,
                    fontWeight: FontWeight.w700,
                    color: LightMode.blueColor),
              )
            ],
          ),
        ),
        SizedBox(
          width: 80.w,
          child: Row(
            children: [
              Radio<String>(
                  activeColor: LightMode.blueColor,
                  value: '2',
                  groupValue: type,
                  onChanged: onChanged2),
              Text(
                S.of(context).priceNotCorrect,
                style: GoogleFonts.tajawal(
                    fontSize: 5.w,
                    fontWeight: FontWeight.w700,
                    color: LightMode.blueColor),
              )
            ],
          ),
        ),
        SizedBox(
          width: 80.w,
          child: Row(
            children: [
              Radio<String>(
                  activeColor: LightMode.blueColor,
                  value: '3',
                  groupValue: type,
                  onChanged: onChanged2),
              Text(
                S.of(context).locationNotMatch,
                style: GoogleFonts.tajawal(
                    fontSize: 5.w,
                    fontWeight: FontWeight.w700,
                    color: LightMode.blueColor),
              )
            ],
          ),
        ),
        SizedBox(
          width: 100.w,
          child: Row(
            children: [
              Radio<String>(
                  activeColor: LightMode.blueColor,
                  value: '4',
                  groupValue: type,
                  onChanged: onChanged2),
              SizedBox(
                width: 75.w,
                child: Text(
                  S.of(context).notMatchWithLaw,
                  style: GoogleFonts.tajawal(
                      fontSize: 5.w,
                      fontWeight: FontWeight.w700,
                      color: LightMode.blueColor),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          width: 80.w,
          child: Row(
            children: [
              Radio<String>(
                  activeColor: LightMode.blueColor,
                  value: '5',
                  groupValue: type,
                  onChanged: onChanged2),
              Text(
               S.of(context).other,
                style: GoogleFonts.tajawal(
                    fontSize: 5.w,
                    fontWeight: FontWeight.w700,
                    color: LightMode.blueColor),
              )
            ],
          ),
        ),
        SizedBox(
          height: 5.h,
        ),
        Text(
          S.of(context).anotherReason,
          style: GoogleFonts.tajawal(
              fontSize: 5.w,
              fontWeight: FontWeight.w700,
              color: LightMode.blueColor),
        ),
        SizedBox(
          height: 5.w,
        ),
        SizedBox(
          width: 90.w,
          // height: 15.h,
          child: TextFormField(
            maxLines: 2,
            maxLength: 200,
            style: GoogleFonts.tajawal(
                color: LightMode.blueColor,
                fontSize: 4.w,
                fontWeight: FontWeight.w600),
            controller: controller,
            decoration: InputDecoration(
                border: UnderlineInputBorder(
                    borderSide: BorderSide(color: LightMode.blackColor)),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: LightMode.blackColor)),
                disabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: LightMode.blackColor)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: LightMode.blackColor)),
                labelText: S.of(context).enterReason,
                labelStyle: GoogleFonts.tajawal(
                    color: LightMode.blueColor.withOpacity(.8),
                    fontSize: 4.w,
                    fontWeight: FontWeight.w600)),
          ),
        ),
      ],
    ),
  );
}
