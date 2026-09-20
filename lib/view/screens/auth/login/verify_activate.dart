// ignore_for_file: unnecessary_brace_in_string_interps, avoid_print

import 'package:ejary_cash/controller/auth/verify_code_controller.dart';
import 'package:ejary_cash/core/class/status_request.dart';
import 'package:ejary_cash/main.dart';
import 'package:ejary_cash/view/screens/auth/register/main_register.dart';
import 'package:ejary_cash/view/screens/home/profile/change_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_offline/flutter_offline.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

import '../../../../core/constant/colors.dart';

class VerifyCodeActivate extends StatelessWidget {
  const VerifyCodeActivate({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(VerifyCodeController());
    return
       
        Scaffold(
      backgroundColor: LightMode.whiteColor,
      body: OfflineBuilder(
        connectivityBuilder: (context, List<ConnectivityResult> value, child) {
          final bool connected = value != ConnectivityResult.none;

          if (connected) {
            return GetBuilder<VerifyCodeController>(
              builder: (controller) =>
                  controller.statuesRequest == StatuesRequest.loading
                      ? SizedBox(
                          width: 100.w,
                          height: 100.h,
                          child: Center(
                            child: CircularProgressIndicator(
                              color: LightMode.yellowColor,
                            ),
                          ),
                        )
                      : Column(
                          children: [
                            appBarSign(() {
                              if (Navigator.canPop(context)) {
                                Get.back();
                              } else {
                                Get.off(() => const MainAuth());
                              }
                            },
                             sharedPreferences!.getString("local") != "en"
                                    ? "تأكيد الحساب"
                                    : "Confirm Account"),
                            Container(
                              margin: EdgeInsets.only(top: 3.h, bottom: 3.h),
                              child: Text(
                              sharedPreferences!.getString("local") != "en"
                                    ? "أدخل الكود الذي تم إرساله إليك"
                                    : "Enter code that send to you",
                                style: TextStyle(
                                    fontSize: 4.w,
                                    fontWeight: FontWeight.w700,
                                    color: LightMode.blackColor),
                              ),
                            ),
                            otpRegister((String verificationCode) {
                              controller.verifyCodeActivate = verificationCode;
                              print(
                                  "  cooooode   ===??? ${controller.verifyCodeActivate}");
                            }),
                            SizedBox(
                              height: 1.h,
                            ),
                            // reSendCode(() {
                            //   controller.resendCode(context);
                            // }),
                            SizedBox(
                              height: 3.h,
                            ),
                            btnClick(
                               sharedPreferences!.getString("local") != "en"
                                    ? "إرسال"
                                    : "Send", () {
                              controller.verifyActivate(context);
                            }, LightMode.whiteColor, LightMode.blueColor,
                                LightMode.blueColor)
                          ],
                        ),
            );
          } else {
            return SizedBox(
                height: 100.h,
                width: 100.w,
                child: const Center(child: Text("no internet ............ !")));
          }
        },
        child: const CircularProgressIndicator(),
        //)
      ),
    );
  }

  Widget reSendCode(
    onPress,
  ) {
    return Container(
      width: 100.w,
      alignment: Alignment.center,
      child: textClik(
          onPress,
          sharedPreferences!.getString("local") == "ar"
              ? "إعادة الإرسال"
              : "Re-Send"),
    );
  }

  Widget textClik(onPress, title) {
    return TextButton(
        onPressed: onPress,
        child: Text(
          title,
          style: TextStyle(
              fontSize: 4.w,
              color: LightMode.blueColor,
              fontWeight: FontWeight.w700),
        ));
  }

  Widget btnClick(title, onPress, colorText, colorBorder, colorBackGround) {
    return InkWell(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.only(right: 5.w, left: 5.w),
        width: 100.w,
        height: 6.h,
        decoration: BoxDecoration(
           gradient: LinearGradient(colors: [
            LightMode.blueColor,
            LightMode.blueColor.withValues(alpha: .8),
          ]),
            border: Border.all(color: colorBorder, width: 2),
            borderRadius: BorderRadius.circular(7.w),
            color: colorBackGround),
        child: Center(
          child: Text(
            title,
            style: TextStyle(
                fontSize: 5.w, fontWeight: FontWeight.bold, color: colorText),
          ),
        ),
      ),
    );
  }

  Widget otpRegister(Function(String)? onSubmit) {
    return Center(
      child: SizedBox(
        height: 14.h,
        width: 90.w,
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: OtpTextField(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            textStyle: GoogleFonts.tajawal(
                fontSize: 20.sp,
                fontWeight: FontWeight.w500,
                color: LightMode.blueColor),
            fieldWidth: 16.w,
            fieldHeight: 9.h,
            borderColor: LightMode.yellowColor,
            borderWidth: 2,
            numberOfFields: 4,
            margin: EdgeInsets.only(right: 3.w, left: 3.w),
            fillColor: Colors.black12,
            filled: true,

            borderRadius: BorderRadius.circular(5),
            showFieldAsBox: true,
            disabledBorderColor: LightMode.yellowColor,
            enabledBorderColor: LightMode.yellowColor,

            onSubmit: onSubmit, // end onSubmit
          ),
        ),
      ),
    );
  }
}
