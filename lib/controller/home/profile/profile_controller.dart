import 'package:ejary_cash/core/class/api.dart';
import 'package:ejary_cash/core/class/status_request.dart';
import 'package:ejary_cash/core/constant/colors.dart';
import 'package:ejary_cash/core/function/handling_data.dart';
import 'package:ejary_cash/data/data%20source/register.dart';
import 'package:ejary_cash/generated/l10n.dart';
import 'package:ejary_cash/main.dart';
import 'package:ejary_cash/view/screens/auth/login/login.dart';
import 'package:ejary_cash/view/screens/auth/register/main_register.dart';
import 'package:ejary_cash/view/screens/on_boarding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class ProfileController extends GetxController {
  StatuesRequest statuesRequest = StatuesRequest.none;
  RegisterRemoteData registerRemoteData = RegisterRemoteData(Get.put(Api()));
  String typeUser = sharedPreferences!.getString("typeOfUser") == "مستأجر"
      ? "مستأجر"
      : "مالك";
  changLang(lang) async {
    if (lang == "ar") {
      await sharedPreferences!.setString("local", "ar");
      Get.updateLocale(const Locale("ar"));
      Get.back();
      update();
    } else {
      await sharedPreferences!.setString("local", "en");
      Get.updateLocale(const Locale("en"));
      Get.back();
      update();
    }
  }

  changeTytpe(typeSelect) {
    if (typeSelect == "مستأجر") {
      sharedPreferences!.setString("typeOfUser", "مستأجر");
      typeUser = "مستأجر";
    } else {
      sharedPreferences!.setString("typeOfUser", "مالك");
      typeUser = "مالك";
    }
    update();
  }

  changeUser() {
    if (typeUser == "مالك") {
      sharedPreferences!.setString("typeOfUser", "مالك");
    } else {
      sharedPreferences!.setString("typeOfUser", "مستأجر");
    }
    update();
  }

  messageHandleExceptionVisitor(message, context) {
    Get.defaultDialog(
        title: S.of(context).error,
        content: Column(
          children: [
            Text(
              message,
              style: GoogleFonts.tajawal(
                  fontSize: 3.5.w,
                  color: LightMode.blackColor,
                  fontWeight: FontWeight.w500),
            ),
            InkWell(
              onTap: () {
                Get.offAll(() => const MainAuth());
              },
              child: Container(
                decoration: BoxDecoration(
                  color: LightMode.yellowColor,
                  borderRadius: BorderRadius.circular(3.w),
                ),
                width: 30.w,
                height: 5.h,
                child: Center(
                  child: Text(
                    S.of(Get.context!).login,
                    style: GoogleFonts.tajawal(
                        fontSize: 4.w,
                        color: LightMode.whiteColor,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  messageHandleException(message, context) {
    Get.defaultDialog(
        title: S.of(context).error,
        content: Column(
          children: [
            Text(
              message,
              style: GoogleFonts.tajawal(
                  fontSize: 3.5.w,
                  color: LightMode.blackColor,
                  fontWeight: FontWeight.w500),
            ),
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                decoration: BoxDecoration(
                  color: LightMode.yellowColor,
                  borderRadius: BorderRadius.circular(3.w),
                ),
                width: 30.w,
                height: 5.h,
                child: Center(
                  child: Text(
                    S.of(context).tryAgain,
                    style: GoogleFonts.tajawal(
                        fontSize: 4.w,
                        color: LightMode.whiteColor,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  logOut(context) async {
    statuesRequest = StatuesRequest.loading;
    update();
    var response =
        await registerRemoteData.logOut(sharedPreferences!.getString("token"));
    print(" response ??? response");

    statuesRequest = handlingData(response);

    if (statuesRequest == StatuesRequest.success) {
      sharedPreferences!.setString("pageStart", "onBoarding");
      Get.offAll(() => const OnBoarding());
    } else if (statuesRequest == StatuesRequest.unprocessableException) {
      messageHandleException("${response['message']}", context);
    } else if (statuesRequest == StatuesRequest.socketException) {
      messageHandleException(S.of(context).noInternetApi, context);
    } else if (statuesRequest == StatuesRequest.serverException) {
      messageHandleException(S.of(context).serverException, context);
    } else if (statuesRequest == StatuesRequest.unExpectedException) {
      messageHandleException(S.of(context).unExcepectedException, context);
    } else if (statuesRequest == StatuesRequest.defaultException) {
      messageHandleException(S.of(context).errorPhoneUseBeforeApi, context);
    } else if (statuesRequest == StatuesRequest.serverError) {
      messageHandleException("${response}", context);
    } else if (statuesRequest == StatuesRequest.timeoutException) {
      messageHandleException(S.of(context).timeOutException, context);
    } else if (statuesRequest == StatuesRequest.unauthorizedException) {
      messageHandleExceptionVisitor(S.of(context).errorUnAuthorized, context);
    }
    update();
  }

  messageLogOut() {
    Get.defaultDialog(
        title: S.of(Get.context!).messageLogout,
        titleStyle: TextStyle(
          fontSize: 6.w,
          fontWeight: FontWeight.bold,
        ),
        titlePadding:
            EdgeInsets.only(top: 2.h, right: 3.h, left: 3.h, bottom: 5.w),
        middleText: S.of(Get.context!).bodyMessageLogout,
        middleTextStyle: TextStyle(
          fontSize: 4.w,
        ),
        confirm: Padding(
          padding: EdgeInsets.symmetric(vertical: 4.w, horizontal: 4.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(35.w, 5.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    side: const BorderSide(
                      color: Color(0xff2e70b3),
                    ),
                  ),
                  onPressed: () async {
                    await logOut(Get.context);
                  },
                  child: Text(
                    S.of(Get.context!).exit,
                    style: TextStyle(
                        color: const Color(0xff2e70b3), fontSize: 4.w),
                  )),
              SizedBox(
                width: 3.w,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xfff2ad22),
                    fixedSize: Size(28.w, 5.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    side: const BorderSide(
                      color: Color(0xfff2ad22),
                    ),
                  ),
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(
                    S.of(Get.context!).cancel,
                    style: TextStyle(color: Colors.white, fontSize: 4.w),
                  )),
            ],
          ),
        ));
  }
}
