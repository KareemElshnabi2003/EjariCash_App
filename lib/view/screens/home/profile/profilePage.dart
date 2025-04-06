import 'dart:io';

import 'package:ejary_cash/controller/home/home_controller.dart';
import 'package:ejary_cash/controller/home/profile/profile_controller.dart';
import 'package:ejary_cash/core/constant/colors.dart';
import 'package:ejary_cash/generated/l10n.dart';
import 'package:ejary_cash/main.dart';
import 'package:ejary_cash/view/screens/auth/login/login.dart';
import 'package:ejary_cash/view/screens/home/profile/contact_page.dart';
import 'package:ejary_cash/view/screens/home/profile/faq.dart';
import 'package:ejary_cash/view/screens/home/profile/privacy.dart';
import 'package:ejary_cash/view/screens/home/profile/update_profile.dart';
import 'package:ejary_cash/view/screens/home/profile/who_are.dart';
import 'package:ejary_cash/view/widget/message_local.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_go/extensions/responsive_nums.dart';
import 'package:share_plus/share_plus.dart';

class Profilepage extends StatelessWidget {
  const Profilepage({super.key});

  @override
  Widget build(BuildContext context) {
    ProfileController profileController = Get.put(ProfileController());
    HomeController homeController = Get.put(HomeController());
    return Container(
        height: 100.h,
        width: 100.w,
        padding: EdgeInsets.only(right: 5.w, left: 5.w),
        color: LightMode.whiteColor,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              appBarProfile(() {
                homeController.changePage(0);
              }, S.of(context).profile),
              SizedBox(
                height: 5.h,
              ),
              GetBuilder<ProfileController>(
                builder: (controller) => typeOfUser(
                    (val) {
                      profileController.changeTytpe(val);
                    },
                    (val) {
                      profileController.changeTytpe(val);
                    },
                    profileController.typeUser,
                    context,
                    () {
                      profileController.changeUser();
                      homeController.goToHomeWithIndex(0, {});
                    }),
              ),
              SizedBox(
                height: 7.h,
              ),
              settingWidget(
                  sharedPreferences!.getString("local") == "ar"
                      ? "العربية"
                      : "English", () {
                messageLocale(() {
                  profileController.changLang("en");
                }, () {
                  profileController.changLang("ar");
                });
                //onPressLang
              }, () {
                Get.to(() => const UpdateProfile(),
                    transition: Transition.leftToRightWithFade,
                    duration: const Duration(milliseconds: 800));
                //onPressProfile
              }, () {
                //onPressFAQ
                Get.to(() => const Faq(),
                    transition: Transition.leftToRightWithFade,
                    duration: const Duration(milliseconds: 800));
              }, () {
                //onPressContactUs
                Get.to(() => const Contactpage(),
                    transition: Transition.leftToRightWithFade,
                    duration: const Duration(milliseconds: 800));
              }, () {
                // ios link
                Platform.isAndroid
                    ? Share.share(
                        "https://play.google.com/store/apps/details?id=com.ejariCashApp.ejariCashApp")
                    : Share.share(
                        "https://apps.apple.com/eg/app/ejari-cash/id6736946311");
                //onPressShare
              }, () {
                profileController.messageLogOut();
                //  onPressLogOut
              }, () {
                // onPressLogIn
                sharedPreferences!.setBool("visit", false);
                Get.offAll(() => const Login());
              }, () {
                //onPrseeAbout
                print(sharedPreferences!.getBool("visit"));
                Get.to(() => const Privacy(),
                    transition: Transition.leftToRightWithFade,
                    duration: const Duration(milliseconds: 800));
              }, () {
                print(sharedPreferences!.getBool("visit"));
                Get.to(() => const WhoAre(),
                    transition: Transition.leftToRightWithFade,
                    duration: const Duration(milliseconds: 800));
              }),
            ],
          ),
        ));
  }
}

