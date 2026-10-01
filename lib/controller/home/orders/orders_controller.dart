import 'dart:developer';

import 'package:ejary_cash/controller/home/notification/notify_controller.dart';
import 'package:ejary_cash/core/class/api.dart';
import 'package:ejary_cash/core/class/status_request.dart';
import 'package:ejary_cash/core/constant/colors.dart';
import 'package:ejary_cash/core/function/handling_data.dart';
import 'package:ejary_cash/data/data%20source/projects.dart';
import 'package:ejary_cash/data/data%20source/rent.dart';
import 'package:ejary_cash/data/data%20source/setting.dart';
import 'package:ejary_cash/data/model/city_area_model.dart';
import 'package:ejary_cash/data/model/partener_model.dart';
import 'package:ejary_cash/generated/l10n.dart';
import 'package:ejary_cash/main.dart';
import 'package:ejary_cash/view/screens/auth/register/main_register.dart';
import 'package:ejary_cash/view/screens/home/orders/make_order/review_order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class OrdersController extends GetxController {
  bool choose_1 = false;
  bool choose_2 = false;
  bool choose_3 = false;
  bool choose = false;
  void checkValue() {
    if (choose == false) {
      choose = true;
      update();
    } else {
      choose = false;
      update();
    }
  }

  int? index;
  DateTime? _selectedDate;
  GlobalKey<FormState> partenerRentKey = GlobalKey();
  GlobalKey<FormState> personalRentKey = GlobalKey();
  GlobalKey<FormState> ownAdsRentKey = GlobalKey();

  TextEditingController notesController = TextEditingController();
  TextEditingController linkLocationController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameOwnerController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  TextEditingController phoneOwnerController = TextEditingController();

  String? partenerController;

  int? partenerId;
  TextEditingController dateOfMoveController = TextEditingController();
  TextEditingController yearelyRentController = TextEditingController();
  TextEditingController monthRentController = TextEditingController();

  TextEditingController timeRentController = TextEditingController();

  List<PartenerModel> partenerEjar = [];
  List<LocationModel> citiesList = [];
  List<LocationModel> districtsList = [];
  List<LocationModel> areasList = [];

  String? cityName;
  int? cityId;
  String? areaName;
  int? areaId;
  SettingRemoteData settingRemoteData = SettingRemoteData(Get.find<Api>());
  ProjectsRemoteData projectsRemoteData = ProjectsRemoteData(Get.find<Api>());

  RentRemoteData rentRemoteData = RentRemoteData(Get.find<Api>());
  StatuesRequest statuesRequest = StatuesRequest.none;
  bool isSubmitting = false;

  List paymentPlans = ["دفعة واحدة", "دفعتان"];
  String? paymentPlan;
  int? paymentId;
  void changePAymentPlan(val) {
    log(val);
    paymentPlan = val;
    paymentId = val == "دفعة واحدة" ? 1 : 2;

    log(paymentId.toString());
    if (yearelyRentController.text == "") {
    } else {
      computeMonthlyRent();
    }
    update();
  }

  void computeMonthlyRent() {
    final rawText = yearelyRentController.text.trim();
    final yearly = double.tryParse(rawText) ?? 0.0;
    if (yearly <= 0) {
      monthRentController.text = "0";
      update();
      return;
    }
    final rate = paymentId == 2 ? 0.20 : 0.35;
    final monthly = (yearly + (yearly * rate)) / 12;
    monthRentController.text = monthly.toStringAsFixed(2);
    update();
  }

  String type = "";
  void changeTytpe(typeSelect) {
    type = typeSelect;

    update();
  }

  void changePartener(val) {
    if (val is PartenerModel) {
      partenerController = val.name;
      partenerId = val.id;
    } else {
      partenerController = val?.toString();
      try {
        final found = partenerEjar.firstWhere((p) => p.name == val);
        partenerId = found.id;
      } catch (_) {}
    }
    update();
  }

  void changeCity(val) {
    cityName = val;
    getDistricts(Get.context);
    //  partenerId = val.id.toString();

    update();
  }

  void changeArea(val) {
    areaName = val;

    getCities(Get.context);

    log(areaId.toString());
    //  partenerId = val.id.toString();

    update();
  }

  String? districtName;
  int? districtId;
  void changeDistrict(val) {
    districtName = val;

    update();
  }

  Future<void> getDistricts(context) async {
    districtsList.clear();
    districtName = null;
    districtId = null;

    var response = await settingRemoteData.getDistricts(cityId!);
    print(" response ??? $response");

    statuesRequest = handlingData(response);

    if (statuesRequest == StatuesRequest.success) {
      List responseBody = response['data'];
      print("response :: $responseBody");
      districtsList.addAll(responseBody.map((e) => LocationModel.fromJson(e)));
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
      messageHandleExceptionVisitor(S.of(context).errorUnAuthorized, context);
    }
    update();
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



  Future<void> getAllProjects(context) async {
    statuesRequest = StatuesRequest.loading;
    update();
    var response = await projectsRemoteData
        .getAllProjects(sharedPreferences!.getString("token"));
    print(" response ??? ${response}");

    statuesRequest = handlingData(response);

    if (statuesRequest == StatuesRequest.success) {
      List responseBody = response['data'];
      print("response :: $responseBody");
      partenerEjar.addAll(responseBody.map((e) => PartenerModel.fromJson(e)));
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
      messageHandleException(response, context);
    } else if (statuesRequest == StatuesRequest.timeoutException) {
      messageHandleException(S.of(context).timeOutException, context);
    } else if (statuesRequest == StatuesRequest.unauthorizedException) {
      messageHandleExceptionVisitor(S.of(context).errorUnAuthorized, context);
    }
    update();
  }

  Future<void> getCities(context) async {
    citiesList.clear();
    cityName = null;
    cityId = null;

    var response = await settingRemoteData.getCities(areaId!);
    print(" response ??? $response");

    statuesRequest = handlingData(response);

    if (statuesRequest == StatuesRequest.success) {
      List responseBody = response['data'];
      print("response :: $responseBody");
      citiesList.addAll(responseBody.map((e) => LocationModel.fromJson(e)));
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
      messageHandleExceptionVisitor(S.of(context).errorUnAuthorized, context);
    }
    update();
  }

  Future<void> getAreas(context) async {
    var response = await settingRemoteData.getAreas();
    print(" response ??? ${response}");

    statuesRequest = handlingData(response);

    if (statuesRequest == StatuesRequest.success) {
      List responseBody = response['data'];
      print("response :: $responseBody");
      areasList.addAll(responseBody.map((e) => LocationModel.fromJson(e)));
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
              textAlign: TextAlign.center,
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

  String translateArabicDate(String arabicDate) {
    Map<String, String> arabicToEnglishDigits = {
      '٠': '0',
      '١': '1',
      '٢': '2',
      '٣': '3',
      '٤': '4',
      '٥': '5',
      '٦': '6',
      '٧': '7',
      '٨': '8',
      '٩': '9',
    };

    // Replace Arabic digits with English digits
    arabicToEnglishDigits.forEach((arabic, english) {
      arabicDate = arabicDate.replaceAll(arabic, english);
    });

    return arabicDate; // Returns the translated date
  }

  Future<void> selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // current date
      firstDate: DateTime.now(), // starting date
      lastDate: DateTime(2050), // ending date
    );

    if (pickedDate != null && pickedDate != _selectedDate) {
      _selectedDate = pickedDate;
      dateOfMoveController.text =
          translateArabicDate(DateFormat('yyyy-MM-dd').format(_selectedDate!));

      log(dateOfMoveController.text);

      update();
    }
  }

  void change_1() {
    if (choose_1 == false) {
      choose_1 = true;
      index = 0;
      choose_2 = false;
      choose_3 = false;

      update();
    } else {
      index = null;
      choose_1 = false;
      update();
    }
  }

  void change_2() {
    if (choose_2 == false) {
      choose_2 = true;
      index = 1;
      choose_1 = false;
      choose_3 = false;
      update();
    } else {
      index = null;
      choose_2 = false;
      update();
    }
  }

  void change_3() {
    if (choose_3 == false) {
      choose_3 = true;
      index = 2;
      choose_1 = false;
      choose_2 = false;
      update();
    } else {
      index = null;
      choose_3 = false;
      update();
    }
  }

  Future<void> rentPartener(context) async {
    if (isSubmitting) return;
    if (partenerRentKey.currentState!.validate()) {
      isSubmitting = true;
      statuesRequest = StatuesRequest.loading;
      update();
      try {
        var response = await rentRemoteData.rentPartener(
            sharedPreferences!.getString("token"),
            partenerId,
            yearelyRentController.text,
            notesController.text,
            dateOfMoveController.text,
            linkLocationController.text);

        statuesRequest = handlingData(response);

        if (statuesRequest == StatuesRequest.success) {
          Get.to(() => const ReviewOrder(),
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
          messageHandleException(response, context);
        } else if (statuesRequest == StatuesRequest.timeoutException) {
          messageHandleException(S.of(context).timeOutException, context);
        } else if (statuesRequest == StatuesRequest.unauthorizedException) {
          messageHandleExceptionVisitor(S.of(context).errorUnAuthorized, context);
        }
      } finally {
        isSubmitting = false;
        update();
      }
    }
  }

  Future<void> rentPersobal(context) async {
    if (isSubmitting) return;
    if (personalRentKey.currentState!.validate()) {
      isSubmitting = true;
      statuesRequest = StatuesRequest.loading;
      update();
      try {
        var response = await rentRemoteData.rentPersonal(
            sharedPreferences!.getString("token"),
            cityId,
            yearelyRentController.text,
            areaId,
            phoneOwnerController.text,
            notesController.text,
            linkLocationController.text,
            paymentPlan == "دفعة واحدة" ? "1" : "2",
            nameController.text,
            nameOwnerController.text,
            type == "نعم" ? "yes" : "no");

        statuesRequest = handlingData(response);

        if (statuesRequest == StatuesRequest.success) {
          Get.to(() => const ReviewOrder(),
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
          messageHandleException(response, context);
        } else if (statuesRequest == StatuesRequest.timeoutException) {
          messageHandleException(S.of(context).timeOutException, context);
        } else if (statuesRequest == StatuesRequest.unauthorizedException) {
          messageHandleExceptionVisitor(S.of(context).errorUnAuthorized, context);
        }
      } finally {
        isSubmitting = false;
        update();
      }
    }
  }

  Future<void> rentOwnAds(context, adsId, yearlyRent) async {
    if (isSubmitting) return;
    if (choose == true) {
      if (ownAdsRentKey.currentState != null &&
          !ownAdsRentKey.currentState!.validate()) {
        return;
      }
      isSubmitting = true;
      statuesRequest = StatuesRequest.loading;
      update();
      try {
        var response = await rentRemoteData.rentOwnAds(
            sharedPreferences!.getString("token"),
            dateOfMoveController.text,
            nameController.text,
            emailController.text,
            phoneController.text,
            adsId,
            yearlyRent);

        statuesRequest = handlingData(response);

        if (statuesRequest == StatuesRequest.success) {
          Get.to(() => const ReviewOrder(),
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
          messageHandleException(response, context);
        } else if (statuesRequest == StatuesRequest.timeoutException) {
          messageHandleException(S.of(context).timeOutException, context);
        } else if (statuesRequest == StatuesRequest.unauthorizedException) {
          messageHandleExceptionVisitor(S.of(context).errorUnAuthorized, context);
        }
      } finally {
        isSubmitting = false;
        update();
      }
    } else {
      messageHandleException(S.of(Get.context!).errorConfirmPrivacy, context);
    }
  }

  @override
  void onInit() {
    getAllProjects(Get.context);
    getAreas(Get.context);
    super.onInit();
  }

  @override
  void onClose() {
    notesController.dispose();
    linkLocationController.dispose();
    phoneController.dispose();
    nameOwnerController.dispose();
    nameController.dispose();
    emailController.dispose();
    phoneOwnerController.dispose();
    dateOfMoveController.dispose();
    yearelyRentController.dispose();
    monthRentController.dispose();
    timeRentController.dispose();
    super.onClose();
  }
}
