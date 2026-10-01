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
  RegisterRemoteData registerRemoteData = RegisterRemoteData(Get.find<Api>());
  UserModel? userModel;
  String? verifyCodeRegister;
  String? verifyCodeForgetPass;
  String? verifyCodeActivate;
  Timer? _successTimer;

  bool _isValidOtp(String? code) {
    if (code == null) return false;
    final trimmed = code.trim();
    return trimmed.isNotEmpty &&
        trimmed.length >= 4 &&
        RegExp(r'^\d+$').hasMatch(trimmed);
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

  Future<void> verifyRegister(context) async {
    final email = sharedPreferences?.getString("email")?.trim();
    if (email == null || email.isEmpty) {
      messageHandleException(S.of(context).errorEmail_1, context);
      return;
    }

    if (_isValidOtp(verifyCodeRegister)) {
      statuesRequest = StatuesRequest.loading;
      update();
      var response = await registerRemoteData.verifyCode(
          email, verifyCodeRegister!.trim());

      statuesRequest = handlingData(response);
      if (statuesRequest == StatuesRequest.success) {
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

  Future<void> verifyForgetPass(context) async {
    final email = sharedPreferences?.getString("email")?.trim();
    if (email == null || email.isEmpty) {
      messageHandleException(S.of(context).errorEmail_1, context);
      return;
    }

    if (_isValidOtp(verifyCodeForgetPass)) {
      statuesRequest = StatuesRequest.loading;
      update();
      var response = await registerRemoteData.verifyCodeForgetPass(
          email, verifyCodeForgetPass!.trim());

      statuesRequest = handlingData(response);
      if (statuesRequest == StatuesRequest.success) {
        // Set state to resetPassword, NOT Home!
        sharedPreferences!.setString("pageStart", "resetPassword");
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

  Future<void> verifyActivate(context) async {
    final email = sharedPreferences?.getString("email")?.trim();
    if (email == null || email.isEmpty) {
      messageHandleException(S.of(context).errorEmail_1, context);
      return;
    }

    if (_isValidOtp(verifyCodeActivate)) {
      statuesRequest = StatuesRequest.loading;
      update();
      var response = await registerRemoteData.verifyCodeActivate(
          email, verifyCodeActivate!.trim());

      statuesRequest = handlingData(response);
      if (statuesRequest == StatuesRequest.success) {
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

  void messageSuccsessSign() {
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
    _successTimer?.cancel();
    _successTimer = Timer(const Duration(milliseconds: 2000), () {
      Get.offAll(() => const Home());
    });
  }

  Future<void> resendCode(context) async {
    final email = sharedPreferences?.getString("email")?.trim();
    if (email == null || email.isEmpty) return;

    statuesRequest = StatuesRequest.loading;
    update();
    var response = await registerRemoteData.resendCode(email);

    statuesRequest = handlingData(response);
    if (statuesRequest == StatuesRequest.success) {
      Map<String, dynamic> responseBody = response['data'] ?? {};
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
  void onClose() {
    _successTimer?.cancel();
    super.onClose();
  }
}
