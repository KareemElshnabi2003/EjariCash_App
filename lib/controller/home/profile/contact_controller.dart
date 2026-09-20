import 'package:ejary_cash/core/class/api.dart';
import 'package:ejary_cash/core/class/status_request.dart';
import 'package:ejary_cash/core/constant/colors.dart';
import 'package:ejary_cash/core/function/handling_data.dart';
import 'package:ejary_cash/data/data%20source/setting.dart';
import 'package:ejary_cash/data/model/setting_model.dart';
import 'package:ejary_cash/generated/l10n.dart';
import 'package:ejary_cash/view/screens/auth/register/main_register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_go/extensions/responsive_nums.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactController extends GetxController {
  SettingModel? settingModel;
  StatuesRequest statuesRequest = StatuesRequest.none;

  SettingRemoteData settingRemoteData = SettingRemoteData(Get.put(Api()));
  void messageHandleException(message, context) {
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
  void messageHandleExceptionVisitor(message, context) {
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
                Get.offAll(()=>const MainAuth());              },
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
  Future<void> getSetting(context) async {
    statuesRequest = StatuesRequest.loading;
    update();
    var response = await settingRemoteData.getSetting();
    print(" response ??? $response");

    statuesRequest = handlingData(response);

    if (statuesRequest == StatuesRequest.success) {
      Map<String, dynamic> responseBody = response['data'];
      print("response :: $responseBody");
      settingModel = SettingModel.fromJson(responseBody);
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
      messageHandleException("$response", context);
    } else if (statuesRequest == StatuesRequest.timeoutException) {
      messageHandleException(S.of(context).timeOutException, context);
    } else if (statuesRequest == StatuesRequest.unauthorizedException) {
      messageHandleExceptionVisitor(S.of(context).errorUnAuthorized, context);
    }
    update();
  }

  Future<void> urlLuncher(
    String name,
  ) async {
    if (name == "sms") {
      final Uri url = Uri.parse('sms:${settingModel!.phone}');
      if (!await launchUrl(url)) {
        throw "can't launch $url";
      }
    } else if (name == "phone") {
      final Uri url = Uri.parse('tel:${settingModel!.phone}');
      if (!await launchUrl(url)) {
        throw "can't launch $url";
      }
    } else if (name == "watsappNormal") {
      final Uri url =
          Uri.parse('whatsapp://send?phone=${settingModel!.whatsappPhone}');
      if (!await launchUrl(url)) {
        throw "can't launch $url";
      }
    } else if (name == "watsappWorks") {
      final Uri url =
          Uri.parse('whatsapp://send?phone=${settingModel!.whatsappBusiness}');
      if (!await launchUrl(url)) {
        throw "can't launch $url";
      }
    } else if (name == "facebook") {
      final Uri url = Uri.parse(
          'https://m.facebook.com/whiteEagleEventCompany?mibextid=LQQJ4d');
      if (!await launchUrl(url)) {
        throw "can't launch $url";
      }
    } else if (name == "instagram") {
      final Uri url = Uri.parse(
          'https://www.instagram.com/whiteeagle_event?igsh=NzI1d2Q5dnlqY20y&utm_source=qr');

      if (!await launchUrl(url)) {
        throw "can't launch $url";
      }
    } else if (name == "twitter") {
      final Uri url = Uri.parse('https://www.threads.net/@whiteeagle_event');

      if (!await launchUrl(url)) {
        throw "can't launch $url";
      }
    } else if (name == "linkedin") {
      final Uri url = Uri.parse(
          'https://www.linkedin.com/company/white-eagle-event-company/');

      if (!await launchUrl(url)) {
        throw "can't launch $url";
      }
    } else if (name == "tiktok") {
      final Uri url = Uri.parse(
          'https://www.tiktok.com/@whiteeagleevent?_t=8lDZLVLCod8&_r=1');

      if (!await launchUrl(url)) {
        throw "can't launch $url";
      }
    } else if (name == "gmail") {
      final Uri url = Uri.parse(
          'mailto:${settingModel!.email}?subject=News&body=New plugin');

      if (!await launchUrl(url)) {
        throw "can't launch $url";
      }
    }
  }

  @override
  void onInit() {
    getSetting(Get.context);
    super.onInit();
  }
}
