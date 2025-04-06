import 'package:ejary_cash/controller/auth/verify_code_controller.dart';
import 'package:ejary_cash/core/class/api.dart';
import 'package:ejary_cash/core/constant/colors.dart';
import 'package:ejary_cash/core/function/handling_data.dart';
import 'package:ejary_cash/data/data%20source/register.dart';
import 'package:ejary_cash/data/model/user_model.dart';
import 'package:ejary_cash/generated/l10n.dart';
import 'package:ejary_cash/main.dart';
import 'package:ejary_cash/view/screens/auth/login/verify_activate.dart';
import 'package:ejary_cash/view/screens/home/home.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

import '../../core/class/status_request.dart';

class LoginController extends GetxController {
  VerifyCodeController controller = Get.put(VerifyCodeController());
  GlobalKey<FormState> loginGlobalKey = GlobalKey();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  StatuesRequest statuesRequest = StatuesRequest.none;
  RegisterRemoteData registerRemoteData = RegisterRemoteData(Get.put(Api()));

  bool showPass_1 = true;
  UserModel? userModel;
  String? tokenDevice;
  getToken() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    tokenDevice = await messaging.getToken();
  }
  //+9665XXXXXXXX or 05XXXXXXXX

  showPassword_1() {
    if (showPass_1 == false) {
      showPass_1 = true;
      update();
    } else {
      showPass_1 = false;
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
                Get.to(() => const VerifyCodeActivate());
                // Get.back();
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

  login(context) async {
    if (loginGlobalKey.currentState!.validate()) {
      statuesRequest = StatuesRequest.loading;
      update();
      var response = await registerRemoteData.login(
        emailController.text,
        passwordController.text,
        tokenDevice
      );
      print(" response ??? ${response}");

      statuesRequest = handlingData(response);

      if (statuesRequest == StatuesRequest.success &&
          response['data']['status'] == "pending") {
        messageHandleNotVerify(response['message'], context);
      } else if (statuesRequest == StatuesRequest.success &&
          response['data']['status'] != "pending") {
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
        sharedPreferences!.setBool("visit", false);

        sharedPreferences!.setString("pageStart", "Home");
        sharedPreferences!.setString("typeOfUser", "مستأجر");
        sharedPreferences!.setString("fav", userModel!.ownerFavAdsCount!);
        sharedPreferences!.setString("countAds", userModel!.ownerAdsCount!);
        sharedPreferences!.setString("view", userModel!.ownerViewsAdsCount!);

        Get.offAll(() => const Home(),
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
