import 'package:ejary_cash/core/class/api.dart';
import 'package:ejary_cash/core/class/status_request.dart';
import 'package:ejary_cash/core/constant/colors.dart';
import 'package:ejary_cash/core/function/handling_data.dart';
import 'package:ejary_cash/data/data%20source/register.dart';
import 'package:ejary_cash/data/model/user_model.dart';
import 'package:ejary_cash/generated/l10n.dart';
import 'package:ejary_cash/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class OrdersOwnerController extends GetxController {
  StatuesRequest statuesRequest = StatuesRequest.none;
  RegisterRemoteData registerRemoteData = RegisterRemoteData(Get.put(Api()));

  UserModel? userModel;
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

  Future<void> getUserInfo(context) async {
    statuesRequest = StatuesRequest.loading;
    update();
    var response = await registerRemoteData
        .getUserData(sharedPreferences!.getString("token"));
    print(" response ??? ${response}");

    statuesRequest = handlingData(response);

    if (statuesRequest == StatuesRequest.success) {
      Map<String, dynamic> responseBody = response['data'];
      print("response :: $responseBody");
      userModel = UserModel.fromJson(responseBody);

      sharedPreferences!.setString("phone", "${userModel!.mobile}");
      sharedPreferences!.setString("email", "${userModel!.email}");

      sharedPreferences!.setString("token", "${userModel!.token}");
      sharedPreferences!.setString("bio", "${userModel!.bio}");
      sharedPreferences!.setString("birthDate", "${userModel!.birthdate}");
      sharedPreferences!.setString("name", "${userModel!.name}");
      sharedPreferences!.setString("img", "${userModel!.photoProfile}");
      sharedPreferences!.setString("linkedin", "${userModel!.linkedinLink}");
      sharedPreferences!.setString("fcmId", "${userModel!.fcmId}");
      sharedPreferences!.setString("accountType", "${userModel!.accountType}");
      sharedPreferences!.setString("status", "${userModel!.status}");
      sharedPreferences!.setBool("visit", false);
      sharedPreferences!.setString("fav", userModel!.ownerFavAdsCount!);
      sharedPreferences!.setString("countAds", userModel!.ownerAdsCount!);
      sharedPreferences!.setString("view", userModel!.ownerViewsAdsCount!);

      sharedPreferences!.setString("pageStart", "Home");
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
      messageHandleException(S.of(context).passwordNotCorrect, context);
    }
    update();
  }

  @override
  void onInit() {
    getUserInfo(Get.context);
    super.onInit();
  }
}
