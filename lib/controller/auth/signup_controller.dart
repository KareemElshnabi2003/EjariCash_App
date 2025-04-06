import 'dart:async';

import 'package:ejary_cash/controller/auth/verify_code_controller.dart';
import 'package:ejary_cash/core/class/api.dart';
import 'package:ejary_cash/core/class/status_request.dart';
import 'package:ejary_cash/core/constant/colors.dart';
import 'package:ejary_cash/core/function/handling_data.dart';
import 'package:ejary_cash/data/data%20source/register.dart';
import 'package:ejary_cash/data/model/user_model.dart';
import 'package:ejary_cash/generated/l10n.dart';
import 'package:ejary_cash/main.dart';
import 'package:ejary_cash/view/screens/auth/register/verify_register.dart';
import 'package:ejary_cash/view/screens/home/home.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class SignupController extends GetxController {
  GlobalKey<FormState> signUpGlobalKey = GlobalKey();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  StatuesRequest statuesRequest = StatuesRequest.none;
  RegisterRemoteData registerRemoteData = RegisterRemoteData(Get.put(Api()));
  VerifyCodeController controller = Get.put(VerifyCodeController());
  bool choose = false;
  bool showPass_1 = true;
  bool showPass_2 = true;
  bool value = false;
  UserModel? userModel;
  String? tokenDevice;
  getToken() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    tokenDevice = await messaging.getToken();
  }
  changeValue(val) {
    value = val;
    update();
  }
  //+9665XXXXXXXX or 05XXXXXXXX

  String type = "";
  changeTytpe(typeSelect) {
    type = typeSelect;

    update();
  }

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

  emailValidate(String val, context) {
    if (val.isEmpty) {
      return S.of(context).errorEmail_1;
    } else if (!val.isEmail) {
      return S.of(context).errorEmail_2;
    } else if (val.contains(RegExp(r'[\u0600-\u06FF]'))) {
      return S.of(context).errorEmail_3;
    } else {
      return null;
    }
  }

  passwordValidate(String val, context) {
    if (val.isEmpty) {
      return S.of(context).errorPass_1;
    } else if (val.length < 8) {
      return S.of(context).errorPass_2;
    } else if (val.length > 20) {
      return S.of(context).errorPass_3;
    } else {
      return null;
    }
  }

  passwordConfirmationValidate(String val, context) {
    if (val.isEmpty) {
      return S.of(context).errorConfirmPass_1;
    } else if (passwordController.text != passwordConfirmationController.text) {
      return S.of(context).errorConfirmPass_2;
    } else {
      return null;
    }
  }

  phoneValidate(String val, context) {
    if (val.isEmpty) {
      return S.of(context).errorPhone_1;
    } else if (val.length == 8 && !val.startsWith("0")) {
      return null;
    } else if (!val.isPhoneNumber) {
      return S.of(context).errorPhone_2;
    } else if (val.length < 8) {
      return S.of(context).errorPhone_3;
    } else if (val.length > 9 && !val.startsWith("0")) {
      return S.of(context).errorPhone_3;
    } else if (val.length == 9 && val.startsWith("0")) {
      return S.of(context).errorPhone_3;
    } else if (val.length > 10 && val.startsWith("0")) {
      return S.of(context).errorPhone_3;
    } else if (val.length == 8 && !val.startsWith("0")) {
      return null;
    } else {
      return null;
    }
  }

  nameValidate(String val, context) {
    if (val.isEmpty) {
      return S.of(context).errorUserName_1;
    } else if (val.length < 3) {
      return S.of(context).errorUserName_2;
    } else if (val.length > 25) {
      return S.of(context).errorUserName_3;
    } else {
      return null;
    }
  }

  checkValue(val) {
    choose = val;
    update();
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

  messageHandleNotVerify(message, context) {
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
                sharedPreferences!.setString("email", emailController.text);
                controller.resendCode(context);
                Get.to(() => const VerifyCodeRegister());
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
                    S.of(context).verify,
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

  signUp(context) async {
    if (signUpGlobalKey.currentState!.validate() &&
        choose == true &&
        type != "") {
      statuesRequest = StatuesRequest.loading;
      update();
      var response = await registerRemoteData.signup(
          userNameController.text,
          emailController.text,
          passwordController.text,
          passwordConfirmationController.text,
          phoneController.text,
          tokenDevice
          );
      print(response);

      print(phoneController.text);

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
        sharedPreferences!
            .setString("accountType", "${userModel!.accountType}");
        sharedPreferences!.setString("status", "${userModel!.status}");
        sharedPreferences!.setString("typeOfUser", type);
        sharedPreferences!.setBool("visit", false);
        sharedPreferences!.setString("fav", userModel!.ownerFavAdsCount!);
        sharedPreferences!.setString("countAds", userModel!.ownerAdsCount!);
        sharedPreferences!.setString("view", userModel!.ownerViewsAdsCount!);

        sharedPreferences!.setString("pageStart", "verifyRegister");
        // sharedPreferences!.setString("pageStart", "Home");

        Get.to(() => const VerifyCodeRegister());
        // messageSuccsessSign();
        //  Get.offAll(() => const Home());
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
    } else {
      type == ""
          ? messageHandleException(S.of(context).errorChooseTypeOfUser, context)
          : choose == false
              ? messageHandleException(
                  S.of(context).errorConfirmPrivacy, context)
              : messageHandleException(S.of(context).fillAllFieldes, context);
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
}
