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

class PrivacyController extends GetxController {
  bool isAnswer_1 = false;
  SettingModel? settingModel;
  StatuesRequest statuesRequest = StatuesRequest.none;

  SettingRemoteData settingRemoteData = SettingRemoteData(Get.put(Api()));
  String htmlData = "";

  Future<void> fetchHetState() async {
    htmlData = settingModel!.privacy!;
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

  getSetting(context) async {
    statuesRequest = StatuesRequest.loading;
    update();
    var response = await settingRemoteData.getSetting();
    print(" response ??? $response");

    statuesRequest = handlingData(response);

    if (statuesRequest == StatuesRequest.success) {
      Map<String, dynamic> responseBody = response['data'];
      print("response :: $responseBody");
      settingModel = SettingModel.fromJson(responseBody);
      fetchHetState();
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

  chang_1() {
    if (isAnswer_1 == false) {
      isAnswer_1 = true;
      update();
    } else {
      isAnswer_1 = false;
      update();
    }
  }

  bool isAnswer_2 = false;
  chang_2() {
    if (isAnswer_2 == false) {
      isAnswer_2 = true;
      update();
    } else {
      isAnswer_2 = false;
      update();
    }
  }

  bool isAnswer_3 = false;
  chang_3() {
    if (isAnswer_3 == false) {
      isAnswer_3 = true;
      update();
    } else {
      isAnswer_3 = false;
      update();
    }
  }

  bool isAnswer_4 = false;
  chang_4() {
    if (isAnswer_4 == false) {
      isAnswer_4 = true;
      update();
    } else {
      isAnswer_4 = false;
      update();
    }
  }

  @override
  void onInit() {
    getSetting(Get.context);
    super.onInit();
  }
}
