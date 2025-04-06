import 'package:cached_network_image/cached_network_image.dart';
import 'package:ejary_cash/controller/add_ads/why_ejary_cash_controller.dart';
import 'package:ejary_cash/core/constant/colors.dart';
import 'package:ejary_cash/core/constant/images.dart';
import 'package:ejary_cash/generated/l10n.dart';
import 'package:ejary_cash/view/screens/home/addd_ads/choose_type_of_ads.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class WhyEjaryCash extends StatelessWidget {
  const WhyEjaryCash({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(WhyEjaryCashController());
    return Scaffold(
      backgroundColor: LightMode.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            appBarWidget(() {
              Get.back();
            }, () {
              // sharedPreferences!.clear();
              Get.to(() => const ChooseTypeOfAds(),
                  transition: Transition.leftToRightWithFade,
                  duration: const Duration(milliseconds: 800));
            }),
            imageAndTitle(),
            GetBuilder<WhyEjaryCashController>(
              builder: (controller) => SizedBox(
                height: 60.h,
                width: 100.w,
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  itemCount: controller.informationList.length,
                  itemBuilder: (context, index) => infoWidget(
                      index == 0 || index == 3 || index == 6
                          ? LightMode.greenColor.withOpacity(.5)
                          : index == 1 || index == 4 || index == 7
                              ? LightMode.blueColor.withOpacity(.3)
                              : LightMode.yellowColor.withOpacity(.3),
                      controller.informationList[index].featureImage,
                      controller.informationList[index].title,
                      controller.informationList[index].text),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget appBarWidget(onPressBack, onPressNext) {
  return Container(
    margin: EdgeInsets.only(right: 7.w, left: 7.w, top: 5.h, bottom: 5.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
            onPressed: onPressBack,
            icon: Icon(
              Icons.arrow_back_ios,
              color: LightMode.blackColor,
              size: 7.w,
            )),
        InkWell(
            onTap: onPressNext,
            child: Text(
             S.of(Get.context!).next,
              style: GoogleFonts.tajawal(
                  color: LightMode.blackColor,
                  fontSize: 7.w,
                  fontWeight: FontWeight.w600),
            ))
      ],
    ),
  );
}

Widget imageAndTitle() {
  return Container(
    margin: EdgeInsets.only(
      right: 15.w,
      left: 15.w,
      bottom: 5.w,
    ),
    child: Column(
      children: [
        Image.asset(
          ImagesLink.whyEjaryImage,
          width: 55.w,
          height: 25.h,
          fit: BoxFit.fill,
        ),
        Divider(
          color: LightMode.blackColor,
          thickness: 1.5,
        ),
        Text(
         S.of(Get.context!).whyEjary,
          style: GoogleFonts.tajawal(
              color: LightMode.blackColor,
              fontSize: 7.w,
              fontWeight: FontWeight.w600),
        )
      ],
    ),
  );
}

Widget infoWidget(color, icon, title, body) {
  return Container(
    margin: EdgeInsets.only(right: 7.w, left: 7.w, bottom: 5.w, top: 3.w),
    child: Row(
      children: [
        Container(
            width: 17.w,
            height: 17.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
            ),
            child: CachedNetworkImage(
              imageUrl: icon,
              width: 20.w,
              height: 20.w,
              color: LightMode.blackColor,
            )),
        SizedBox(
          width: 5.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: GoogleFonts.tajawal(
                  color: LightMode.blackColor,
                  fontSize: 5.w,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              width: 60.w,
              child: Text(
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
                body,
                style: GoogleFonts.tajawal(
                    color: LightMode.blackColor.withOpacity(.4),
                    fontSize: 4.w,
                    fontWeight: FontWeight.w600),
              ),
            )
          ],
        ),
      ],
    ),
  );
}
