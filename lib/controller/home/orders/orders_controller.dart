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
  checkValue() {
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
  SettingRemoteData settingRemoteData = SettingRemoteData(Get.put(Api()));
  ProjectsRemoteData projectsRemoteData = ProjectsRemoteData(Get.put(Api()));

  RentRemoteData rentRemoteData = RentRemoteData(Get.put(Api()));
  StatuesRequest statuesRequest = StatuesRequest.none;
  NotifyController notifyController = Get.put(NotifyController());

  List paymentPlans = ["دفعة واحدة", "دفعتان"];
  String? paymentPlan;
  int? paymentId;
  changePAymentPlan(val) {
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

  computeMonthlyRent() {
    monthRentController.text = paymentId == 2
        ? ((double.parse(yearelyRentController.text == ""
                        ? "0"
                        : yearelyRentController.text) +
                    (double.parse(yearelyRentController.text == ""
                            ? "0"
                            : yearelyRentController.text) /
                        5)) /
                12)
            .toStringAsFixed(2)
            .toString()
        : ((double.parse(yearelyRentController.text == ""
                        ? "0"
                        : yearelyRentController.text) +
                    (double.parse(yearelyRentController.text == ""
                            ? "0"
                            : yearelyRentController.text) *
                        0.35)) /
                12)
            .toStringAsFixed(2)
            .toString();
    log(monthRentController.text);

    update();
  }

  String type = "";
  changeTytpe(typeSelect) {
    type = typeSelect;

    update();
  }

  changePartener(val) {
    partenerController = val;
    //  partenerId = val.id.toString();

    update();
  }

  changeCity(val) {
    cityName = val;
    getDistricts(Get.context);
    //  partenerId = val.id.toString();

    update();
  }

  changeArea(val) {
    areaName = val;

    getCities(Get.context);

    log(areaId.toString());
    //  partenerId = val.id.toString();

    update();
  }

  String? districtName;
  int? districtId;
  changeDistrict(val) {
    districtName = val;

    update();
  }

  getDistricts(context) async {
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

  messageLogOut() {
    Get.defaultDialog(
        title: S.of(Get.context!).deleteAccount,
        titleStyle: TextStyle(
          fontSize: 6.w,
          fontWeight: FontWeight.bold,
        ),
        titlePadding:
            EdgeInsets.only(top: 2.h, right: 3.h, left: 3.h, bottom: 5.w),
        middleText: S.of(Get.context!).bodyDeletAccount,
        middleTextStyle: TextStyle(
          fontSize: 4.w,
        ),
        confirm: Padding(
          padding: EdgeInsets.symmetric(vertical: 4.w, horizontal: 4.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(30.w, 5.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    side: const BorderSide(
                      color: Color(0xff2e70b3),
                    ),
                  ),
                  onPressed: () async {},
                  child: Text(
                    S.of(Get.context!).yesDelete,
                    style: TextStyle(
                        color: const Color(0xff2e70b3), fontSize: 4.w),
                  )),
              SizedBox(
                width: 3.w,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xfff2ad22),
                    fixedSize: Size(30.w, 5.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    side: const BorderSide(
                      color: Color(0xfff2ad22),
                    ),
                  ),
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(
                    S.of(Get.context!).cancel,
                    style: TextStyle(color: Colors.white, fontSize: 4.w),
                  )),
            ],
          ),
        ));
  }

  getAllProjects(context) async {
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

  getCities(context) async {
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

  getAreas(context) async {
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

  messageHandleException(message, context) {
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

  change_1() {
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

  change_2() {
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

  change_3() {
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

  rentPartener(context) async {
    if (partenerRentKey.currentState!.validate()) {
      log("$partenerId");
      statuesRequest = StatuesRequest.loading;
      update();
      var response = await rentRemoteData.rentPartener(
          sharedPreferences!.getString("token"),
          partenerId,
          yearelyRentController.text,
          notesController.text,
          dateOfMoveController.text,
          linkLocationController.text);
      print(" response ??? ${response}");

      statuesRequest = handlingData(response);

      if (statuesRequest == StatuesRequest.success) {
        dynamic responseBody = response;
        print("response :: $responseBody");
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
    } else {}
    update();
  }

  rentPersobal(context) async {
    if (personalRentKey.currentState!.validate()) {
      log("$partenerId");
      statuesRequest = StatuesRequest.loading;
      update();
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
      print(" response ??? ${response}");

      statuesRequest = handlingData(response);

      if (statuesRequest == StatuesRequest.success) {
        dynamic responseBody = response;
        print("response :: $responseBody");
        notifyController.sendNotification(context);

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
    } else {}
    update();
  }

  rentOwnAds(context, adsId,yearlyRent) async {
    log(adsId);
    if (choose == true) {
      statuesRequest = StatuesRequest.loading;
      update();
      var response = await rentRemoteData.rentOwnAds(
          sharedPreferences!.getString("token"),
          dateOfMoveController.text,
          nameController.text,
          emailController.text,
          phoneController.text,
          adsId,yearlyRent);
      print(" response ??? ${response}");

      statuesRequest = handlingData(response);

      if (statuesRequest == StatuesRequest.success) {
        dynamic responseBody = response;
        print("response :: $responseBody");
        notifyController.sendNotification(context);
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
    } else {
      messageHandleException(S.of(Get.context!).errorConfirmPrivacy, context);
    }
    update();
  }

  @override
  void onInit() {
    // linkLocationController.text = "https://maps.app.goo.gl/noaAhN5neYAHrKRz8";
    getAllProjects(Get.context);
    getAreas(Get.context);

    super.onInit();
  }
}