Widget settingWidget(
    textLang,
    onPressLang,
    onPressProfile,
    onPressFAQ,
    onPressContactUs,
    onPressShare,
    onPressLogOut,
    onPressLogIn,
    onPressAbout,
    onPressWhoAre) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      sharedPreferences!.getBool("visit") == true
          ? const SizedBox()
          : Text(
              S.of(Get.context!).setting,
              style: GoogleFonts.tajawal(
                  fontSize: 6.w,
                  color: LightMode.blackColor,
                  fontWeight: FontWeight.w700),
            ),
      SizedBox(
        height: sharedPreferences!.getBool("visit") == true ? 0 : 3.h,
      ),
      rowOfSetting(Icons.language, S.of(Get.context!).laungue,
          Icons.arrow_forward, true, textLang, onPressLang),
      SizedBox(
        height: 3.h,
      ),
      sharedPreferences!.getBool("visit") == true
          ? const SizedBox()
          : rowOfSetting(Icons.person_2, S.of(Get.context!).profile,
              Icons.arrow_forward, false, textLang, onPressProfile),
      sharedPreferences!.getBool("visit") == true
          ? const SizedBox()
          : SizedBox(
              height: 4.h,
            ),
      Text(
        S.of(Get.context!).main,
        style: GoogleFonts.tajawal(
            fontSize: 6.w,
            color: LightMode.blackColor,
            fontWeight: FontWeight.w700),
      ),
      SizedBox(
        height: 4.h,
      ),
      rowOfSetting(Icons.info, S.of(Get.context!).whoAreTitle,
          Icons.arrow_forward_ios, false, textLang, onPressWhoAre),

      SizedBox(
        height: 4.h,
      ),
      rowOfSetting(Icons.question_mark_rounded, S.of(Get.context!).question,
          Icons.arrow_forward_ios, false, textLang, onPressFAQ),
      SizedBox(
        height: 3.h,
      ),
      rowOfSetting(Icons.phone_in_talk, S.of(Get.context!).contactUs,
          Icons.arrow_forward_ios, false, textLang, onPressContactUs),
      SizedBox(
        height: 3.h,
      ),
      rowOfSetting(Icons.policy, S.of(Get.context!).prrivacy,
          Icons.arrow_forward_ios, false, textLang, onPressAbout),
      SizedBox(
        height: 3.h,
      ),
      rowOfSetting(Icons.share, S.of(Get.context!).shareApp,
          Icons.arrow_forward_ios, false, textLang, onPressShare),
      SizedBox(
        height: 3.h,
      ),
      sharedPreferences!.getBool("visit") == true
          ? rowOfSetting(Icons.login, S.of(Get.context!).login,
              Icons.arrow_forward_ios, false, textLang, onPressLogIn)
          : rowOfSetting(Icons.logout, S.of(Get.context!).logOut,
              Icons.arrow_forward_ios, false, textLang, onPressLogOut),
      SizedBox(
        height: 3.h,
      ),
      // SizedBox(
      //   width: 100.w,
      //   child: Column(
      //     crossAxisAlignment: CrossAxisAlignment.center,
      //     children: [
      //       Text(
      //         "SDSD License",
      //         style: GoogleFonts.tajawal(
      //             fontSize: 6.w,
      //             color: LightMode.blueColor.withOpacity(.4),
      //             fontWeight: FontWeight.w500),
      //       ),
      //       Text(
      //         "2323232485",
      //         style: GoogleFonts.tajawal(
      //             fontSize: 4.w,
      //             color: LightMode.blueColor.withOpacity(.3),
      //             fontWeight: FontWeight.w400),
      //       ),
      //     ],
      //   ),
      // )
    ],
  );
}

Widget rowOfSetting(icon, text, iconBack, find, textLang, onPress) {
  return InkWell(
    onTap: onPress,
    child: SizedBox(
      width: 100.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                icon,
                size: 8.w,
                color: LightMode.greenColor,
              ),
              SizedBox(
                width: 2.w,
              ),
              Text(
                text,
                style: GoogleFonts.tajawal(
                    fontSize: 5.w,
                    color: LightMode.blueColor,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Row(
            children: [
              find == true
                  ? Text(
                      textLang,
                      style: GoogleFonts.tajawal(
                          fontSize: 4.5.w,
                          color: LightMode.blueColor,
                          fontWeight: FontWeight.w600),
                    )
                  : const SizedBox(),
              find == true
                  ? SizedBox(
                      width: 2.w,
                    )
                  : const SizedBox(),
              Icon(
                iconBack,
                size: 8.w,
                color: LightMode.yellowColor,
              )
            ],
          )
        ],
      ),
    ),
  );
}

// Widget typeOfUser(onPressOwner, onPressEjar) {
//   return Row(
//     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     children: [
//       typeBox(
//           S.of(Get.context!).owner,
//           onPressOwner,
//           sharedPreferences!.getString("typeOfUser") == "مستأجر"
//               ? LightMode.greycolor
//               : LightMode.blueColor,
//           sharedPreferences!.getString("typeOfUser") == "مالك"
//               ? LightMode.whiteColor
//               : LightMode.blackColor),
//       typeBox(
//           S.of(Get.context!).renter,
//           onPressEjar,
//           sharedPreferences!.getString("typeOfUser") == "مالك"
//               ? LightMode.greycolor
//               : LightMode.blueColor,
//           sharedPreferences!.getString("typeOfUser") == "مالك"
//               ? LightMode.blackColor
//               : LightMode.whiteColor),
//     ],
//   );
// }

Widget typeBox(text, onPress, color, colorText) {
  return InkWell(
    onTap: onPress,
    child: Container(
      alignment: Alignment.center,
      width: 40.w,
      height: 6.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4.w),
        color: color,
      ),
      child: Text(
        text,
        style: GoogleFonts.tajawal(
            color: colorText, fontSize: 5.w, fontWeight: FontWeight.w500),
      ),
    ),
  );
}

Widget appBarProfile(onPressBack, text) {
  return Container(
    margin: EdgeInsets.only(
      top: 5.h,
    ),
    child: Row(
      children: [
        InkWell(
          onTap: onPressBack,
          child: Container(
            width: 10.w,
            height: 7.w,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3.w),
                color: LightMode.blueColor),
            child: Icon(
              Icons.arrow_back,
              size: 6.w,
              color: LightMode.whiteColor,
            ),
          ),
        ),
        SizedBox(
          width: 3.w,
        ),
        Container(
          height: 7.w,
          alignment: Alignment.center,
          child: Text(
            text,
            style: GoogleFonts.tajawal(
                fontSize: 6.w,
                fontWeight: FontWeight.bold,
                color: LightMode.blackColor),
          ),
        )
      ],
    ),
  );
}
