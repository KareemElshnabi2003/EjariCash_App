import 'package:ejary_cash/core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

messageLocale(onPressEn,onPressAr) {
  Get.defaultDialog(
      title: "",
      titlePadding: EdgeInsets.zero,
      content: Container(
        margin: EdgeInsets.only(right: 2.w, left: 2.w, top: 2.w, bottom: 2.w),
        child: Column(
          children: [
            InkWell(
              onTap: onPressAr,
              child: Container(
                alignment: Alignment.center,
                width: 50.w,
                height: 6.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3.w),
                  color: LightMode.blueColor,
                ),
                child: Text(
                  "العربية",
                  style: GoogleFonts.tajawal(
                      fontSize: 5.w,
                      fontWeight: FontWeight.w500,
                      color: LightMode.whiteColor),
                ),
              ),
            ),
            SizedBox(
              height: 10.w,
            ),
            InkWell(
              onTap:onPressEn,
              child: Container(
                alignment: Alignment.center,
                width: 50.w,
                height: 6.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(3.w),
                  color: LightMode.blueColor,
                ),
                child: Text(
                  "English",
                  style: GoogleFonts.tajawal(
                      fontSize: 5.w,
                      fontWeight: FontWeight.w500,
                      color: LightMode.whiteColor),
                ),
              ),
            ),
          ],
        ),
      ));
}
