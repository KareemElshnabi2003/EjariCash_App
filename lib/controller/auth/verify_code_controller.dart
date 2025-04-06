import 'dart:async';

import 'package:ejary_cash/core/class/api.dart';
import 'package:ejary_cash/core/class/status_request.dart';
import 'package:ejary_cash/core/constant/colors.dart';
import 'package:ejary_cash/core/function/handling_data.dart';
import 'package:ejary_cash/data/data%20source/register.dart';
import 'package:ejary_cash/data/model/user_model.dart';
import 'package:ejary_cash/generated/l10n.dart';
import 'package:ejary_cash/main.dart';
import 'package:ejary_cash/view/screens/auth/forgetPass/add_new_pass.dart';
import 'package:ejary_cash/view/screens/auth/login/login.dart';
import 'package:ejary_cash/view/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class VerifyCodeController extends GetxController {
  StatuesRequest statuesRequest = StatuesRequest.none;
  RegisterRemoteData registerRemoteData = RegisterRemoteData(Get.put(Api()));
  UserModel? userModel;
  String? verifyCodeRegister;
  String? verifyCodeForgetPass;

  String? verifyCodeActivate;

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

  verifyRegister(context) async {
    if (verifyCodeRegister != null) {
      statuesRequest = StatuesRequest.loading;
      update();
      var response = await registerRemoteData.verifyCode(
          sharedPreferences!.getString("email"), verifyCodeRegister);
      print(response);
      print(sharedPreferences!.getString("email"));
      print(verifyCodeRegister);

      statuesRequest = handlingData(response);
      if (statuesRequest == StatuesRequest.success) {
        dynamic responseBody = response['data'];
        print("response :: $responseBody");

        sharedPreferences!.setString("pageStart", "Home");
        messageSuccsessSign();
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
        messageHandleException(S.of(context).codeError, context);
      } else if (statuesRequest == StatuesRequest.timeoutException) {
        messageHandleException(S.of(context).timeOutException, context);
      } else if (statuesRequest == StatuesRequest.unauthorizedException) {
        messageHandleException(S.of(context).passwordNotCorrect, context);
      }
    } else {
      messageHandleException(S.of(Get.context!).invalidOTP, context);
    }
    update();
  }

  verifyForgetPass(context) async {
    print(verifyCodeForgetPass);
    if (verifyCodeForgetPass != null) {
      statuesRequest = StatuesRequest.loading;
      update();
      var response = await registerRemoteData.verifyCodeForgetPass(
          sharedPreferences!.getString("email"), verifyCodeForgetPass);
      print(response);
      print(sharedPreferences!.getString("email"));
      print(verifyCodeForgetPass);

      statuesRequest = handlingData(response);
      if (statuesRequest == StatuesRequest.success) {
        dynamic responseBody = response['data'];
        print("response :: $responseBody");

        sharedPreferences!.setString("pageStart", "Home");
        Get.to(() => const AddNewPassword());
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
        messageHandleException(S.of(context).codeError, context);
      } else if (statuesRequest == StatuesRequest.timeoutException) {
        messageHandleException(S.of(context).timeOutException, context);
      } else if (statuesRequest == StatuesRequest.unauthorizedException) {
        messageHandleException(S.of(context).passwordNotCorrect, context);
      }
    } else {
      messageHandleException(S.of(Get.context!).invalidOTP, context);
    }
    update();
  }

  verifyActivate(context) async {
    if (verifyCodeActivate != null) {
      statuesRequest = StatuesRequest.loading;
      update();
      var response = await registerRemoteData.verifyCodeActivate(
          sharedPreferences!.getString("email"), verifyCodeActivate);
      print(response);
      print(sharedPreferences!.getString("email"));
      print(verifyCodeForgetPass);

      statuesRequest = handlingData(response);
      if (statuesRequest == StatuesRequest.success) {
        dynamic responseBody = response['data'];
        print("response :: $responseBody");

        sharedPreferences!.setString("pageStart", "mainRegister");
        Get.offAll(() => const Login());
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
        messageHandleException(S.of(context).codeError, context);
      } else if (statuesRequest == StatuesRequest.timeoutException) {
        messageHandleException(S.of(context).timeOutException, context);
      } else if (statuesRequest == StatuesRequest.unauthorizedException) {
        messageHandleException(S.of(context).passwordNotCorrect, context);
      }
    } else {
      messageHandleException(S.of(Get.context!).invalidOTP, context);
    }
    update();
  }

  messageSuccsessSign() {
    Get.defaultDialog(
        backgroundColor: LightMode.whiteColor,
        title: "",
        titlePadding: EdgeInsets.zero,
        content: Text(
          "تم إنشاء الحساب بنجاح",
          style: GoogleFonts.tajawal(
              fontSize: 4.w,
              fontWeight: FontWeight.bold,
              color: LightMode.blueColor),
        ),
        contentPadding: EdgeInsets.all(3.w));
    Timer(const Duration(milliseconds: 2000), () {
      Get.offAll(() => const Home());
    });
  }

  resendCode(context) async {
    statuesRequest = StatuesRequest.loading;
    update();
    var response = await registerRemoteData
        .resendCode(sharedPreferences!.getString("email"));
    print(response);
    print(sharedPreferences!.getString("email"));

    statuesRequest = handlingData(response);
    if (statuesRequest == StatuesRequest.success) {
      Map<String, dynamic> responseBody = response['data'];
      print("response :: $responseBody");
      userModel = UserModel.fromJson(responseBody);
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
      messageHandleException(S.of(context).codeError, context);
    } else if (statuesRequest == StatuesRequest.timeoutException) {
      messageHandleException(S.of(context).timeOutException, context);
    } else if (statuesRequest == StatuesRequest.unauthorizedException) {
      messageHandleException(S.of(context).passwordNotCorrect, context);
    }

    update();
  }

  @override
  void onInit() {
    print(sharedPreferences!.get("lang"));
    super.onInit();
  }
}
