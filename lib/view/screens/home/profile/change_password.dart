import 'package:ejary_cash/controller/home/profile/update_profile_controller.dart';
import 'package:ejary_cash/core/class/status_request.dart';
import 'package:ejary_cash/core/constant/colors.dart';
import 'package:ejary_cash/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(UpdateProfileController());
    return Scaffold(
      backgroundColor: LightMode.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            appBarSign(() {
              Get.back();
            }, S.of(context).changePass),
            SizedBox(
              height: 5.h,
            ),
            GetBuilder<UpdateProfileController>(
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
                      key: controller.changePassGlobalKey,
                      child: Column(
                        children: [
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
                                S.of(context).currrentPass,
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
                            padding: EdgeInsets.only(top: 3.w, bottom: 3.w),
                            margin: EdgeInsets.only(
                                top: 5.w, right: 7.w, left: 7.w),
                            color: LightMode.fillTextFieldColor,
                            height: 20.w,
                            child: textFailed(
                                controller.newpasswordController,
                                TextInputType.visiblePassword,
                                controller.showPass_2,
                                S.of(context).newPass,
                                true,
                                IconButton(
                                    onPressed: () {
                                      controller.showPassword_2();
                                    },
                                    icon: controller.showPass_2 == true
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
                              return controller.newpasswordValidate(
                                  val!, context);
                            }),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 3.w, bottom: 3.w),
                            margin: EdgeInsets.only(
                                top: 5.w, right: 7.w, left: 7.w),
                            color: LightMode.fillTextFieldColor,
                            height: 20.w,
                            child: textFailed(
                                controller.newpasswordConfirmationController,
                                TextInputType.visiblePassword,
                                controller.showPass_3,
                                S.of(context).confirmNewPass,
                                true,
                                IconButton(
                                    onPressed: () {
                                      controller.showPassword_3();
                                    },
                                    icon: controller.showPass_3 == true
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
                              return controller.newpasswordConfirmationValidate(
                                  val!, context);
                            }),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          btnClick(S.of(context).confirm, () {
                            controller.changePassword(context);
                          }, LightMode.whiteColor, LightMode.blueColor,
                              LightMode.blueColor),
                        ],
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}

Widget rowClick(text, icon, color, onPress) {
  return InkWell(
    onTap: onPress,
    child: Container(
      margin: EdgeInsets.only(right: 5.w, left: 5.w, top: 5.w),
      child: Row(
        children: [
          Icon(
            icon,
            color: color,
            size: 5.w,
          ),
          SizedBox(
            width: 5.w,
          ),
          Text(
            text,
            style: GoogleFonts.tajawal(
                color: color, fontSize: 5.w, fontWeight: FontWeight.w600),
          )
        ],
      ),
    ),
  );
}

Widget termsText(onTap, value, colorCheck) {
  return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: LightMode.yellowColor),
          borderRadius: const BorderRadius.all(Radius.circular(5))),
      width: 4.5.w,
      height: 4.5.w,
      child: Checkbox(
          activeColor: colorCheck,
          checkColor: Colors.white,
          side: BorderSide(color: LightMode.yellowColor),
          value: value,
          onChanged: onTap));
}

Widget textTerms(text, textAlign, fontSize, fontWeight) {
  return Text(
    text,
    textDirection: TextDirection.rtl,
    textAlign: textAlign,
    style: GoogleFonts.tajawal(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: LightMode.blackColor),
  );
}

