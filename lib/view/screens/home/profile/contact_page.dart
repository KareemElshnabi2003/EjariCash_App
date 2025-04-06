import 'package:ejary_cash/controller/home/profile/contact_controller.dart';
import 'package:ejary_cash/core/class/status_request.dart';
import 'package:ejary_cash/core/constant/colors.dart';
import 'package:ejary_cash/core/constant/images.dart';
import 'package:ejary_cash/generated/l10n.dart';
import 'package:ejary_cash/view/screens/auth/register/sign_up.dart';
import 'package:ejary_cash/view/widget/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class Contactpage extends StatelessWidget {
  const Contactpage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ContactController());
    return Scaffold(
        body: GetBuilder<ContactController>(
      builder: (controller) => SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appBarSign(() {
              Get.back();
            }, S.of(context).contactUs),
            SizedBox(
              height: 3.h,
            ),
            bodyOfContact(),
            SizedBox(
              height: 3.h,
            ),
            controller.statuesRequest == StatuesRequest.loading
                ? loading(80.h)
                : pageContactCards(
                    () {
                      //onPressWatsappWorks

                      controller.urlLuncher("watsappWorks");
                    },
                    () {
                      //onPressWatsapp
                      controller.urlLuncher("watsappNormal");
                    },
                    () {
                      //onPressEmail
                      controller.urlLuncher("gmail");
                    },
                    controller.settingModel!.email,
                    () {
                      //onPressPhone
                      controller.urlLuncher("phone");
                    },
                    controller.settingModel!.phone,
                    //"01281265373"
                    controller.settingModel!.timeWork,
                    controller.settingModel!.dayWork)
          ],
        ),
      ),
    ));
  }
}

Widget pageContactCards(onPressWatsappWorks, onPressWatsapp, onPressEmail,
    email, onPressPhone, phone, time, days) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          cardOfContactPage(true, ImagesLink.normalWatsImage, null,
              S.of(Get.context!).watsApp, onPressWatsapp),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          cardOfContactPage(
              false, null, Icons.email_outlined, email, onPressEmail),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          cardOfContactPage(
              false, null, Icons.phone_enabled_outlined, phone, onPressPhone),
          // cardOfContactPage(false, null, Icons.timer_outlined, time, null),
          // cardOfContactPage(
          //     false, null, Icons.calendar_month_outlined, days, null),
        ],
      ),
    ],
  );
}

Widget cardOfContactPage(img, image, icon, text, onPress) {
  return InkWell(
    onTap: onPress,
    child: Container(
      width: 35.w,
      height: 35.w,
      margin: EdgeInsets.only(right: 7.w, left: 7.w, bottom: 10.w),
      child: Column(
        children: [
          img == true
              ? Image.asset(
                  image,
                  width: 15.w,
                  height: 15.w,
                  fit: BoxFit.fill,
                )
              : Icon(
                  icon,
                  color: LightMode.yellowColor,
                  size: 15.w,
                ),
          SizedBox(
            height: 3.w,
          ),
          Text(
            text,
            style: GoogleFonts.tajawal(
                fontSize: 4.w,
                fontWeight: FontWeight.w500,
                color: LightMode.blueColor),
          )
        ],
      ),
    ),
  );
}

Widget bodyOfContact() {
  return Container(
    margin: EdgeInsets.only(right: 5.w, left: 5.w, bottom: 5.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(Get.context!).addressContact,
          style: GoogleFonts.tajawal(
              fontSize: 5.w,
              fontWeight: FontWeight.w400,
              color: LightMode.blueColor),
        ),
        Text(
          S.of(Get.context!).bodyContact,
          style: GoogleFonts.tajawal(
              fontSize: 4.w,
              fontWeight: FontWeight.w300,
              color: LightMode.greenColor),
        ),
      ],
    ),
  );
}
