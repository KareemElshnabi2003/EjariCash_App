import 'dart:developer';

import 'package:ejary_cash/core/class/api.dart';
import 'package:ejary_cash/core/class/status_request.dart';
import 'package:ejary_cash/core/constant/colors.dart';
import 'package:ejary_cash/core/function/handling_data.dart';
import 'package:ejary_cash/data/data%20source/unites.dart';
import 'package:ejary_cash/data/model/ads_model.dart';
import 'package:ejary_cash/data/model/ads_owner_model.dart';
import 'package:ejary_cash/generated/l10n.dart';
import 'package:ejary_cash/main.dart';
import 'package:ejary_cash/view/screens/auth/register/main_register.dart';
import 'package:ejary_cash/view/widget/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class AdsController extends GetxController {
  StatuesRequest statuesRequest = StatuesRequest.none;
  AdsRemoteData adsRemoteData = AdsRemoteData(Get.put(Api()));
  TextEditingController minController = TextEditingController();
  TextEditingController maxController = TextEditingController();
  List<AdsModel> filterAds = [];

  List<AdsOwnerModel> filterAdsOwner = [];
  String type = '';
  String priceType = '';
  int numOfRoome = 0;
  bool filter = false;
  bool filterOwner = false;

  bool isFav = false;
  List<AdsModel> allAds = [];
  List<AdsOwnerModel> allAdsOwner = [];

  changeTytpe(typeSelect) {
    type = typeSelect;

    update();
  }

  plusNum() {
    numOfRoome++;
    update();
  }

  minusNum() {
    if (numOfRoome == 0 || numOfRoome < 0) {
    } else {
      numOfRoome--;
      update();
    }
  }

  setFav() {
    if (isFav == false) {
      isFav = true;
      update();
    } else {
      isFav = false;
      update();
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

  Future<List<AdsModel>> getAllAds(context) async {
    allAds.clear();
    filter = false;
    statuesRequest = StatuesRequest.loading;
    update();
    var response = await adsRemoteData.getAllAds();
    print(" response ??? ${response}");

    statuesRequest = handlingData(response);

    if (statuesRequest == StatuesRequest.success) {
      List responseBody = response['data'];
      print("response :: $responseBody");
      allAds.addAll(responseBody.map((e) => AdsModel.fromJson(e)));
    } else if (statuesRequest == StatuesRequest.unprocessableException) {
      messageHandleException("${response['message']}", context);
    } else if (statuesRequest == StatuesRequest.socketException) {
      messageHandleException(S.of(context).noInternetApi, context);
    } else if (statuesRequest == StatuesRequest.serverException) {
      messageHandleException(S.of(context).serverException, context);
    } else if (statuesRequest == StatuesRequest.unExpectedException) {
      messageHandleException(S.of(context).unExcepectedException, context);
    } else if (statuesRequest == StatuesRequest.defaultException) {
      messageHandleException(S.of(context).error, context);
    } else if (statuesRequest == StatuesRequest.serverError) {
      messageHandleException("${response}", context);
    } else if (statuesRequest == StatuesRequest.timeoutException) {
      messageHandleException(S.of(context).timeOutException, context);
    } else if (statuesRequest == StatuesRequest.unauthorizedException) {
      messageHandleExceptionVisitor(S.of(context).errorUnAuthorized, context);
    }
    update();
    return allAds;
  }

  Future<List<AdsOwnerModel>> getAllAdsForOwner(context) async {
    allAdsOwner.clear();
    filterOwner = false;
    statuesRequest = StatuesRequest.loading;
    update();
    var response = await adsRemoteData
        .getAllAdsOwner(sharedPreferences!.getString("token"));
    log(" response ??? ${response}");

    statuesRequest = handlingData(response);

    if (statuesRequest == StatuesRequest.success) {
      List responseBody = response['data'];
      print("response :: $responseBody");
      allAdsOwner.addAll(responseBody.map((e) => AdsOwnerModel.fromJson(e)));
      sharedPreferences!.setString("leangthAdsOwner", "${allAdsOwner.length}");
    } else if (statuesRequest == StatuesRequest.unprocessableException) {
      messageHandleException("${response['message']}", context);
    } else if (statuesRequest == StatuesRequest.socketException) {
      messageHandleException(S.of(context).noInternetApi, context);
    } else if (statuesRequest == StatuesRequest.serverException) {
      messageHandleException(S.of(context).serverException, context);
    } else if (statuesRequest == StatuesRequest.unExpectedException) {
      messageHandleException(S.of(context).unExcepectedException, context);
    } else if (statuesRequest == StatuesRequest.defaultException) {
      messageHandleException(S.of(context).error, context);
    } else if (statuesRequest == StatuesRequest.serverError) {
      messageHandleException("${response}", context);
    } else if (statuesRequest == StatuesRequest.timeoutException) {
      messageHandleException(S.of(context).timeOutException, context);
    } else if (statuesRequest == StatuesRequest.unauthorizedException) {
      messageHandleExceptionVisitor(S.of(context).errorUnAuthorized, context);
    }
    update();
    return allAdsOwner;
  }

  messageFilterAds() {
    return Get.bottomSheet(
      isDismissible: false,
      backgroundColor: LightMode.whiteColor,
      GetBuilder<AdsController>(
        builder: (controller) => statuesRequest == StatuesRequest.loading
            ? loading(80.h)
            : Container(
                height: 100.h,
                width: 100.w,
                margin: EdgeInsets.only(bottom: 2.h, right: 5.w, left: 5.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.w),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 5.w,
                      ),
                      Text(
                        S.of(Get.context!).filterUnits,
                        style: GoogleFonts.tajawal(
                            fontSize: 5.w,
                            fontWeight: FontWeight.w700,
                            color: LightMode.blackColor),
                      ),
                      SizedBox(
                        height: 5.w,
                      ),
                      Text(
                        S.of(Get.context!).typePay,
                        style: GoogleFonts.tajawal(
                            fontSize: 5.w,
                            fontWeight: FontWeight.w700,
                            color: LightMode.blackColor),
                      ),
                      SizedBox(
                        width: 70.w,
                        // margin: EdgeInsets.only(right: 4.w, left: 4.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: 30.w,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Radio<String>(
                                      activeColor: LightMode.blueColor,
                                      value: 'شهري',
                                      groupValue: type,
                                      onChanged: (val) {
                                        type = "شهري";
                                        priceType = "per_month";
                                        update();
                                      }),
                                  Container(
                                    alignment: Alignment.centerRight,
                                    child: Text(S.of(Get.context!).monthly,
                                        style: GoogleFonts.tajawal(
                                            fontSize: 4.w,
                                            fontWeight: FontWeight.w900,
                                            color: LightMode.blackColor)),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            SizedBox(
                              width: 30.w,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Radio<String>(
                                      activeColor: LightMode.blueColor,
                                      value: 'سنوي',
                                      groupValue: type,
                                      onChanged: (val) {
                                        type = "سنوي";
                                        priceType = "per_year";

                                        update();
                                      }),
                                  Container(
                                    alignment: Alignment.centerRight,
                                    child: Text(S.of(Get.context!).yearly,
                                        style: GoogleFonts.tajawal(
                                            fontSize: 4.w,
                                            fontWeight: FontWeight.w900,
                                            color: LightMode.blackColor)),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5.w,
                      ),
                      Text(S.of(Get.context!).priceLimit,
                          style: GoogleFonts.tajawal(
                              fontSize: 5.w,
                              fontWeight: FontWeight.w700,
                              color: LightMode.blackColor)),
                      SizedBox(
                        height: 3.w,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(S.of(Get.context!).from,
                                  style: GoogleFonts.tajawal(
                                      fontSize: 4.w,
                                      fontWeight: FontWeight.w900,
                                      color: LightMode.blackColor)),
                              SizedBox(
                                height: 3.w,
                              ),
                              SizedBox(
                                height: 8.h,
                                width: 30.w,
                                child: TextFormField(
                                  style: GoogleFonts.tajawal(
                                      fontSize: 4.w,
                                      fontWeight: FontWeight.w600,
                                      color: LightMode.blueColor),
                                  controller: minController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      hintText: "Min ريال ",
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(2.w),
                                          borderSide: BorderSide(
                                              color: LightMode.blueColor,
                                              width: 2)),
                                      disabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(2.w),
                                          borderSide: BorderSide(
                                              color: LightMode.blueColor,
                                              width: 2)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(2.w),
                                          borderSide: BorderSide(
                                              color: LightMode.blueColor,
                                              width: 2)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(2.w),
                                          borderSide: BorderSide(
                                              color: LightMode.blueColor,
                                              width: 2))),
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(S.of(Get.context!).to,
                                  style: GoogleFonts.tajawal(
                                      fontSize: 4.w,
                                      fontWeight: FontWeight.w900,
                                      color: LightMode.blackColor)),
                              SizedBox(
                                height: 3.w,
                              ),
                              SizedBox(
                                height: 8.h,
                                width: 30.w,
                                child: TextFormField(
                                  style: GoogleFonts.tajawal(
                                      fontSize: 4.w,
                                      fontWeight: FontWeight.w600,
                                      color: LightMode.blueColor),
                                  controller: maxController,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      hintText: "Max ريال ",
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(2.w),
                                          borderSide: BorderSide(
                                              color: LightMode.blueColor,
                                              width: 2)),
                                      disabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(2.w),
                                          borderSide: BorderSide(
                                              color: LightMode.blueColor,
                                              width: 2)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(2.w),
                                          borderSide: BorderSide(
                                              color: LightMode.blueColor,
                                              width: 2)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(2.w),
                                          borderSide: BorderSide(
                                              color: LightMode.blueColor,
                                              width: 2))),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 5.w,
                      ),
                      SizedBox(
                        width: 100.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(S.of(Get.context!).roomNum,
                                style: GoogleFonts.tajawal(
                                    fontSize: 5.w,
                                    fontWeight: FontWeight.w900,
                                    color: LightMode.blackColor)),
                            SizedBox(
                              height: 3.w,
                            ),
                            SizedBox(
                              width: 30.w,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      numOfRoome > 0 ? numOfRoome-- : null;
                                      update();
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 7.w,
                                      height: 7.w,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: LightMode.yellowColor,
                                            width: 2),
                                      ),
                                      child: Text(
                                        "-",
                                        style: GoogleFonts.tajawal(
                                            color: LightMode.yellowColor,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 4.w),
                                      ),
                                    ),
                                  ),
                                  Text("$numOfRoome",
                                      style: GoogleFonts.tajawal(
                                          color: LightMode.blueColor,
                                          fontWeight: FontWeight.w700,
                                          fontSize: 4.w)),
                                  InkWell(
                                    onTap: () {
                                      numOfRoome++;
                                      update();
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      width: 7.w,
                                      height: 7.w,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: LightMode.yellowColor,
                                            width: 2),
                                      ),
                                      child: Text(
                                        "+",
                                        style: GoogleFonts.tajawal(
                                            color: LightMode.yellowColor,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 4.w),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5.w,
                      ),
                      btnClick(S.of(Get.context!).confirm, () async {
                        // sharedPreferences!.getString("typeOfUser") == "مستأجر"
                        //     ?
                        await getFilterAds(Get.context);
                        // : await getFilterAdsOwner(Get.context);

                        // Get.back();
                      }, LightMode.whiteColor, LightMode.blueColor,
                          LightMode.blueColor),
                      SizedBox(
                        height: 5.w,
                      ),
                      btnClick(S.of(Get.context!).cancel, () {
                        Get.back();
                        sharedPreferences!.getString("typeOfUser") == "مستأجر"
                            ? filter = false
                            : filterOwner = false;

                        type = '';
                        maxController.clear();
                        minController.clear();
                        numOfRoome = 0;
                      }, LightMode.yellowColor, LightMode.yellowColor,
                          LightMode.whiteColor),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  Widget btnClick(title, onPress, colorText, colorBorder, colorBackGround) {
    return InkWell(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.only(right: 5.w, left: 5.w),
        width: 100.w,
        height: 6.h,
        decoration: BoxDecoration(
            border: Border.all(color: colorBorder, width: 2),
            borderRadius: BorderRadius.circular(7.w),
            color: colorBackGround),
        child: Center(
          child: Text(
            title,
            style: GoogleFonts.tajawal(
                fontSize: 5.w, fontWeight: FontWeight.bold, color: colorText),
          ),
        ),
      ),
    );
  }

  // getFilterAdsOwner(context) async {
  //   filterAdsOwner.clear();
  //   print("succses");
  //   statuesRequest = StatuesRequest.loading;
  //   update();
  //   var response = await adsRemoteData.filterAdsOwner(
  //       sharedPreferences!.getString("token")!,
  //       priceType,
  //       numOfRoome.toString(),
  //       minController.text == "" ? "0" : minController.text,
  //       maxController.text == "" ? "0" : maxController.text);
  //   print(" response ??? ${response}");

  //   statuesRequest = handlingData(response);

  //   if (statuesRequest == StatuesRequest.success) {
  //     List responseBody = response['data'];
  //     print("response :: $responseBody");
  //     filterAdsOwner.addAll(responseBody.map((e) => AdsOwnerModel.fromJson(e)));
  //     filterOwner = true;
  //     Get.back();
  //   } else if (statuesRequest == StatuesRequest.unprocessableException) {
  //     messageHandleException("${response['message']}", context);
  //   } else if (statuesRequest == StatuesRequest.socketException) {
  //     messageHandleException(S.of(context).noInternetApi, context);
  //   } else if (statuesRequest == StatuesRequest.serverException) {
  //     messageHandleException(S.of(context).serverException, context);
  //   } else if (statuesRequest == StatuesRequest.unExpectedException) {
  //     messageHandleException(S.of(context).unExcepectedException, context);
  //   } else if (statuesRequest == StatuesRequest.defaultException) {
  //     messageHandleException(S.of(context).error, context);
  //   } else if (statuesRequest == StatuesRequest.serverError) {
  //     messageHandleException("${response}", context);
  //   } else if (statuesRequest == StatuesRequest.timeoutException) {
  //     messageHandleException(S.of(context).timeOutException, context);
  //   } else if (statuesRequest == StatuesRequest.unauthorizedException) {
  //     messageHandleExceptionVisitor(S.of(context).errorUnAuthorized, context);
  //   }
  //   update();
  // }

  Future<List<AdsModel>> getFilterAds(context) async {
    filterAds.clear();
    print("succses");
    statuesRequest = StatuesRequest.loading;
    update();
    var response = await adsRemoteData.filterAds(
        sharedPreferences!.getString("token")!,
        priceType,
        numOfRoome.toString(),
        minController.text == "" ? "0" : minController.text,
        maxController.text == "" ? "0" : maxController.text);
    print(" response ??? ${response}");

    statuesRequest = handlingData(response);

    if (statuesRequest == StatuesRequest.success) {
      List responseBody = response['data'];
      print("response :: $responseBody");
      filterAds.addAll(responseBody.map((e) => AdsModel.fromJson(e)));
      filter = true;
      Get.back();
    } else if (statuesRequest == StatuesRequest.unprocessableException) {
      messageHandleException("${response['message']}", context);
    } else if (statuesRequest == StatuesRequest.socketException) {
      messageHandleException(S.of(context).noInternetApi, context);
    } else if (statuesRequest == StatuesRequest.serverException) {
      messageHandleException(S.of(context).serverException, context);
    } else if (statuesRequest == StatuesRequest.unExpectedException) {
      messageHandleException(S.of(context).unExcepectedException, context);
    } else if (statuesRequest == StatuesRequest.defaultException) {
      messageHandleException(S.of(context).error, context);
    } else if (statuesRequest == StatuesRequest.serverError) {
      messageHandleException("${response}", context);
    } else if (statuesRequest == StatuesRequest.timeoutException) {
      messageHandleException(S.of(context).timeOutException, context);
    } else if (statuesRequest == StatuesRequest.unauthorizedException) {
      messageHandleExceptionVisitor(S.of(context).errorUnAuthorized, context);
    }
    update();
    return filterAds;
  }

  @override
  void onInit() {
    if (sharedPreferences!.getBool("visit") == false) {
      log("no visit");
    //  getAllAds(Get.context);
    //  getAllAdsForOwner(Get.context);
    } else {
      log(" visit");
    //  getAllAds(Get.context);
    }

    super.onInit();
  }
}
