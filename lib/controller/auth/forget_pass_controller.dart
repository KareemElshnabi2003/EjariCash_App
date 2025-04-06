
import 'package:ejary_cash/core/class/api.dart';
import 'package:ejary_cash/core/class/status_request.dart';
import 'package:ejary_cash/core/constant/colors.dart';
import 'package:ejary_cash/core/function/handling_data.dart';
import 'package:ejary_cash/data/data%20source/register.dart';
import 'package:ejary_cash/generated/l10n.dart';
import 'package:ejary_cash/main.dart';
import 'package:ejary_cash/view/screens/auth/forgetPass/verify_forget_pass.dart';
import 'package:ejary_cash/view/screens/auth/login/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class ForgetPassController extends GetxController {
  GlobalKey<FormState> forgetGlobalKey = GlobalKey();

  GlobalKey<FormState> addNewPassGlobelKey = GlobalKey();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();
  StatuesRequest statuesRequest = StatuesRequest.none;
  RegisterRemoteData registerRemoteData = RegisterRemoteData(Get.put(Api()));
  bool showPass_1 = true;
  bool showPass_2 = true;

  showPassword_1() {
    if (showPass_1 == false) {
      showPass_1 = true;
      update();
    } else {
      showPass_1 = false;
      update();
    }
  }

  showPassword_2() {
    if (showPass_2 == false) {
      showPass_2 = true;
      update();
    } else {
      showPass_2 = false;
      update();
    }
  }

  emailValidate(String val) {
    if (val.isEmpty) {
      return S.of(Get.context!).errorEmail_1;
    } else if (!val.isEmail) {
      return S.of(Get.context!).errorEmail_2;
    } else if (val.contains(RegExp(r'[\u0600-\u06FF]'))) {
      return S.of(Get.context!).errorEmail_3;
    } else {
      return null;
    }
  }

  passwordValidate(String val) {
    if (val.isEmpty) {
      return S.of(Get.context!).errorPass_1;
    } else if (val.length < 8) {
      return S.of(Get.context!).errorPass_2;
    } else if (val.length > 20) {
      return S.of(Get.context!).errorPass_3;
    } else {
      return null;
    }
  }

  passwordConfirmationValidate(String val) {
    if (val.isEmpty) {
      return S.of(Get.context!).errorConfirmPass_1;
    } else if (passwordController.text != passwordConfirmationController.text) {
      return S.of(Get.context!).errorConfirmPass_2;
    } else {
      return null;
    }
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

  forgetPass(context) async {
    if (forgetGlobalKey.currentState!.validate()) {
      statuesRequest = StatuesRequest.loading;
      update();
      var response = await registerRemoteData.forgetPass(
        emailController.text,
      );
      print(" response ??? ${response}");
      print(" email ??? ${emailController.text}");

      statuesRequest = handlingData(response);

      if (statuesRequest == StatuesRequest.success) {
        dynamic responseBody = response['data'];
        print("response :: $responseBody");

        sharedPreferences!.setString("pageStart", "verifyForget");

        Get.to(() => const VerifyCodeForgetPass(),
            transition: Transition.leftToRightWithFade,
            duration: const Duration(milliseconds: 800));
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
    }
    update();
  }

  addNewPass(context) async {
    if (addNewPassGlobelKey.currentState!.validate()) {
      statuesRequest = StatuesRequest.loading;
      update();
      var response = await registerRemoteData.resetPass(
        emailController.text,
        passwordController.text,
        passwordConfirmationController.text,
      );
      print(" response ??? ${response}");

      statuesRequest = handlingData(response);

      if (statuesRequest == StatuesRequest.success) {
        dynamic responseBody = response['data'];
        print("response :: $responseBody");

        sharedPreferences!.setString("pageStart", "mainRegister");

        Get.offAll(() => const Login(),
            transition: Transition.leftToRightWithFade,
            duration: const Duration(milliseconds: 800));
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
    }
    update();
  }
}
