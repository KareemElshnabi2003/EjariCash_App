import 'package:ejary_cash/core/class/api.dart';
import 'package:ejary_cash/core/class/status_request.dart';
import 'package:ejary_cash/core/constant/colors.dart';
import 'package:ejary_cash/core/function/handling_data.dart';
import 'package:ejary_cash/data/data%20source/notification.dart';
import 'package:ejary_cash/data/model/notification_model.dart';
import 'package:ejary_cash/generated/l10n.dart';
import 'package:ejary_cash/main.dart';
import 'package:ejary_cash/view/screens/auth/register/main_register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class NotifyController extends GetxController {
  List<NotificationModel> notifycationsList = [];
  StatuesRequest statuesRequest = StatuesRequest.none;
  NotificationRemoteData settingRemoteData =
      NotificationRemoteData(Get.put(Api()));
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
      ),
    );
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

  sendNotification(context) async {
    print("notify");
    statuesRequest = StatuesRequest.loading;
    update();
    print(sharedPreferences!.getString("token"));
    var response = await settingRemoteData
        .getNotification(sharedPreferences!.getString("token"));
    print(" response ??? ${response}");

    statuesRequest = handlingData(response);

    if (statuesRequest == StatuesRequest.success) {
      List responseBody = response['data'];

      print("response :: $responseBody");
      notifycationsList.clear();

      notifycationsList
          .addAll(responseBody.map((e) => NotificationModel.fromJson(e)));

      Get.snackbar("", "",
          messageText: Text(notifycationsList[0].data!.text!,
              style: GoogleFonts.tajawal(
                  fontSize: 3.w,
                  fontWeight: FontWeight.w700,
                  color: LightMode.whiteColor)),
          titleText: Text(notifycationsList[0].data!.title!,
              style: GoogleFonts.tajawal(
                  fontSize: 4.w,
                  fontWeight: FontWeight.w700,
                  color: LightMode.blackColor)),
          backgroundColor: LightMode.blueColor,
          borderRadius: 3.w,
          icon: Icon(
            Icons.notifications_active_outlined,
            size: 7.w,
            color: LightMode.whiteColor,
          ),
          onTap: (b) {},
          colorText: LightMode.whiteColor,
          snackStyle: SnackStyle.FLOATING);
    } else if (statuesRequest == StatuesRequest.unprocessableException) {
    } else if (statuesRequest == StatuesRequest.socketException) {
      messageHandleException(S.of(context).noInternetApi, context);
    } else if (statuesRequest == StatuesRequest.serverException) {
      messageHandleException(S.of(context).serverException, context);
    } else if (statuesRequest == StatuesRequest.unExpectedException) {
      messageHandleException(S.of(context).unExcepectedException, context);
    } else if (statuesRequest == StatuesRequest.defaultException) {
      messageHandleException(S.of(context).errorPhoneUseBeforeApi, context);
    } else if (statuesRequest == StatuesRequest.serverError) {
      messageHandleException("error", context);
    } else if (statuesRequest == StatuesRequest.timeoutException) {
      messageHandleException(S.of(context).timeOutException, context);
    } else if (statuesRequest == StatuesRequest.unauthorizedException) {
      messageHandleExceptionVisitor(S.of(context).errorUnAuthorized, context);
    }

    update();
  }

  getNotificationMainPage(context) async {
    print("notify");
    statuesRequest = StatuesRequest.loading;
    update();
    print(sharedPreferences!.getString("token"));
    var response = await settingRemoteData
        .getNotification(sharedPreferences!.getString("token"));
    print(" response ??? ${response}");

    statuesRequest = handlingData(response);

    if (statuesRequest == StatuesRequest.success) {
      List responseBody = response['data'];
      Map<String, dynamic> responseNotify = response['data'][0];
      NotificationModel notifyModel;
      notifyModel = NotificationModel.fromJson(responseNotify);
      if (notifyModel == notifycationsList[0] && notifycationsList.isNotEmpty) {
        print("response :: $responseBody");
        notifycationsList.clear();

        notifycationsList
            .addAll(responseBody.map((e) => NotificationModel.fromJson(e)));
      } else {
        print("response :: $responseBody");
        notifycationsList.clear();

        notifycationsList
            .addAll(responseBody.map((e) => NotificationModel.fromJson(e)));

        Get.snackbar("", "",
            messageText: Text(notifyModel.data!.text!,
                style: GoogleFonts.tajawal(
                    fontSize: 3.w,
                    fontWeight: FontWeight.w700,
                    color: LightMode.whiteColor)),
            titleText: Text(notifyModel.data!.title!,
                style: GoogleFonts.tajawal(
                    fontSize: 4.w,
                    fontWeight: FontWeight.w700,
                    color: LightMode.blackColor)),
            backgroundColor: LightMode.blueColor,
            borderRadius: 3.w,
            icon: Icon(
              Icons.notifications_active_outlined,
              size: 7.w,
              color: LightMode.whiteColor,
            ),
            onTap: (b) {},
            colorText: LightMode.whiteColor,
            snackStyle: SnackStyle.FLOATING);
      }
    } else if (statuesRequest == StatuesRequest.unprocessableException) {
    } else if (statuesRequest == StatuesRequest.socketException) {
      messageHandleException(S.of(context).noInternetApi, context);
    } else if (statuesRequest == StatuesRequest.serverException) {
      messageHandleException(S.of(context).serverException, context);
    } else if (statuesRequest == StatuesRequest.unExpectedException) {
      messageHandleException(S.of(context).unExcepectedException, context);
    } else if (statuesRequest == StatuesRequest.defaultException) {
      messageHandleException(S.of(context).errorPhoneUseBeforeApi, context);
    } else if (statuesRequest == StatuesRequest.serverError) {
      messageHandleException(S.of(Get.context!).error, context);
    } else if (statuesRequest == StatuesRequest.timeoutException) {
      messageHandleException(S.of(context).timeOutException, context);
    } else if (statuesRequest == StatuesRequest.unauthorizedException) {
      messageHandleExceptionVisitor(S.of(context).errorUnAuthorized, context);
    }
    update();
  }

  getNotificationPage(context) async {
    print("notify");
    statuesRequest = StatuesRequest.loading;
    update();
    print(sharedPreferences!.getString("token"));
    var response = await settingRemoteData
        .getNotification(sharedPreferences!.getString("token"));
    print(" response ??? ${response}");

    statuesRequest = handlingData(response);

    if (statuesRequest == StatuesRequest.success) {
      List responseBody = response['data'];

      print("response :: $responseBody");
      notifycationsList.clear();

      notifycationsList
          .addAll(responseBody.map((e) => NotificationModel.fromJson(e)));
    } else if (statuesRequest == StatuesRequest.unprocessableException) {
    } else if (statuesRequest == StatuesRequest.socketException) {
      messageHandleException(S.of(context).noInternetApi, context);
    } else if (statuesRequest == StatuesRequest.serverException) {
      messageHandleException(S.of(context).serverException, context);
    } else if (statuesRequest == StatuesRequest.unExpectedException) {
      messageHandleException(S.of(context).unExcepectedException, context);
    } else if (statuesRequest == StatuesRequest.defaultException) {
      messageHandleException(S.of(context).errorPhoneUseBeforeApi, context);
    } else if (statuesRequest == StatuesRequest.serverError) {
      messageHandleException(S.of(Get.context!).error, context);
    } else if (statuesRequest == StatuesRequest.timeoutException) {
      messageHandleException(S.of(context).timeOutException, context);
    } else if (statuesRequest == StatuesRequest.unauthorizedException) {
      messageHandleExceptionVisitor(S.of(context).errorUnAuthorized, context);
    }
    update();
  }

  @override
  void onInit() {
    getNotificationPage(Get.context);
    super.onInit();
  }
}
