import 'package:ejary_cash/controller/on_board_controller.dart';
import 'package:ejary_cash/core/constant/colors.dart';
import 'package:ejary_cash/core/constant/images.dart';
import 'package:ejary_cash/generated/l10n.dart';
import 'package:ejary_cash/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardController());
    return Scaffold(
      backgroundColor: LightMode.whiteColor,
      body: Center(
        child: GetBuilder<OnBoardController>(
            builder: (controller) => Column(
                  children: [
                    Container(
                      height: 77.h,
                      width: 100.w,
                      margin: EdgeInsets.only(top: 7.h, right: 5.w, left: 5.w),
                      child: ListView.builder(
                        itemCount: controller.onBoarding.length,
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          controller.indexList = index;
                          print(controller.indexList);
                          return cardOnBoarding(
                              controller.onBoarding[controller.indexList]
                                  .bannerImage!,
                              controller.indexList == 0
                                  ? ImagesLink.onBoard_1DotImage
                                  : ImagesLink.onBoard_2DotImage,
                              controller.onBoarding[index].title!);
                        },
                      ),
                    ),
                    btnClick(S.of(Get.context!).next, () {
                      print(controller.indexList);
                      controller.onPressNext();
                      sharedPreferences!.setString("pageStart", "mainRegister");
                    }),
                    textClik(() {
                      sharedPreferences!.setString("pageStart", "mainRegister");

                      controller.onPressSkip();
                    }, S.of(Get.context!).skip)
                  ],
                )),
      ),
    );
  }
}

Widget textClik(onPress, title) {
  return TextButton(
      onPressed: onPress,
      child: Text(
        title,
        style: GoogleFonts.tajawal(
            fontSize: 4.w,
            color: LightMode.yellowColor,
            fontWeight: FontWeight.w700),
      ));
}

Widget btnClick(title, onPress) {
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
          borderRadius: BorderRadius.circular(7.w),
          color: LightMode.blueColor),
      child: Center(
        child: Text(
          title,
          style: GoogleFonts.tajawal(
              fontSize: 5.w,
              fontWeight: FontWeight.bold,
              color: LightMode.whiteColor),
        ),
      ),
    ),
  );
}

Widget cardOnBoarding(String img, String img2, String text) {
  return Column(
    children: [
      SizedBox(
          height: 55.h,
          width: 85.w,
          child: Image.network(
            img,
            fit: BoxFit.fill,
          )),
      SizedBox(
        height: 2.h,
      ),
      SizedBox(
          height: 2.h,
          width: 8.w,
          child: Image.asset(
            img2,
            fit: BoxFit.fill,
          )),
      SizedBox(
        height: 2.h,
      ),
      SizedBox(
          height: 13.h,
          width: 90.w,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: GoogleFonts.tajawal(
                color: LightMode.blackColor,
                fontSize: 4.w,
                fontWeight: FontWeight.bold),
          ))
    ],
  );
}
