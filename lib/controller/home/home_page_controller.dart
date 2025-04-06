import 'dart:developer';

import 'package:ejary_cash/core/class/api.dart';
import 'package:ejary_cash/core/class/status_request.dart';
import 'package:ejary_cash/core/constant/colors.dart';
import 'package:ejary_cash/core/function/handling_data.dart';
import 'package:ejary_cash/data/data%20source/projects.dart';
import 'package:ejary_cash/data/data%20source/rent.dart';
import 'package:ejary_cash/data/data%20source/unites.dart';
import 'package:ejary_cash/data/model/ads_model.dart';
import 'package:ejary_cash/data/model/ads_owner_model.dart';
import 'package:ejary_cash/data/model/order_info_model.dart';
import 'package:ejary_cash/data/model/partener_model.dart';
import 'package:ejary_cash/generated/l10n.dart';
import 'package:ejary_cash/main.dart';
import 'package:ejary_cash/view/screens/auth/register/main_register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class HomePageController extends GetxController {
  StatuesRequest statuesRequest_3 = StatuesRequest.none;
  StatuesRequest statuesRequest_2 = StatuesRequest.none;
  StatuesRequest statuesRequest_4 = StatuesRequest.none;
  RentRemoteData rentRemoteData = RentRemoteData(Get.put(Api()));

  AdsRemoteData adsRemoteData = AdsRemoteData(Get.put(Api()));
  ProjectsRemoteData projectsRemoteData = ProjectsRemoteData(Get.put(Api()));

  List<AdsModel> allUnites = [];
  List<PartenerModel> allProjects = [];
  List<AdsOwnerModel> allAdsOwner = [];
  List<OrderInfoModel> myRentes = [];

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

  Future<List<PartenerModel>> getAllProjects(context) async {
    allProjects.clear();
    statuesRequest_2 = StatuesRequest.loading;
    update();
    var response = await projectsRemoteData
        .getAllProjects(sharedPreferences!.getString("token"));
    print(" response ??? ${response}");

    statuesRequest_2 = handlingData(response);

    if (statuesRequest_2 == StatuesRequest.success) {
      List responseBody = response['data'];
      print("response :: $responseBody");
      allProjects.addAll(responseBody.map((e) => PartenerModel.fromJson(e)));
    } else if (statuesRequest_2 == StatuesRequest.unprocessableException) {
      messageHandleException("${response['message']}", context);
    } else if (statuesRequest_2 == StatuesRequest.socketException) {
      messageHandleException(S.of(context).noInternetApi, context);
    } else if (statuesRequest_2 == StatuesRequest.serverException) {
      messageHandleException(S.of(context).serverException, context);
    } else if (statuesRequest_2 == StatuesRequest.unExpectedException) {
      messageHandleException(S.of(context).unExcepectedException, context);
    } else if (statuesRequest_2 == StatuesRequest.defaultException) {
      messageHandleException(S.of(context).errorPhoneUseBeforeApi, context);
    } else if (statuesRequest_2 == StatuesRequest.serverError) {
      messageHandleException("${response}", context);
    } else if (statuesRequest_2 == StatuesRequest.timeoutException) {
      messageHandleException(S.of(context).timeOutException, context);
    } else if (statuesRequest_2 == StatuesRequest.unauthorizedException) {
      messageHandleExceptionVisitor(S.of(context).errorUnAuthorized, context);
    }
    update();
    return allProjects;
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

  Future<List<AdsModel>> getAllUnites(context) async {
    allUnites.clear();
    statuesRequest_3 = StatuesRequest.loading;
    update();
    var response =
        await adsRemoteData.getAdsHome(sharedPreferences!.getString("token"));
    print(" response ??? ${response}");

    statuesRequest_3 = handlingData(response);

    if (statuesRequest_3 == StatuesRequest.success) {
      List responseBody = response['data'];
      print("response :: $responseBody");
      allUnites.addAll(responseBody.map((e) => AdsModel.fromJson(e)));
    } else if (statuesRequest_3 == StatuesRequest.unprocessableException) {
      messageHandleException("${response['message']}", context);
    } else if (statuesRequest_3 == StatuesRequest.socketException) {
      messageHandleException(S.of(context).noInternetApi, context);
    } else if (statuesRequest_3 == StatuesRequest.serverException) {
      messageHandleException(S.of(context).serverException, context);
    } else if (statuesRequest_3 == StatuesRequest.unExpectedException) {
      messageHandleException(S.of(context).unExcepectedException, context);
    } else if (statuesRequest_3 == StatuesRequest.defaultException) {
      messageHandleException(S.of(context).errorPhoneUseBeforeApi, context);
    } else if (statuesRequest_3 == StatuesRequest.serverError) {
      messageHandleException("${response}", context);
    } else if (statuesRequest_3 == StatuesRequest.timeoutException) {
      messageHandleException(S.of(context).timeOutException, context);
    } else if (statuesRequest_3 == StatuesRequest.unauthorizedException) {
      messageHandleExceptionVisitor(S.of(context).errorUnAuthorized, context);
    }
    update();
    return allUnites;
  }

  Future<List<AdsOwnerModel>> getAllAdsForOwner(context) async {
    allAdsOwner.clear();
    statuesRequest_3 = StatuesRequest.loading;
    update();
    var response = await adsRemoteData
        .getAllAdsOwner(sharedPreferences!.getString("token"));
    log(" response ??? ${response}");

    statuesRequest_3 = handlingData(response);

    if (statuesRequest_3 == StatuesRequest.success) {
      List responseBody = response['data'];
      print("response :: $responseBody");
      allAdsOwner.addAll(responseBody.map((e) => AdsOwnerModel.fromJson(e)));
      sharedPreferences!.setString("leangthAdsOwner", "${allAdsOwner.length}");
    } else if (statuesRequest_3 == StatuesRequest.unprocessableException) {
      messageHandleException("${response['message']}", context);
    } else if (statuesRequest_3 == StatuesRequest.socketException) {
      messageHandleException(S.of(context).noInternetApi, context);
    } else if (statuesRequest_3 == StatuesRequest.serverException) {
      messageHandleException(S.of(context).serverException, context);
    } else if (statuesRequest_3 == StatuesRequest.unExpectedException) {
      messageHandleException(S.of(context).unExcepectedException, context);
    } else if (statuesRequest_3 == StatuesRequest.defaultException) {
      messageHandleException(S.of(Get.context!).error, context);
    } else if (statuesRequest_3 == StatuesRequest.serverError) {
      messageHandleException("${response}", context);
    } else if (statuesRequest_3 == StatuesRequest.timeoutException) {
      messageHandleException(S.of(context).timeOutException, context);
    } else if (statuesRequest_3 == StatuesRequest.unauthorizedException) {
      messageHandleExceptionVisitor(S.of(context).errorUnAuthorized, context);
    }
    update();
    return allAdsOwner;
  }

  Future<List<OrderInfoModel>> getMyRents(context) async {
    myRentes.clear();
    statuesRequest_4 = StatuesRequest.loading;
    update();
    var response =
        await rentRemoteData.getMyRents(sharedPreferences!.getString("token"));
    log(" response ??? ${response}");

    statuesRequest_4 = handlingData(response);

    if (statuesRequest_4 == StatuesRequest.success) {
      List responseBody = response['data'];
      print("response :: $responseBody");
      myRentes.addAll(responseBody.map((e) => OrderInfoModel.fromJson(e)));
    } else if (statuesRequest_4 == StatuesRequest.unprocessableException) {
      messageHandleException("${response['message']}", context);
    } else if (statuesRequest_4 == StatuesRequest.socketException) {
      messageHandleException(S.of(context).noInternetApi, context);
    } else if (statuesRequest_4 == StatuesRequest.serverException) {
      messageHandleException(S.of(context).serverException, context);
    } else if (statuesRequest_4 == StatuesRequest.unExpectedException) {
      messageHandleException(S.of(context).unExcepectedException, context);
    } else if (statuesRequest_4 == StatuesRequest.defaultException) {
      messageHandleException(S.of(Get.context!).error, context);
    } else if (statuesRequest_4 == StatuesRequest.serverError) {
      messageHandleException("${response}", context);
    } else if (statuesRequest_4 == StatuesRequest.timeoutException) {
      messageHandleException(S.of(context).timeOutException, context);
    } else if (statuesRequest_4 == StatuesRequest.unauthorizedException) {
      messageHandleExceptionVisitor(S.of(context).errorUnAuthorized, context);
    }
    update();
    return myRentes;
  }

  @override
  void onInit() {
    if (sharedPreferences!.getBool("visit") == false) {
      log("no visit");
      // getAllProjects(Get.context!);
      // getAllUnites(Get.context);
      // getAllAdsForOwner(Get.context);
      // getMyRents(Get.context);
    } else {
      log(" visit");
      // getAllProjects(Get.context!);
      // getAllUnites(Get.context);
    }
    super.onInit();
  }
}
