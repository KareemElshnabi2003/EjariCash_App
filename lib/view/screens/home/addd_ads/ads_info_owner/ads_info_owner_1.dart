import 'package:ejary_cash/controller/add_ads/add_ads_controller.dart';
import 'package:ejary_cash/core/constant/colors.dart';
import 'package:ejary_cash/generated/l10n.dart';
import 'package:ejary_cash/main.dart';
import 'package:ejary_cash/view/screens/auth/register/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class AdsInfoOwner1 extends StatelessWidget {
  const AdsInfoOwner1({super.key});

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
            appBarProgress(60.w, 1),
            GetBuilder<AddAdsController>(
              builder: (controller) => SingleChildScrollView(
                child: SizedBox(
                  child: Form(
                      key: controller.formOwnerPage1Key,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 3.w, bottom: 3.w),
                            margin: EdgeInsets.only(
                                top: 5.w, right: 7.w, left: 7.w),
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
                            }),
                          ),
                          // Container(
                          //   padding: EdgeInsets.only(top: 3.w, bottom: 3.w),
                          //   margin: EdgeInsets.only(
                          //       top: 5.w, right: 7.w, left: 7.w),
                          //   color: LightMode.fillTextFieldColor,
                          //   height: 20.w,
                          //   child: textFailed(
                          //       controller.numberOfdeadController,
                          //       TextInputType.number,
                          //       false,
                          //       S.of(context).deedNum,
                          //       false,
                          //       null, (val) {
                          //     return controller.numberOfdeadValidator(val!);
                          //   }),
                          // ),

                          Container(
                            padding: EdgeInsets.only(top: 3.w, bottom: 3.w),
                            margin: EdgeInsets.only(
                                top: 5.w, right: 7.w, left: 7.w),
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
                            margin: EdgeInsets.only(
                                top: 5.w, right: 7.w, left: 7.w),
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
                            }),
                          ),
                          // Container(
                          //   padding: EdgeInsets.only(top: 3.w, bottom: 3.w),
                          //   margin: EdgeInsets.only(
                          //       top: 5.w, right: 7.w, left: 7.w),
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
                          //   }),
                          // ),
                          // Container(
                          //   padding: EdgeInsets.only(top: 3.w, bottom: 3.w),
                          //   margin: EdgeInsets.only(
                          //       top: 5.w, right: 7.w, left: 7.w),
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
                          //   }),
                          // ),
                          Container(
                            padding: EdgeInsets.only(top: 3.w, bottom: 3.w),
                            margin: EdgeInsets.only(
                                top: 5.w, right: 7.w, left: 7.w),
                            color: LightMode.fillTextFieldColor,
                            height: 20.w,
                            child: textFailed(
                                controller.aditionalNumController,
                                TextInputType.number,
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
                            }, phone: true),
                          ),
                          // dropDowenList(S.of(context).interface,
                          //     controller.face, controller.faces, (val) {
                          //   controller.changeFace(val);
                          // }),
                          // Container(
                          //   padding: EdgeInsets.only(top: 3.w, bottom: 3.w),
                          //   margin: EdgeInsets.only(
                          //       top: 5.w, right: 7.w, left: 7.w),
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
                          //   }),
                          // ),
                          Container(
                            padding: EdgeInsets.only(top: 3.w, bottom: 3.w),
                            margin: EdgeInsets.only(
                                top: 5.w, right: 7.w, left: 7.w),
                            color: LightMode.fillTextFieldColor,
                            height: 20.w,
                            child: textFailed(
                                controller.yearPriceController,
                                TextInputType.number,
                                false,
                                S.of(context).yearPrice,
                                false,
                                null, (val) {
                              return controller.yearPriceValidator(val!);
                            }, onChange: (val) {
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
                            margin: EdgeInsets.only(
                                top: 5.w, right: 7.w, left: 7.w),
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
                            }, enabel: false),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 3.w, bottom: 3.w),
                            margin: EdgeInsets.only(
                                top: 5.w, right: 7.w, left: 7.w),
                            color: LightMode.fillTextFieldColor,
                            height: 20.w,
                            child: textFailed(
                                controller.insurancePriceController,
                                TextInputType.number,
                                false,
                                S.of(context).insuranceAmount,
                                false,
                                null, (val) {
                              return controller.insurancePriceValidator(val!);
                            }),
                          ),
                          SizedBox(
                            height: 10.w,
                          ),
                          btnClick("التالي", () {
                            controller.nextButtonOwner_1();
                          }, LightMode.whiteColor, LightMode.blueColor,
                              LightMode.blueColor),
                          SizedBox(
                            height: 10.w,
                          ),
                        ],
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget textFailed(controller, keyBoardType, obscure, hintText, bool iconic,
    icon, String? Function(String?)? validate,
    {enabel, onChange, phone}) {
  return TextFormField(
    validator: validate,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    controller: controller,
    keyboardType: keyBoardType,
    obscureText: obscure,
    enabled: enabel,
    onChanged: onChange,
    style: GoogleFonts.tajawal(
        fontSize: 5.w, fontWeight: FontWeight.w700, color: LightMode.blueColor),
    decoration: InputDecoration(
        prefixText: phone == true ? "+966 " : null,
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

Widget dropDowenList(
    title, value, List valueList, Function(Object?)? onChange) {
  return Container(
    margin: EdgeInsets.only(top: 5.w),
    height: 20.w,
    width: 86.w,
    padding: const EdgeInsets.all(5),
    color: LightMode.fillTextFieldColor,
    child: DropdownButtonHideUnderline(
      child: ButtonTheme(
        alignedDropdown: true,
        child: DropdownButton(
          style: GoogleFonts.tajawal(
              fontSize: 3.5.w,
              fontWeight: FontWeight.w500,
              color: LightMode.blueColor),
          icon: const Icon(Icons.arrow_drop_down_sharp),
          borderRadius: const BorderRadius.all(Radius.circular(25)),
          iconDisabledColor: LightMode.blueColor,
          iconEnabledColor: LightMode.blueColor,
          menuMaxHeight: 25.h,
          hint: Text(
            title,
            textAlign: TextAlign.end,
            textDirection: TextDirection.rtl,
            style: GoogleFonts.tajawal(
                fontSize: 3.5.w,
                fontWeight: FontWeight.w500,
                color: LightMode.blueColor),
          ),
          value: value,
          dropdownColor: LightMode.whiteColor,
          items: [
            ...List.generate(
              valueList.length,
              (index) => DropdownMenuItem(
                  value: valueList[index],
                  child: Text(valueList[index],
                      style: GoogleFonts.tajawal(
                          fontSize: 3.5.w,
                          fontWeight: FontWeight.w500,
                          color: LightMode.blueColor))),
            )
          ],
          onChanged: onChange,
        ),
      ),
    ),
  );
}

Widget textFailedDescription(controller, keyBoardType, obscure, hintText,
    bool iconic, icon, String? Function(String?)? validate) {
  return SizedBox(
    // height: 30.h,
    width: 80.w,
    child: TextFormField(
      validator: validate,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      keyboardType: keyBoardType,
      obscureText: obscure,
      maxLength: 1000,
      maxLines: 7,
      style: GoogleFonts.tajawal(
          fontSize: 5.w,
          fontWeight: FontWeight.w700,
          color: LightMode.blueColor),
      decoration: InputDecoration(
          contentPadding: EdgeInsets.only(
            bottom: 5.w,
            right: 5.w,
            left: 5.w,
          ),
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
    ),
  );
}

Widget appBarProgress(width, text) {
  return Container(
    margin: EdgeInsets.only(right: 10.w, left: 10.w, top: 5.w, bottom: 5.w),
    width: 80.w,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            color: LightMode.greycolor,
            width: 80.w,
            height: 2.w,
            child: Divider(
              color: LightMode.blueColor,
              endIndent: width,
              indent: 0,
              thickness: 2.w,
            )),
        Text(
          "$text/4",
          style: GoogleFonts.tajawal(
              color: LightMode.blackColor,
              fontSize: 4.w,
              fontWeight: FontWeight.w700),
        )
      ],
    ),
  );
}
