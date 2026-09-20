import 'package:ejary_cash/core/class/api.dart';
import 'package:ejary_cash/core/class/status_request.dart';
import 'package:ejary_cash/core/constant/colors.dart';
import 'package:ejary_cash/core/function/handling_data.dart';
import 'package:ejary_cash/data/data%20source/onboarding.dart';
import 'package:ejary_cash/data/model/onboarding_model.dart';
import 'package:ejary_cash/generated/l10n.dart';
import 'package:ejary_cash/main.dart';
import 'package:ejary_cash/view/screens/auth/register/main_register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class OnBoardController extends GetxController {
  StatuesRequest statuesRequest_3 = StatuesRequest.none;
  OnBoardingRemoteData rentRemoteData = OnBoardingRemoteData(Get.put(Api()));

  int indexList = 0;
  void onPressNext() {
    if (indexList == 0) {
      indexList++;

      update();
    } else {
      Get.to(() => const MainAuth(),
          transition: Transition.leftToRightWithFade,
          duration: const Duration(milliseconds: 800));
    }
  }

  void onPressSkip() {
    Get.to(() => const MainAuth(),
        transition: Transition.leftToRightWithFade,
        duration: const Duration(milliseconds: 800));
  }

  List<OnBoardingModel> onBoarding = [];
  Future<void> getAllUnites(context) async {
    onBoarding.clear();
    statuesRequest_3 = StatuesRequest.loading;
    update();
    var response = await rentRemoteData.getInfo();
    print(" response ??? ${response}");

    statuesRequest_3 = handlingData(response);

    if (statuesRequest_3 == StatuesRequest.success) {
      List responseBody = response['data'];
      print("response :: $responseBody");
      onBoarding.addAll(responseBody.map((e) => OnBoardingModel.fromJson(e)));
    } else if (statuesRequest_3 == StatuesRequest.unprocessableException) {
      messageHandleException("${response['message']}", context);
    } else if (statuesRequest_3 == StatuesRequest.socketException) {
      messageHandleException(S.of(context).noInternetApi, context);
    } else if (statuesRequest_3 == StatuesRequest.serverException) {
      messageHandleException(S.of(context).serverException, context);
    } else if (statuesRequest_3 == StatuesRequest.unExpectedException) {
      messageHandleException(S.of(context).unExcepectedException, context);
    } else if (statuesRequest_3 == StatuesRequest.defaultException) {
      messageHandleException(S.of(context).errorPhoneUseBeforeApi, context);
    } else if (statuesRequest_3 == StatuesRequest.serverError) {
      messageHandleException("${response}", context);
    } else if (statuesRequest_3 == StatuesRequest.timeoutException) {
      messageHandleException(S.of(context).timeOutException, context);
    } else if (statuesRequest_3 == StatuesRequest.unauthorizedException) {
      messageHandleExceptionVisitor(S.of(context).errorUnAuthorized, context);
    }
    update();
  }

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

  @override
  void onInit() {
    sharedPreferences!.setString("lang", "ar");
    getAllUnites(Get.context);
    super.onInit();
  }
}
