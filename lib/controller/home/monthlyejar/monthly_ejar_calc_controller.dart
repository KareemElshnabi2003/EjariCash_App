import 'package:ejary_cash/core/class/api.dart';
import 'package:ejary_cash/core/class/status_request.dart';
import 'package:ejary_cash/core/constant/colors.dart';
import 'package:ejary_cash/core/function/handling_data.dart';
import 'package:ejary_cash/data/data%20source/monthly_ejar.dart';
import 'package:ejary_cash/data/model/monthly_ejar_model.dart';
import 'package:ejary_cash/generated/l10n.dart';
import 'package:ejary_cash/main.dart';
import 'package:ejary_cash/view/screens/auth/register/main_register.dart';
import 'package:ejary_cash/view/screens/home/monthly%20ejar/info_about_monthly_ejar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class MonthlyEjarCalcController extends GetxController {
  GlobalKey<FormState> formGlobalKey = GlobalKey();

  TextEditingController monthlySalaryController = TextEditingController();
  TextEditingController typeOfJopController = TextEditingController();
  TextEditingController educationController = TextEditingController();
  TextEditingController monthlyDemandsController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController numOfFamilyController = TextEditingController();
  String type1 = "";
  String type2 = "";
  String nationality = '';
  String married = '';
  String? typeJop;
  String? education;
  String job = '';
  String educationId = '';
  MonthlyEjarModel? monthlyEjarModel;
  List typeJopList = ["خاصة", "عامة", "عسكرية"];
  List educationList = [
    "المدرسة الثانوية",
    "الدبلوم",
    "درجه الباكلوريوس",
    "درجه المجاستير",
    "درجة الدكتوراة",
    "أخري"
  ];
  MonthluEjarRemoteData monthluEjarRemoteData =
      MonthluEjarRemoteData(Get.put(Api()));
  StatuesRequest statuesRequest = StatuesRequest.none;
  void changeValJop(val) {
    typeJop = val;
    if (typeJop == "خاصة") {
      job = "private";
    } else if (typeJop == "عامة") {
      job = "public";
    } else {
      job = "military";
    }
    print("job >>> $job");
    update();
  }

  void changeValeducation(val) {
    education = val;
    if (education == "المدرسة الثانوية") {
      educationId = "1";
    } else if (education == "الدبلوم") {
      educationId = "2";
    } else if (education == "درجه الباكلوريوس") {
      educationId = "3";
    } else if (education == "درجه المجاستير") {
      educationId = "4";
    } else if (education == "درجة الدكتوراة") {
      educationId = "5";
    } else {
      education = "6";
    }
    update();
  }

  void changeTytpe_1(typeSelect) {
    type1 = typeSelect;
    if (type1 == "سعودي") {
      nationality = 'saudi';
    } else {
      nationality = 'resident';
    }
    update();
  }

  void changeTytpe_2(typeSelect) {
    type2 = typeSelect;
    if (type2 == "نعم") {
      married = 'yes';
    } else {
      married = 'no';
    }
    update();
  }

  String? monthSalleryValidate(String val) {
    if (val.isEmpty) {
      return S.of(Get.context!).validateEnterSalary;
    } else {
      return null;
    }
  }

  String? monthlyDemandsValidate(String val) {
    if (val.isEmpty) {
      return S.of(Get.context!).validateDemands;
    } else if (val.isNum) {
      return null;
    } else {
      return null;
      
    }
  }

  String? ageeValidate(String val) {
    if (val.isEmpty) {
      return S.of(Get.context!).validateAge_1;
    } else if (val.startsWith("0")) {
      return S.of(Get.context!).validateAge_2;
    } else if (val.length > 2) {
      return S.of(Get.context!).validateAge_3;
    } else if (val == "90" ||
        val == "91" ||
        val == "92" ||
        val == "93" ||
        val == "94" ||
        val == "95" ||
        val == "96" ||
        val == "97" ||
        val == "98" ||
        val == "99") {
      return S.of(Get.context!).validateAge_4;
    } else {
      return null;
    }
  }

  String? numOfFamilyValidate(String val) {
    if (val.isEmpty) {
      return S.of(Get.context!).validateNumOfFamily;
    } else {
      return null;
    }
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

  Future<void> computeMonthluEjar(context) async {
    if (formGlobalKey.currentState!.validate()) {
      statuesRequest = StatuesRequest.loading;
      update();
      var response = await monthluEjarRemoteData.monthlyEjar(
          sharedPreferences!.getString("token"),
          numOfFamilyController.text,
          job,
          monthlySalaryController.text,
          nationality,
          married,
          ageController.text,
          monthlyDemandsController.text,
          educationId);
      print(" response ??? $response");

      statuesRequest = handlingData(response);

      if (statuesRequest == StatuesRequest.success) {
        Map<String, dynamic> responseBody = response['data'];
        monthlyEjarModel = MonthlyEjarModel.fromJson(responseBody);
        Get.to(() => const InfoAboutMonthlyEjar(),
            transition: Transition.leftToRightWithFade,
            duration: const Duration(milliseconds: 800));
        print("response :: $responseBody");
      } else if (statuesRequest == StatuesRequest.unprocessableException) {
        messageHandleException("${response['message']}", context);
      } else if (statuesRequest == StatuesRequest.socketException) {
        messageHandleException(S.of(context).noInternetApi, context);
      } else if (statuesRequest == StatuesRequest.serverException) {
        messageHandleException(S.of(context).serverException, context);
      } else if (statuesRequest == StatuesRequest.unExpectedException) {
        messageHandleException(S.of(context).unExcepectedException, context);
      } else if (statuesRequest == StatuesRequest.defaultException) {
        messageHandleException(S.of(Get.context!).error, context);
      } else if (statuesRequest == StatuesRequest.serverError) {
        messageHandleException(S.of(Get.context!).fillAllFieldes, context);
      } else if (statuesRequest == StatuesRequest.timeoutException) {
        messageHandleException(S.of(context).timeOutException, context);
      } else if (statuesRequest == StatuesRequest.unauthorizedException) {
        messageHandleExceptionVisitor(S.of(context).errorUnAuthorized, context);
      }
    }
    update();
  }
}
