import 'dart:async';
import 'dart:io';

import 'package:ejary_cash/core/class/api.dart';
import 'package:ejary_cash/core/class/status_request.dart';
import 'package:ejary_cash/core/constant/colors.dart';
import 'package:ejary_cash/core/function/handling_data.dart';
import 'package:ejary_cash/data/data%20source/setting.dart';
import 'package:ejary_cash/data/data%20source/unites.dart';
import 'package:ejary_cash/data/model/city_area_model.dart';
import 'package:ejary_cash/generated/l10n.dart';
import 'package:ejary_cash/main.dart';
import 'package:ejary_cash/view/screens/auth/register/main_register.dart';
import 'package:ejary_cash/view/screens/home/addd_ads/ads_info_general/add_ads_info_2.dart';
import 'package:ejary_cash/view/screens/home/addd_ads/ads_info_general/add_ads_info_3.dart';
import 'package:ejary_cash/view/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class AddAdsController extends GetxController {
  bool choose_1 = false;
  bool choose_2 = false;
  bool owner = false;
  bool broker = false;
  String typeUser = '';
  String typeChoose = '';

  changeChoose(data) {
    if (data == "1") {
      choose_1 = true;
      choose_2 = false;
      typeChoose = "monthly";

      update();
    } else {
      choose_1 = false;
      choose_2 = true;
      typeChoose = "marketing";

      update();
    }
  }

  changeType(data) {
    if (data == "owner") {
      owner = true;
      broker = false;
      typeUser = "owner";

      update();
    } else {
      owner = false;
      broker = true;
      typeUser = "broker";

      update();
    }
  }

//form add ads broker
  GlobalKey<FormState> formOwnerPage1Key = GlobalKey();
  GlobalKey<FormState> formBrokerPage1Key = GlobalKey();
  GlobalKey<FormState> formPage2Key = GlobalKey();
  GlobalKey<FormState> formPage3Key = GlobalKey();
  TextEditingController comPanyNameController = TextEditingController();

  TextEditingController addressAdsController = TextEditingController();
  TextEditingController numberOfdeadController = TextEditingController();
  TextEditingController areaNumberController = TextEditingController();
  TextEditingController descriptionAdsController = TextEditingController();
  TextEditingController postaNumController = TextEditingController();
  TextEditingController numberOhBuildingController = TextEditingController();
  TextEditingController aditionalNumController = TextEditingController();
  TextEditingController streetWidthController = TextEditingController();
  TextEditingController yearPriceController = TextEditingController();
  TextEditingController monthPriceController = TextEditingController();

  TextEditingController insurancePriceController = TextEditingController();

  addressAdsValidator(String val) {
    if (val.isEmpty) {
      return S.of(Get.context!).validateAddress;
    } else {
      return null;
    }
  }

  numberOfdeadValidator(val) {
    if (val.isEmpty) {
      return S.of(Get.context!).validateDeedNum;
    } else {
      return null;
    }
  }

  areaNumberValidator(val) {
    if (val.isEmpty) {
      return S.of(Get.context!).validateAreaNum;
    } else {
      return null;
    }
  }

  descriptionAdsValidator(val) {
    if (val.isEmpty) {
      return S.of(Get.context!).validateDiscripe;
    } else {
      return null;
    }
  }

  postaNumValidator(val) {
    if (val.isEmpty) {
      return S.of(Get.context!).validatePostCode;
    } else {
      return null;
    }
  }

  numberOhBuildingValidator(val) {
    if (val.isEmpty) {
      return S.of(Get.context!).validateNumAds;
    } else {
      return null;
    }
  }

  // aditionalNumValidator(val) {
  //   if (val.isEmpty) {
  //     return "يرجي ادخال الرمز الاضافي";
  //   } else {
  //     return null;
  //   }
  // }

  streetWidthValidator(val) {
    if (val.isEmpty) {
      return S.of(Get.context!)..validateWidthStreet;
    } else {
      return null;
    }
  }

  yearPriceValidator(val) {
    if (val.isEmpty) {
      return S.of(Get.context!)..validateYearRent;
    } else {
      return null;
    }
  }

  insurancePriceValidator(val) {
    if (val.isEmpty) {
      return S.of(Get.context!).validateInsurance;
    } else {
      return null;
    }
  }

  String? face;
  changeFace(val) {
    face = val;
    update();
  }

  List faces = ["شمال", "شرق", "غرب", "جنوب"];

  //add ads owner

  String? typeBroker;
  changeTypeBroker(val) {
    typeBroker = val;
    update();
  }

  TextEditingController numberAuthController = TextEditingController();
  TextEditingController adsNumberController = TextEditingController();
  TextEditingController numberOffFalController = TextEditingController();
  numberAuthValidator(val) {
    if (val.isEmpty) {
      return S.of(Get.context!).validateAuthNum;
    } else {
      return null;
    }
  }

  companyNameValidator(val) {
    if (val.isEmpty) {
      return S.of(Get.context!).validateCompanyName;
    } else {
      return null;
    }
  }

  adsNumberValidator(val) {
    if (val.isEmpty) {
      return S.of(Get.context!).validateNumAds;
    } else {
      return null;
    }
  }

  numberOffFalValidator(val) {
    return null;
  }

