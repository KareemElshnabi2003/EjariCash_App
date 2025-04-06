// ignore_for_file: avoid_print

import 'package:ejary_cash/controller/home/home_controller.dart';
import 'package:ejary_cash/core/constant/colors.dart';
import 'package:ejary_cash/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:screen_go/extensions/responsive_nums.dart';

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Get.put(HomeController());
    return GetBuilder<HomeController>(
      builder: (controller) => Scaffold(
        bottomNavigationBar: BottomAppBar(
          height: MediaQuery.sizeOf(context).shortestSide > 600 ? 12.h : 10.5.h,
          color: LightMode.whiteColor,
          notchMargin: 4.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              itemNavigationBar(S.of(context).homePage, () {
                controller.changePage(0);
              },
                  controller.currentIndex == 0
                      ? Icons.home
                      : Icons.home_outlined,
                  22.w,
                  controller.currentIndex == 0
                      ? LightMode.blueColor.withOpacity(.8)
                      : LightMode.blackColor),
              itemNavigationBar(S.of(context).ads, () async{
                
                controller.changePage(1);
              },
                  controller.currentIndex == 1
                      ? Icons.campaign
                      : Icons.campaign_outlined,
                  18.w,
                  controller.currentIndex == 1
                      ? LightMode.blueColor.withOpacity(.8)
                      : LightMode.blackColor),
              itemNavigationBar(S.of(context).orders, () {
                controller.changePage(2);
              },
                  controller.currentIndex == 2
                      ? Icons.list_alt
                      : Icons.list_alt_outlined,
                  20.w,
                  controller.currentIndex == 2
                      ? LightMode.blueColor.withOpacity(.8)
                      : LightMode.blackColor),
              itemNavigationBar(S.of(context).profile, () {
                controller.changePage(3);
              },
                  controller.currentIndex == 3
                      ? Icons.person
                      : Icons.person_2_outlined,
                  20.w,
                  controller.currentIndex == 3
                      ? LightMode.blueColor.withOpacity(.8)
                      : LightMode.blackColor),
            ],
          ),
        ),
        body: controller.pages.elementAt(controller.currentIndex),
      ),
    );
  }

  Widget itemNavigationBar(text, onTap, icon, width, color) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              size: 6.w,
              color: color,
            ),
            SizedBox(height: 1.w),
            Text(
              text,
              style: GoogleFonts.tajawal(
                  color: color, fontWeight: FontWeight.w600, fontSize: 3.w),
            )
          ],
        ),
      ),
    );
  }
}
