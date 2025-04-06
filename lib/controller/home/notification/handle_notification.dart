import 'dart:developer';

import 'package:ejary_cash/core/constant/colors.dart';
import 'package:ejary_cash/view/screens/home/notification/notification.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class FirebaseNotification {
  final firebaseMessagin = FirebaseMessaging.instance;

  Future<void> intilizeNotification() async {
    await firebaseMessagin.requestPermission();
    String? token = await firebaseMessagin.getToken();
    log("$token");
    handelBackGround();
    handleForGround();
  }

  // handel notification
  void handelMassage(RemoteMessage? remotemess) async {
    Get.to(() => const NotificationPage());
  }

  Future<void> handelBackGround() async {
    firebaseMessagin.getInitialMessage().then(handelMassage);
    FirebaseMessaging.onMessageOpenedApp.listen(handelMassage);
  }

  Future<void> handleForGround() async {
    // Listen for foreground messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print(
          "Message received while app is open: ${message.notification?.title}");
      Get.snackbar("", "",
          messageText: Text(message.notification!.body!,
              style: GoogleFonts.tajawal(
                  fontSize: 3.w,
                  fontWeight: FontWeight.w700,
                  color: LightMode.whiteColor)),
          titleText: Text(message.notification!.title!,
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
    });

    // Handle messages when the user taps on the notification
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("User opened notification: ${message.notification?.title}");
    });
  }

  firebasemessaginsetting() async {
    NotificationSettings settings = await firebaseMessagin.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print('User granted permission');
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('User granted provisional permission');
    } else {
      print('User declined or has not accepted permission');
    }
  }
}