//Add ads Info
  TextEditingController roomNumController = TextEditingController();
  TextEditingController bathRoomNumController = TextEditingController();
  TextEditingController parkingNumController = TextEditingController();
  TextEditingController liftsNumController = TextEditingController();
  TextEditingController loginWayController = TextEditingController();
  TextEditingController additionalPrivacyController = TextEditingController();
  roomNumValidator(val) {
    if (val.isEmpty) {
      return S.of(Get.context!).validateRoomNum;
    } else {
      return null;
    }
  }

  bathRoomNumValidator(val) {
    if (val.isEmpty) {
      return S.of(Get.context!).validateBathroomNum;
    } else {
      return null;
    }
  }

  parkingNumValidator(val) {
    if (val.isEmpty) {
      return S.of(Get.context!).validateParkingNum;
    } else {
      return null;
    }
  }

  liftsNumValidator(val) {
    if (val.isEmpty) {
      return S.of(Get.context!).vaildateLiftesNum;
    } else {
      return null;
    }
  }

  loginWayValidator(val) {
    if (val.isEmpty) {
      return S.of(Get.context!).validateLoginWay;
    } else {
      return null;
    }
  }

  additionalPrivacyValidator(val) {
    if (val.isEmpty) {
      return S.of(Get.context!).validateAdditionalTerms;
    } else {
      return null;
    }
  }

  String? propartyAge;
  String? preferEjar;
  List propartiesAge = [
    "جديدة",
    "أقل من سنة",
    "سنة واحدة",
    "سنتين",
    "3 سنوات",
    "4 سنوات",
    "5 سنوات",
    "6 سنوات",
    "7 سنوات",
    "8 سنوات",
    "9 سنوات",
    "10 سنوات",
    "أكثر من 10 سنوات",
  ];

  List preferesEjar = ["عزاب", "عوائل", "3"];
  changeProparty(val) {
    propartyAge = val;
    update();
  }

  changePrefer(val) {
    preferEjar = val;
    update();
  }

  List<String> facilitesList = [];
  bool facilities_1 = false;
  bool facilities_2 = false;
  bool facilities_3 = false;
  bool facilities_4 = false;
  bool facilities_5 = false;
  bool facilities_6 = false;
  bool facilities_7 = false;
  bool facilities_8 = false;
  bool facilities_9 = false;
  bool facilities_10 = false;
  bool facilities_11 = false;
  bool facilities_12 = false;
  bool facilities_13 = false;
  bool facilities_14 = false;

  changeFacilities_1(val, data) {
    facilities_1 = val;
    facilitesList.add(data);
    update();
  }

  changeFacilities_2(val, data) {
    facilities_2 = val;
    facilitesList.add(data);

    update();
  }

  changeFacilities_3(val, data) {
    facilities_3 = val;
    facilitesList.add(data);

    update();
  }

  changeFacilities_4(val, data) {
    facilities_4 = val;
    facilitesList.add(data);

    update();
  }

  changeFacilities_5(val, data) {
    facilities_5 = val;
    facilitesList.add(data);

    update();
  }

  changeFacilities_6(val, data) {
    facilities_6 = val;
    facilitesList.add(data);

    update();
  }

  changeFacilities_7(val, data) {
    facilities_7 = val;
    facilitesList.add(data);

    update();
  }

  changeFacilities_8(val, data) {
    facilities_8 = val;
    facilitesList.add(data);

    update();
  }

  changeFacilities_9(val, data) {
    facilities_9 = val;
    facilitesList.add(data);

    update();
  }

  changeFacilities_10(val, data) {
    facilities_10 = val;
    facilitesList.add(data);

    update();
  }

  changeFacilities_11(val, data) {
    facilities_11 = val;
    facilitesList.add(data);

    update();
  }

  changeFacilities_12(val, data) {
    facilities_12 = val;
    facilitesList.add(data);

    update();
  }

  changeFacilities_13(val, data) {
    facilities_13 = val;
    facilitesList.add(data);

    update();
  }

  changeFacilities_14(val, data) {
    facilities_14 = val;
    facilitesList.add(data);

    update();
  }

  /// add ads image
  File? image;
  String imagerequest = '';

  Future getImageFromGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) {
      return null;
    } else {
      image = File(returnImage.path);
      imagerequest = image!.path;
      print(imagerequest);

      update();
    }
    update();
  }

  deletImage() {
    image = null;
    imagerequest = '';
    update();
  }
  // multi image

  File? multyImage;
  String multyImagerequest = '';
  List<File> imagesFiles = [];
  List<String> images = [];

  Future getMultyImageFromGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) {
      return null;
    } else {
      multyImage = File(returnImage.path);
      multyImagerequest = multyImage!.path;
      print(multyImagerequest);

      imagesFiles.add(multyImage!);
      images.add(multyImagerequest);
      print(imagesFiles);
      print(images);

      update();
    }
    update();
  }

  deletMultyImage(index) {
    images.removeAt(index);
    imagesFiles.removeAt(index);
    update();
  }

  showMessageSuccsess() {
    Get.defaultDialog(
        title: S.of(Get.context!).warning,
        titleStyle: TextStyle(
            fontSize: 6.w,
            fontWeight: FontWeight.w600,
            color: LightMode.blackColor),
        titlePadding: EdgeInsets.only(top: 5.w),
        content: Padding(
          padding: EdgeInsets.all(3.w),
          child: Text(
            S.of(Get.context!).adsInReview,
            style: TextStyle(
                fontSize: 5.w,
                fontWeight: FontWeight.w600,
                color: LightMode.blueColor),
          ),
        ));

    Timer(const Duration(milliseconds: 1200), () {
      Get.offAll(const Home());
    });
  }

