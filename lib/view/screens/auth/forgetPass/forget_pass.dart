import 'package:ejary_cash/controller/auth/forget_pass_controller.dart';
import 'package:ejary_cash/core/class/status_request.dart';
import 'package:ejary_cash/core/constant/colors.dart';
import 'package:ejary_cash/generated/l10n.dart';
import 'package:ejary_cash/view/screens/home/home.dart';
import 'package:ejary_cash/view/widget/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPassController());
    return Scaffold(
      backgroundColor: LightMode.whiteColor,
      body: GetBuilder<ForgetPassController>(
        builder: (controller) => controller.statuesRequest ==
                StatuesRequest.loading
            ? loading(80.h)
            : SingleChildScrollView(
                child: Form(
                  key: controller.forgetGlobalKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      appBarLogin(
                          () {
                            Get.back();
                          },
                          S.of(context).login,
                          () {
                            Get.to(() => const Home(),
                                transition: Transition.leftToRightWithFade,
                                duration: const Duration(milliseconds: 800));
                          }),
                      Container(
                          margin: EdgeInsets.only(
                              right: 5.w, left: 5.w, top: 3.h, bottom: 2.h),
                          child: bodyLoginText()),
                      Container(
                        padding: EdgeInsets.only(top: 3.w, bottom: 3.w),
                        margin:
                            EdgeInsets.only(top: 5.w, right: 7.w, left: 7.w),
                        color: LightMode.fillTextFieldColor,
                        height: 20.w,
                        child: textFailed(
                            controller.emailController,
                            TextInputType.emailAddress,
                            false,
                            S.of(context).email,
                            false,
                            null, (val) {
                          return controller.emailValidate(val!);
                        }),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      btnClick(S.of(Get.context!).send, () {
                        controller.forgetPass(context);
                      }, LightMode.whiteColor, LightMode.blueColor,
                          LightMode.blueColor)
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}

Widget bodyLoginText() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        S.of(Get.context!).forgetPass,
        style: GoogleFonts.tajawal(
            fontSize: 6.w,
            fontWeight: FontWeight.w600,
            color: LightMode.blueColor),
      ),
      Text(
        S.of(Get.context!).bodyForgetPass,
        style: GoogleFonts.tajawal(
            fontSize: 4.w,
            fontWeight: FontWeight.w600,
            color: LightMode.greenColor),
      ),
    ],
  );
}

Widget textFailed(controller, keyBoardType, obscure, hintText, bool iconic,
    icon, String? Function(String?)? validate) {
  return TextFormField(
    validator: validate,
    controller: controller,
    keyboardType: keyBoardType,
    obscureText: obscure,
    style: GoogleFonts.tajawal(
        fontSize: 5.w, fontWeight: FontWeight.w700, color: LightMode.blueColor),
    decoration: InputDecoration(
        contentPadding: EdgeInsets.only(
          bottom: 5.w,
          right: 5.w,
          left: 5.w,
        ),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        disabledBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        filled: false,
        fillColor: LightMode.fillTextFieldColor,
        labelText: hintText,
        labelStyle: GoogleFonts.tajawal(
            fontSize: 5.w,
            fontWeight: FontWeight.w700,
            color: LightMode.blueColor.withOpacity(.5)),
        suffixIcon: iconic == true ? icon : null,
        suffixIconColor: LightMode.blueColor),
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
         gradient: LinearGradient(colors: [
            LightMode.blueColor,
            LightMode.blueColor.withOpacity(.8),
          ]),
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

Widget appBarLogin(onPressBack, text, onClickSkip) {
  return Container(
    margin: EdgeInsets.only(top: 7.h, right: 7.w, left: 7.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            InkWell(
              onTap: onPressBack,
              child: Container(
                width: 10.w,
                height: 7.w,
                decoration: BoxDecoration(
                   gradient: LinearGradient(colors: [
            LightMode.blueColor,
            LightMode.blueColor.withOpacity(.8),
          ]),
                    borderRadius: BorderRadius.circular(3.w),
                    color: LightMode.blueColor),
                child: Icon(
                  Icons.arrow_back,
                  size: 6.w,
                  color: LightMode.whiteColor,
                ),
              ),
            ),
            SizedBox(
              width: 3.w,
            ),
            Container(
              height: 7.w,
              alignment: Alignment.center,
              child: Text(
                text,
                style: GoogleFonts.tajawal(
                    fontSize: 6.w,
                    fontWeight: FontWeight.bold,
                    color: LightMode.blackColor),
              ),
            ),
          ],
        ),
        // textClik(onClickSkip, "تخطي الآن")
      ],
    ),
  );
}

Widget textClik(onPress, title) {
  return TextButton(
      onPressed: onPress,
      child: Text(
        title,
        style: TextStyle(
            fontSize: 4.w,
            color: LightMode.yellowColor,
            fontWeight: FontWeight.w700),
      ));
}

Widget textClikForget(onPress, title) {
  return TextButton(
      onPressed: onPress,
      child: Text(
        title,
        style: TextStyle(
            decoration: TextDecoration.underline,
            decorationColor: LightMode.blueColor,
            fontSize: 4.w,
            color: LightMode.blueColor,
            fontWeight: FontWeight.w400),
      ));
}
