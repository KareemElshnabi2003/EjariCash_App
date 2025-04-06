import 'dart:developer';

import 'package:ejary_cash/controller/add_ads/add_ads_controller.dart';
import 'package:ejary_cash/core/constant/colors.dart';
import 'package:ejary_cash/generated/l10n.dart';
import 'package:ejary_cash/main.dart';
import 'package:ejary_cash/view/screens/auth/register/sign_up.dart';
import 'package:ejary_cash/view/screens/home/addd_ads/ads_info_owner/ads_info_owner_1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class AdsInfoBroker1 extends StatelessWidget {
  const AdsInfoBroker1({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddAdsController());
    return Scaffold(
      backgroundColor: LightMode.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            appBarSign(() {
              Get.back();
            }, S.of(context).addUnitDetails),
            SizedBox(
              height: 5.w,
            ),
            appBarProgress(60.w, 1),
            GetBuilder<AddAdsController>(
              builder: (controller) => SingleChildScrollView(
                child: Form(
                  key: controller.formBrokerPage1Key,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 5.w, left: 5.w),
                        child: Text(
                          S.of(context).brokerType,
                          style: TextStyle(
                              fontSize: 6.w,
                              color: LightMode.blackColor,
                              fontWeight: FontWeight.w800),
                        ),
                      ),
                      SizedBox(
                        height: 5.w,
                      ),
                      radioButton(
                          S.of(context).individual, S.of(context).company,
                          (val) {
                        controller.changeTypeBroker(val);
                      }, (val) {
                        controller.changeTypeBroker(val);
                      }, controller.typeBroker),
                      SizedBox(
                        height: 5.w,
                      ),
                      if (controller.typeBroker == "شركة")
                        Container(
                          padding: EdgeInsets.only(top: 3.w, bottom: 3.w),
                          margin:
                              EdgeInsets.only(top: 5.w, right: 7.w, left: 7.w),
                          color: LightMode.fillTextFieldColor,
                          height: 20.w,
                          child: textFailed(
                              controller.comPanyNameController,
                              TextInputType.text,
                              false,
                              S.of(context).companyName,
                              false,
                              null, (val) {
                            return controller.companyNameValidator(val!);
                          }, true),
                        ),
                      Container(
                        padding: EdgeInsets.only(top: 3.w, bottom: 3.w),
                        margin:
                            EdgeInsets.only(top: 5.w, right: 7.w, left: 7.w),
                        color: LightMode.fillTextFieldColor,
                        height: 20.w,
                        child: textFailed(
                            controller.addressAdsController,
                            TextInputType.text,
                            false,
                            S.of(context).addressUnit,
                            false,
                            null, (val) {
                          return controller.addressAdsValidator(val!);
                        }, true),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 3.w, bottom: 3.w),
                        margin:
                            EdgeInsets.only(top: 5.w, right: 7.w, left: 7.w),
                        color: LightMode.fillTextFieldColor,
                        // height: 30.h,
                        width: 90.w,
                        child: textFailedDescription(
                            controller.descriptionAdsController,
                            TextInputType.text,
                            false,
                            S.of(context).descripeUnite,
                            false,
                            null, (val) {
                          return controller.descriptionAdsValidator(val!);
                        }),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 3.w, bottom: 3.w),
                        margin:
                            EdgeInsets.only(top: 5.w, right: 7.w, left: 7.w),
                        color: LightMode.fillTextFieldColor,
                        height: 20.w,
                        child: textFailed(
                            controller.numberAuthController,
                            TextInputType.text,
                            false,
                            S.of(context).idNum,
                            false,
                            null, (val) {
                          return controller.numberAuthValidator(val!);
                        }, true),
                      ),
                      // Container(
                      //   padding: EdgeInsets.only(top: 3.w, bottom: 3.w),
                      //   margin:
                      //       EdgeInsets.only(top: 5.w, right: 7.w, left: 7.w),
                      //   color: LightMode.fillTextFieldColor,
                      //   height: 20.w,
                      //   child: textFailed(
                      //       controller.adsNumberController,
                      //       TextInputType.number,
                      //       false,
                      //       S.of(context).adsNum,
                      //       false,
                      //       null, (val) {
                      //     return controller.adsNumberValidator(val!);
                      //   }, true),
                      // ),
                      // Container(
                      //   padding: EdgeInsets.only(top: 3.w, bottom: 3.w),
                      //   margin:
                      //       EdgeInsets.only(top: 5.w, right: 7.w, left: 7.w),
                      //   color: LightMode.fillTextFieldColor,
                      //   height: 20.w,
                      //   child: textFailed(
                      //       controller.numberOffFalController,
                      //       TextInputType.text,
                      //       false,
                      //       S.of(context).valNum,
                      //       false,
                      //       null, (val) {
                      //     return controller.numberOffFalValidator(val!);
                      //   }, true),
                      // ),

                      Container(
                        padding: EdgeInsets.only(top: 3.w, bottom: 3.w),
                        margin:
                            EdgeInsets.only(top: 5.w, right: 7.w, left: 7.w),
                        color: LightMode.fillTextFieldColor,
                        height: 20.w,
                        child: textFailed(
                            controller.areaNumberController,
                            TextInputType.number,
                            false,
                            S.of(context).totalArea,
                            false,
                            null, (val) {
                          return controller.areaNumberValidator(val!);
                        }, true),
                      ),
                      // Container(
                      //   padding: EdgeInsets.only(top: 3.w, bottom: 3.w),
                      //   margin:
                      //       EdgeInsets.only(top: 5.w, right: 7.w, left: 7.w),
                      //   color: LightMode.fillTextFieldColor,
                      //   height: 20.w,
                      //   child: textFailed(
                      //       controller.numberOhBuildingController,
                      //       TextInputType.number,
                      //       false,
                      //       S.of(context).buildingNum,
                      //       false,
                      //       null, (val) {
                      //     return controller.numberOhBuildingValidator(val!);
                      //   }, true),
                      // ),
                      // Container(
                      //   padding: EdgeInsets.only(top: 3.w, bottom: 3.w),
                      //   margin:
                      //       EdgeInsets.only(top: 5.w, right: 7.w, left: 7.w),
                      //   color: LightMode.fillTextFieldColor,
                      //   height: 20.w,
                      //   child: textFailed(
                      //       controller.postaNumController,
                      //       TextInputType.number,
                      //       false,
                      //       S.of(context).postCode,
                      //       false,
                      //       null, (val) {
                      //     return controller.postaNumValidator(val!);
                      //   }, true),
                      // ),
                      Container(
                        padding: EdgeInsets.only(top: 3.w, bottom: 3.w),
                        margin:
                            EdgeInsets.only(top: 5.w, right: 7.w, left: 7.w),
                        color: LightMode.fillTextFieldColor,
                        height: 20.w,
                        child: textFailed(
                            controller.aditionalNumController,
                            TextInputType.phone,
                            false,
                            S.of(context).additionalPhone,
                            false,
                            null, (val) {
                          if (val!.isEmpty) {
                            return S.of(context).errorPhone_1;
                          } else if (val.length > 9 || val.length < 8) {
                            return S.of(context).errorPhone_2;
                          } else {
                            return null;
                          }
                        }, true, phone: true),
                      ),
                      // Container(
                      //   alignment: Alignment.center,
                      //   width: 100.w,
                      //   child: dropDowenList(S.of(context).interface,
                      //       controller.face, controller.faces, (val) {
                      //     controller.changeFace(val);
                      //   }),
                      // ),
                      // Container(
                      //   padding: EdgeInsets.only(top: 3.w, bottom: 3.w),
                      //   margin:
                      //       EdgeInsets.only(top: 5.w, right: 7.w, left: 7.w),
                      //   color: LightMode.fillTextFieldColor,
                      //   height: 20.w,
                      //   child: textFailed(
                      //       controller.streetWidthController,
                      //       TextInputType.number,
                      //       false,
                      //       S.of(context).widthStreet,
                      //       false,
                      //       null, (val) {
                      //     return controller.streetWidthValidator(val!);
                      //   }, true),
                      // ),
                      Container(
                        padding: EdgeInsets.only(top: 3.w, bottom: 3.w),
                        margin:
                            EdgeInsets.only(top: 5.w, right: 7.w, left: 7.w),
                        color: LightMode.fillTextFieldColor,
                        height: 20.w,
                        child: textFailed(
                            controller.yearPriceController,
                            TextInputType.number,
                            false,
                            S.of(context).yearPrice,
                            false,
                            null,
                            (val) {
                              return controller.yearPriceValidator(val!);
                            },
                            true,
                            onChange: (val) {
                              log(val);
                              controller.monthPriceController.text =
                                  ((double.parse(val == "" ? "0" : val) +
                                              (double.parse(
                                                      val == "" ? "0" : val) /
                                                  5)) /
                                          12)
                                      .toStringAsFixed(2)
                                      .toString();
                              Get.appUpdate();
                            }),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 3.w, bottom: 3.w),
                        margin:
                            EdgeInsets.only(top: 5.w, right: 7.w, left: 7.w),
                        color: LightMode.fillTextFieldColor,
                        height: 20.w,
                        child: textFailed(
                            controller.monthPriceController,
                            TextInputType.number,
                            false,
                            S.of(context).monthPrice,
                            false,
                            null, (val) {
                          return null;
                        }, false),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      btnClick(S.of(context).next, () {
                        controller.nextButtonBroker_1();
                      }, LightMode.whiteColor, LightMode.blueColor,
                          LightMode.blueColor),
                      SizedBox(
                        height: 10.w,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
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

Widget textFailed(controller, keyBoardType, obscure, hintText, bool iconic,
    icon, String? Function(String?)? validate, enabel,
    {Function(String)? onChange, phone}) {
  return TextFormField(
    onChanged: onChange,
    validator: validate,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    controller: controller,
    keyboardType: keyBoardType,
    obscureText: obscure,
    enabled: enabel,
    style: GoogleFonts.tajawal(
        fontSize: 5.w, fontWeight: FontWeight.w700, color: LightMode.blueColor),
    decoration: InputDecoration(
        prefixText: phone == true ? "+966 " : null,
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
        prefixIcon: sharedPreferences!.getString("loacal") == "en"
            ? null
            : Text(
                " *  ",
                style: GoogleFonts.tajawal(
                    fontSize: 7.w,
                    fontWeight: FontWeight.w700,
                    color: Colors.red),
              ),
        suffixText:
            sharedPreferences!.getString("loacal") == "en" ? " * " : null,
        suffixStyle: GoogleFonts.tajawal(
            fontSize: 7.w, fontWeight: FontWeight.w700, color: Colors.red),
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

Widget radioButton(value1, value2, Function(String?)? onChanged1,
    Function(String?)? onChanged2, type) {
  return Container(
    margin: EdgeInsets.only(right: 7.w, left: 7.w, top: 2.h),
    child: Row(
      children: [
        SizedBox(
          width: 40.w,
          child: Row(
            children: [
              Radio<String>(
                  activeColor: LightMode.blueColor,
                  value: value1,
                  groupValue: type,
                  onChanged: onChanged1),
              Text(
                value1,
                style: GoogleFonts.tajawal(
                    fontSize: 5.w, fontWeight: FontWeight.w700),
              )
            ],
          ),
        ),
        SizedBox(
          width: 40.w,
          child: Row(
            children: [
              Radio<String>(
                  activeColor: LightMode.blueColor,
                  value: value2,
                  groupValue: type,
                  onChanged: onChanged2),
              Text(
                value2,
                style: GoogleFonts.tajawal(
                    fontSize: 5.w, fontWeight: FontWeight.w700),
              )
            ],
          ),
        ),
      ],
    ),
  );
}
