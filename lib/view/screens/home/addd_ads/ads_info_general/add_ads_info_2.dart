import 'package:ejary_cash/controller/add_ads/add_ads_controller.dart';
import 'package:ejary_cash/core/constant/colors.dart';
import 'package:ejary_cash/data/model/city_area_model.dart';
import 'package:ejary_cash/generated/l10n.dart';
import 'package:ejary_cash/view/screens/auth/register/sign_up.dart';
import 'package:ejary_cash/view/screens/home/addd_ads/ads_info_owner/ads_info_owner_1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class AddAdsInfo2 extends StatelessWidget {
  const AddAdsInfo2({super.key});

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
            appBarProgress(40.w, 2),
            GetBuilder<AddAdsController>(
              builder: (controller) => SingleChildScrollView(
                child: SizedBox(
                  child: Form(
                      key: controller.formPage2Key,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 3.w, bottom: 3.w),
                            margin: EdgeInsets.only(
                                top: 5.w, right: 7.w, left: 7.w),
                            color: LightMode.fillTextFieldColor,
                            height: 20.w,
                            child: textFailed(
                                controller.roomNumController,
                                TextInputType.number,
                                false,
                                S.of(context).roomNum,
                                false,
                                null, (val) {
                              return controller.roomNumValidator(val!);
                            }),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 3.w, bottom: 3.w),
                            margin: EdgeInsets.only(
                                top: 5.w, right: 7.w, left: 7.w),
                            color: LightMode.fillTextFieldColor,
                            height: 20.w,
                            child: textFailed(
                                controller.bathRoomNumController,
                                TextInputType.number,
                                false,
                                S.of(context).bathroomNum,
                                false,
                                null, (val) {
                              return controller.bathRoomNumValidator(val!);
                            }),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 3.w, bottom: 3.w),
                            margin: EdgeInsets.only(
                                top: 5.w, right: 7.w, left: 7.w),
                            color: LightMode.fillTextFieldColor,
                            height: 20.w,
                            child: textFailed(
                                controller.parkingNumController,
                                TextInputType.number,
                                false,
                                S.of(context).parkingNum,
                                false,
                                null, (val) {
                              return controller.parkingNumValidator(val!);
                            }),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 3.w, bottom: 3.w),
                            margin: EdgeInsets.only(
                                top: 5.w, right: 7.w, left: 7.w),
                            color: LightMode.fillTextFieldColor,
                            height: 20.w,
                            child: textFailed(
                                controller.liftsNumController,
                                TextInputType.number,
                                false,
                                S.of(context).elevatorNum,
                                false,
                                null, (val) {
                              return controller.liftsNumValidator(val!);
                            }),
                          ),
                          dropDowenListCategory(
                              S.of(context).propertyType,
                              controller.categoryName,
                              controller.categoryList, (val) {
                            controller.changeCategory(val);
                          }, controller.categoryId),
                          dropDowenListArea(S.of(context).area,
                              controller.areaName, controller.areasList, (val) {
                            controller.changeArea(val);
                          }, controller.areaId),
                          dropDowenListCity(
                              S.of(context).city,
                              controller.cityName,
                              controller.citiesList, (val) {
                            controller.changeCity(val);
                          }, controller.cityId),
                          // dropDowenListCity("الحي", controller.districtName,
                          //     controller.districtsList, (val) {
                          //   controller.changeDistrict(val);
                          // }, controller.districtId),
                          dropDowenList(
                              S.of(context).ownerShipAge,
                              controller.propartyAge,
                              controller.propartiesAge, (val) {
                            controller.changeProparty(val);
                          }),
                          dropDowenList(
                              S.of(context).tenantPref,
                              controller.preferEjar,
                              controller.preferesEjar, (val) {
                            controller.changePrefer(val);
                          }),
                          Container(
                            padding: EdgeInsets.only(top: 3.w, bottom: 3.w),
                            margin: EdgeInsets.only(
                                top: 5.w, right: 7.w, left: 7.w),
                            color: LightMode.fillTextFieldColor,
                            height: 20.w,
                            child: textFailed(
                                controller.loginWayController,
                                TextInputType.text,
                                false,
                                S.of(context).enterMethod,
                                false,
                                null, (val) {
                              return controller.loginWayValidator(val!);
                            }),
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 3.w, bottom: 3.w),
                            margin: EdgeInsets.only(
                                top: 5.w, right: 7.w, left: 7.w),
                            color: LightMode.fillTextFieldColor,
                            height: 20.w,
                            child: textFailed(
                                controller.additionalPrivacyController,
                                TextInputType.text,
                                false,
                                S.of(context).additonalTerm,
                                false,
                                null, (val) {
                              return controller
                                  .additionalPrivacyValidator(val!);
                            }),
                          ),
                          SizedBox(
                            height: 10.w,
                          ),
                          btnClick(S.of(context).next, () {
                            controller.nextButton_2();
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

Widget dropDowenListArea(title, value, List<LocationModel> valueList,
    Function(Object?)? onChange, locationId) {
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
                  onTap: () {
                    AddAdsController controller = Get.put(AddAdsController());
                    controller.areaId = valueList[index].id!;
                    Get.appUpdate();
                  },
                  value: valueList[index].title,
                  child: Text(valueList[index].title!,
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

Widget dropDowenListCategory(title, value, List<LocationModel> valueList,
    Function(Object?)? onChange, locationId) {
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
                  onTap: () {
                    AddAdsController controller = Get.put(AddAdsController());
                    controller.categoryId = valueList[index].id!;
                    Get.appUpdate();
                  },
                  value: valueList[index].title,
                  child: Text(valueList[index].title!,
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

Widget dropDowenListCity(title, value, List<LocationModel> valueList,
    Function(Object?)? onChange, locationId) {
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
                  onTap: () {
                    AddAdsController controller = Get.put(AddAdsController());
                    controller.cityId = valueList[index].id!;
                    Get.appUpdate();
                  },
                  value: valueList[index].title,
                  child: Text(valueList[index].title!,
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

Widget dropDowenList(title, value, valueList, Function(Object?)? onChange) {
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
        prefixIcon: Text(
          " *  ",
          style: GoogleFonts.tajawal(
              fontSize: 7.w, fontWeight: FontWeight.w700, color: Colors.red),
        ),
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