//Api

  StatuesRequest statuesRequest = StatuesRequest.none;
  AdsRemoteData adsRemoteData = AdsRemoteData(Get.put(Api()));

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

  nextButtonBroker_1() {
    if (formBrokerPage1Key.currentState!.validate()) {
      Get.to(() => const AddAdsInfo2(),
          transition: Transition.leftToRightWithFade,
          duration: const Duration(milliseconds: 800));
    }
  }

  nextButtonOwner_1() {
    if (formOwnerPage1Key.currentState!.validate()) {
      Get.to(() => const AddAdsInfo2(),
          transition: Transition.leftToRightWithFade,
          duration: const Duration(milliseconds: 800));
    }
  }

  nextButton_2() {
    if (formPage2Key.currentState!.validate()) {
      Get.to(() => const AddAdsInfo3(),
          transition: Transition.leftToRightWithFade,
          duration: const Duration(milliseconds: 800));
    }
  }

  addAdsBroker(context) async {
    // sharedPreferences!.clear();
    // log(facilitesList.toString());
    // log(typeBroker!);
    // log(categoryId.toString());
    // log(image.toString());
    // log(imagesFiles.toString());

    statuesRequest = StatuesRequest.loading;
    update();
    var response = await adsRemoteData.addAdsBroker(
        sharedPreferences!.getString("token")!,
        typeChoose,
        addressAdsController.text,
        adsNumberController.text,
        areaNumberController.text,
        descriptionAdsController.text,
        numberOhBuildingController.text,
        postaNumController.text,
        aditionalNumController.text,
        face,
        streetWidthController.text,
        yearPriceController.text,
        numberOffFalController.text,
        roomNumController.text,
        liftsNumController.text,
        parkingNumController.text,
        bathRoomNumController.text,
        propartyAge,
        preferEjar,
        additionalPrivacyController.text,
        facilitesList,
        image,
        imagesFiles,
        loginWayController.text,
        numberAuthController.text,
        typeBroker == "شركة" ? "company" : "person",
        comPanyNameController.text,
        categoryId,
        areaId,
        cityId);
    print(" response ??? ${response}");

    statuesRequest = handlingData(response);

    if (statuesRequest == StatuesRequest.success) {
      dynamic responseBody = response;
      print("response :: $responseBody");
      showMessageSuccsess();
    } else if (statuesRequest == StatuesRequest.unprocessableException) {
      messageHandleException("${response['message']}", context);
    } else if (statuesRequest == StatuesRequest.socketException) {
      messageHandleException(S.of(context).noInternetApi, context);
    } else if (statuesRequest == StatuesRequest.serverException) {
      messageHandleException(S.of(context).serverException, context);
    } else if (statuesRequest == StatuesRequest.unExpectedException) {
      messageHandleException(S.of(context).unExcepectedException, context);
    } else if (statuesRequest == StatuesRequest.defaultException) {
      messageHandleException("خطأ", context);
    } else if (statuesRequest == StatuesRequest.serverError) {
      messageHandleException("${response}", context);
    } else if (statuesRequest == StatuesRequest.timeoutException) {
      messageHandleException(S.of(context).timeOutException, context);
    } else if (statuesRequest == StatuesRequest.unauthorizedException) {
      messageHandleExceptionVisitor(S.of(context).errorUnAuthorized, context);
    }
    update();
  }

  addAdsOwner(context) async {
    statuesRequest = StatuesRequest.loading;
    update();
    var response = await adsRemoteData.addAdsOwner(
        sharedPreferences!.getString("token")!,
        typeChoose,
        addressAdsController.text,
        numberOfdeadController.text,
        areaNumberController.text,
        descriptionAdsController.text,
        numberOhBuildingController.text,
        postaNumController.text,
        aditionalNumController.text,
        face,
        streetWidthController.text,
        yearPriceController.text,
        insurancePriceController.text,
        roomNumController.text,
        liftsNumController.text,
        parkingNumController.text,
        bathRoomNumController.text,
        propartyAge,
        preferEjar,
        additionalPrivacyController.text,
        facilitesList,
        image,
        imagesFiles,
        loginWayController.text,
        categoryId,
        cityId,
        areaId);
    print(" response ??? ${response}");

    statuesRequest = handlingData(response);

    if (statuesRequest == StatuesRequest.success) {
      dynamic responseBody = response;
      print("response :: $responseBody");
      showMessageSuccsess();
    } else if (statuesRequest == StatuesRequest.unprocessableException) {
      messageHandleException("${response['message']}", context);
    } else if (statuesRequest == StatuesRequest.socketException) {
      messageHandleException(S.of(context).noInternetApi, context);
    } else if (statuesRequest == StatuesRequest.serverException) {
      messageHandleException(S.of(context).serverException, context);
    } else if (statuesRequest == StatuesRequest.unExpectedException) {
      messageHandleException(S.of(context).unExcepectedException, context);
    } else if (statuesRequest == StatuesRequest.defaultException) {
      messageHandleException("خطأ", context);
    } else if (statuesRequest == StatuesRequest.serverError) {
      messageHandleException("${response}", context);
    } else if (statuesRequest == StatuesRequest.timeoutException) {
      messageHandleException(S.of(context).timeOutException, context);
    } else if (statuesRequest == StatuesRequest.unauthorizedException) {
      messageHandleExceptionVisitor(S.of(context).errorUnAuthorized, context);
    }
    update();
  }

  List<LocationModel> citiesList = [];
  List<LocationModel> districtsList = [];
  List<LocationModel> areasList = [];
  List<LocationModel> categoryList = [];

  String? cityName;
  int? cityId;

  String? districtName;
  int? districtId;
  String? areaName;
  String? categoryName;

  int? areaId;
  int? categoryId;

  SettingRemoteData settingRemoteData = SettingRemoteData(Get.put(Api()));
  changeCity(val) {
    cityName = val;
    //  partenerId = val.id.toString();
    getDistricts(Get.context);

    update();
  }

  changeCategory(val) {
    categoryName = val;
    //  partenerId = val.id.toString();

    update();
  }

  changeArea(val) {
    areaName = val;

    getCities(Get.context);

    //  partenerId = val.id.toString();

    update();
  }

  changeDistrict(val) {
    districtName = val;

    update();
  }

  getDistricts(context) async {
    districtsList.clear();
    districtName = null;
    districtId = null;
    statuesRequest = StatuesRequest.loading;
    update();
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

  getCities(context) async {
    citiesList.clear();
    cityName = null;
    cityId = null;
    statuesRequest = StatuesRequest.loading;
    update();
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
                   S.of(context).login,
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

  getAreas(context) async {
    statuesRequest = StatuesRequest.loading;
    update();
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

  getCategories(context) async {
    statuesRequest = StatuesRequest.loading;
    update();
    var response = await settingRemoteData.getCategories();
    print(" response ??? ${response}");

    statuesRequest = handlingData(response);

    if (statuesRequest == StatuesRequest.success) {
      List responseBody = response['data'];
      print("response :: $responseBody");
      categoryList.addAll(responseBody.map((e) => LocationModel.fromJson(e)));
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

  @override
  void onInit() {
    getCategories(Get.context);
    getAreas(Get.context);
    super.onInit();
  }
}
