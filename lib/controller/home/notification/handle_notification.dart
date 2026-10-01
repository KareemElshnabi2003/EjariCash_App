import 'dart:developer';
import 'package:ejary_cash/core/constant/colors.dart';
import 'package:ejary_cash/view/screens/home/notification/notification.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class FirebaseNotification {
  FirebaseMessaging? _messaging;

  Future<void> intilizeNotification() async {
    try {
      _messaging = FirebaseMessaging.instance;
      await _messaging?.requestPermission(
        alert: true,
        badge: true,
        sound: true,
      );

      _setupMessageHandlers();
    } catch (e) {
      log("Firebase messaging initialization skipped: $e");
    }
  }

  void _setupMessageHandlers() {
    if (_messaging == null) return;

    // Background / Terminated initial message
    _messaging?.getInitialMessage().then((message) {
      if (message != null) {
        _handleMessage(message);
      }
    });

    // When app is opened from notification
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessage);

    // Foreground messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      final title = message.notification?.title ?? message.data['title'] ?? 'إشعار جديد';
      final body = message.notification?.body ?? message.data['body'] ?? '';

      if (title.isNotEmpty || body.isNotEmpty) {
        Get.snackbar(
          "",
          "",
          messageText: Text(
            body,
            style: GoogleFonts.tajawal(
              fontSize: 3.w,
              fontWeight: FontWeight.w700,
              color: LightMode.whiteColor,
            ),
          ),
          titleText: Text(
            title,
            style: GoogleFonts.tajawal(
              fontSize: 4.w,
              fontWeight: FontWeight.w700,
              color: LightMode.whiteColor,
            ),
          ),
          backgroundColor: LightMode.blueColor,
          borderRadius: 3.w,
          icon: Icon(
            Icons.notifications_active_outlined,
            size: 7.w,
            color: LightMode.whiteColor,
          ),
          onTap: (_) => _handleMessage(message),
          colorText: LightMode.whiteColor,
          snackStyle: SnackStyle.FLOATING,
        );
      }
    });
  }

  void _handleMessage(RemoteMessage? message) {
    if (message == null) return;
    Get.to(() => const NotificationPage());
  }
}
