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

  SettingRemoteData settingRemoteData = SettingRemoteData(Get.find<Api>());
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

  Future<void> _safeLaunch(Uri primary, [Uri? fallback]) async {
    try {
      final launched =
          await launchUrl(primary, mode: LaunchMode.externalApplication);
      if (!launched && fallback != null) {
        await launchUrl(fallback, mode: LaunchMode.externalApplication);
      }
    } catch (_) {
      if (fallback != null) {
        try {
          await launchUrl(fallback, mode: LaunchMode.externalApplication);
          return;
        } catch (_) {}
      }
      Get.snackbar(
        'تنبيه',
        'تعذر فتح الرابط المطلوب',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> urlLuncher(
    String name,
  ) async {
    if (settingModel == null) return;

    if (name == "sms") {
      final phone = settingModel!.phone ?? '';
      await _safeLaunch(Uri.parse('sms:$phone'));
    } else if (name == "phone") {
      final phone = settingModel!.phone ?? '';
      await _safeLaunch(Uri.parse('tel:$phone'));
    } else if (name == "watsappNormal") {
      final phone = (settingModel!.whatsappPhone ?? '')
          .replaceAll('+', '')
          .replaceAll(' ', '');
      await _safeLaunch(
        Uri.parse('whatsapp://send?phone=$phone'),
        Uri.parse('https://wa.me/$phone'),
      );
    } else if (name == "watsappWorks") {
      final phone = (settingModel!.whatsappBusiness ?? '')
          .replaceAll('+', '')
          .replaceAll(' ', '');
      await _safeLaunch(
        Uri.parse('whatsapp://send?phone=$phone'),
        Uri.parse('https://wa.me/$phone'),
      );
    } else if (name == "facebook") {
      await _safeLaunch(Uri.parse('https://www.facebook.com/ejaricash'));
    } else if (name == "instagram") {
      await _safeLaunch(Uri.parse('https://www.instagram.com/ejaricash'));
    } else if (name == "twitter") {
      await _safeLaunch(Uri.parse('https://x.com/ejaricash'));
    } else if (name == "linkedin") {
      await _safeLaunch(
          Uri.parse('https://www.linkedin.com/company/ejaricash'));
    } else if (name == "tiktok") {
      await _safeLaunch(Uri.parse('https://www.tiktok.com/@ejaricash'));
    } else if (name == "gmail") {
      final email = settingModel!.email ?? '';
      await _safeLaunch(Uri.parse('mailto:$email?subject=استفسار&body=مرحبا'));
    }
  }

  @override
  void onInit() {
    getSetting(Get.context);
    super.onInit();
  }
}