Widget multiTextSignUp(
    text1, text2, text3, onPressed1, onPressed2, textTap1, textTap2) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      textTerms(
        text1,
        TextAlign.right,
        3.5.w,
        FontWeight.w500,
      ),
      SizedBox(width: 1.w),
      InkWell(
          onTap: onPressed1,
          child: Text(
            textTap1,
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.right,
            style: GoogleFonts.tajawal(
                fontSize: 3.5.w,
                fontWeight: FontWeight.w500,
                color: Colors.red),
          )),
      SizedBox(width: 1.w),
      textTerms(
        text2,
        TextAlign.right,
        3.5.w,
        FontWeight.w500,
      ),
      SizedBox(width: 1.w),
      InkWell(
          onTap: onPressed2,
          child: Text(
            textTap2,
            textDirection: TextDirection.rtl,
            textAlign: TextAlign.right,
            style: GoogleFonts.tajawal(
                fontSize: 3.5.w,
                fontWeight: FontWeight.w500,
                color: Colors.red),
          )),
      SizedBox(width: 1.w),
      textTerms(
        text3,
        TextAlign.right,
        3.5.w,
        FontWeight.w500,
      ),
      SizedBox(width: 1.w),
    ],
  );
}

Widget checkBox(
    Function(bool?)? onChanged, value, onPress1, onPress2, context) {
  return Container(
    width: 100.w,
    margin: EdgeInsets.only(right: 4.w, bottom: 3.h),
    child: Row(
      children: [
        Checkbox(
          value: value,
          onChanged: onChanged,
          activeColor: LightMode.yellowColor,
        ),
        Row(
          children: [
            Text(
              S.of(context).multiText_1,
              style: GoogleFonts.tajawal(
                  fontSize: 4.w,
                  color: LightMode.blackColor,
                  fontWeight: FontWeight.w700),
            ),
            textClik(onPress1, S.of(context).multiText_2),
            Text(
              S.of(context).multiText_3,
              style: GoogleFonts.tajawal(
                  fontSize: 4.w,
                  color: LightMode.blackColor,
                  fontWeight: FontWeight.w700),
            ),
            textClik(onPress2, S.of(context).multiText_4),
            Text(
              S.of(context).multiText_5,
              style: GoogleFonts.tajawal(
                  fontSize: 4.w,
                  color: LightMode.blackColor,
                  fontWeight: FontWeight.w700),
            )
          ],
        ),
      ],
    ),
  );
}

Widget typeOfUser(Function(String?)? onChanged1, Function(String?)? onChanged2,
    type, context) {
  return Container(
    margin: EdgeInsets.only(right: 7.w, left: 7.w, top: 2.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          S.of(context).type,
          style:
              GoogleFonts.tajawal(fontSize: 5.w, fontWeight: FontWeight.w700),
        ),
        Row(
          children: [
            SizedBox(
              width: 24.w,
              child: Row(
                children: [
                  Radio<String>(
                      activeColor: LightMode.blueColor,
                      value: 'مستأجر',
                      groupValue: type,
                      onChanged: onChanged1),
                  Text(
                    S.of(context).type_1,
                    style: GoogleFonts.tajawal(
                        fontSize: 3.5.w, fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 25.w,
              child: Row(
                children: [
                  Radio<String>(
                      activeColor: LightMode.blueColor,
                      value: 'مالك',
                      groupValue: type,
                      onChanged: onChanged2),
                  Text(
                    S.of(context).type_2,
                    style: GoogleFonts.tajawal(
                        fontSize: 3.5.w, fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ),
          ],
        )
      ],
    ),
  );
}

Widget textFailed(controller, keyBoardType, obscure, hintText, bool iconic,
    icon, String? Function(String?)? validate) {
  return TextFormField(
    validator: validate,
    autovalidateMode: AutovalidateMode.onUserInteraction,
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
            color: LightMode.blueColor.withValues(alpha: .5)),
        suffixIcon: iconic == true ? icon : null,
        suffixIconColor: LightMode.blueColor),
  );
}

Widget appBarSign(onPressBack, text) {
  return Container(
    margin: EdgeInsets.only(top: 7.h, right: 7.w, left: 7.w),
    child: Row(
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
        )
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
            fontSize: 3.w, color: Colors.red, fontWeight: FontWeight.w700),
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
          style: GoogleFonts.tajawal(
              fontSize: 5.w, fontWeight: FontWeight.bold, color: colorText),
        ),
      ),
    ),
  );
}
