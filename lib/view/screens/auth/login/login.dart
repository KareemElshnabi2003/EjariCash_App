import 'package:ejary_cash/controller/auth/login_controller.dart';
import 'package:ejary_cash/core/class/status_request.dart';
import 'package:ejary_cash/core/constant/colors.dart';
import 'package:ejary_cash/generated/l10n.dart';
import 'package:ejary_cash/main.dart';
import 'package:ejary_cash/view/screens/auth/forgetPass/forget_pass.dart';
import 'package:ejary_cash/view/screens/auth/register/main_register.dart';
import 'package:ejary_cash/view/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(LoginController());
    return Scaffold(
      backgroundColor: LightMode.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            appBarLogin(
                () {
                  Navigator.canPop(context)
                      ? Get.back()
                      : Get.offAll(() => const MainAuth());
                },
                S.of(context).login,
                () {
                  sharedPreferences!.setBool("visit", true);
                  Get.to(() => const Home(),
                      transition: Transition.leftToRightWithFade,
                      duration: const Duration(milliseconds: 800));
                },
                context),
            GetBuilder<LoginController>(
              builder: (controller) => controller.statuesRequest ==
                      StatuesRequest.loading
                  ? SizedBox(
                      height: 90.h,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: LightMode.yellowColor,
                        ),
                      ),
                    )
                  : Form(
                      key: controller.loginGlobalKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                              margin: EdgeInsets.only(
                                  right: 5.w, left: 5.w, top: 3.h, bottom: 2.h),
                              child: bodyLoginText(context)),
                          Container(
                            padding: EdgeInsets.only(top: 3.w, bottom: 3.w),
                            margin: EdgeInsets.only(
                                top: 5.w, right: 7.w, left: 7.w),
                            color: LightMode.fillTextFieldColor,
                            height: 20.w,
                            child: textFailed(
                                controller.emailController,
                                TextInputType.emailAddress,
                                false,
                                S.of(context).email,
                                false,
                                null, (val) {
                              return controller.emailValidate(val!, context);
                            }, email: true),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 3.w, bottom: 3.w),
                            margin: EdgeInsets.only(
                                top: 5.w, right: 7.w, left: 7.w),
                            color: LightMode.fillTextFieldColor,
                            height: 20.w,
                            child: textFailed(
                                controller.passwordController,
                                TextInputType.visiblePassword,
                                controller.showPass_1,
                                S.of(context).password,
                                true,
                                IconButton(
                                    onPressed: () {
                                      controller.showPassword_1();
                                    },
                                    icon: controller.showPass_1 == true
                                        ? Icon(
                                            Icons.visibility,
                                            color: LightMode.blueColor
                                                .withValues(alpha: .5),
                                            size: 7.w,
                                          )
                                        : Icon(
                                            Icons.visibility_off,
                                            color: LightMode.blueColor
                                                .withValues(alpha: .5),
                                            size: 7.w,
                                          )), (val) {
                              return controller.passwordValidate(val!, context);
                            }),
                          ),
                          Container(
                              margin: EdgeInsets.only(
                                  right: 5.w, left: 5.w, top: 1.h),
                              child: textClikForget(() {
                                Get.to(() => const ForgetPassword(),
                                    transition: Transition.leftToRightWithFade,
                                    duration:
                                        const Duration(milliseconds: 800));
                              }, S.of(context).forgetPass)),
                          SizedBox(
                            height: 4.h,
                          ),
                          btnClick(S.of(context).login, () {
                            controller.login(context);
                          }, LightMode.whiteColor, LightMode.blueColor,
                              LightMode.blueColor)
                        ],
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget bodyLoginText(context) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        S.of(context).titleLoginPage,
        style: GoogleFonts.tajawal(
            fontSize: 6.w,
            fontWeight: FontWeight.w600,
            color: LightMode.blueColor),
      ),
      Text(
        S.of(context).bodyLoginPage,
        style: GoogleFonts.tajawal(
            fontSize: 4.w,
            fontWeight: FontWeight.w600,
            color: LightMode.greenColor),
      ),
    ],
  );
}

Widget textFailed(controller, keyBoardType, obscure, hintText, bool iconic,
    icon, String? Function(String?)? validate,
    {email}) {
  return TextFormField(
    validator: validate,
    autovalidateMode: email == true ? null : AutovalidateMode.onUserInteraction,
    controller: controller,
    keyboardType: keyBoardType,
    obscureText: obscure,
    style: GoogleFonts.tajawal(
        fontSize: 5.w, fontWeight: FontWeight.w700, color: LightMode.blueColor),
    decoration: InputDecoration(
        labelText: hintText,
        labelStyle: GoogleFonts.tajawal(
            fontSize: 5.w,
            fontWeight: FontWeight.w700,
            color: LightMode.blueColor.withValues(alpha: .5)),
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
        // hintText: hintText,
        // hintStyle:,
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
            LightMode.blueColor.withValues(alpha: .8),
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

Widget appBarLogin(onPressBack, text, onClickSkip, context) {
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
            LightMode.blueColor.withValues(alpha: .8),
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
            Text(
              text,
              style: GoogleFonts.tajawal(
                  fontSize: 6.w,
                  fontWeight: FontWeight.bold,
                  color: LightMode.blackColor),
            ),
          ],
        ),
        textClik(onClickSkip, S.of(context).skip)
      ],
    ),
  );
}

Widget textClik(onPress, title) {
  return TextButton(
      onPressed: onPress,
      child: Text(
        title,
        style: GoogleFonts.tajawal(
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
        style: GoogleFonts.tajawal(
            decoration: TextDecoration.underline,
            decorationColor: LightMode.blueColor,
            fontSize: 4.w,
            color: LightMode.blueColor,
            fontWeight: FontWeight.w400),
      ));
}
