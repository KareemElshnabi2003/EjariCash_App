import 'package:ejary_cash/controller/home/orders/orders_controller.dart';
import 'package:ejary_cash/core/class/status_request.dart';
import 'package:ejary_cash/core/constant/colors.dart';
import 'package:ejary_cash/data/model/city_area_model.dart';
import 'package:ejary_cash/generated/l10n.dart';
import 'package:ejary_cash/main.dart';
import 'package:ejary_cash/view/screens/auth/register/sign_up.dart';
import 'package:ejary_cash/view/screens/home/orders/make_order/ads_order.dart';
import 'package:ejary_cash/view/widget/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class PersonalOrder extends StatelessWidget {
  const PersonalOrder({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersController());
    return Scaffold(
      backgroundColor: LightMode.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            appBarSign(() {
              Get.back();
            }, S.of(context).requestNow),
            GetBuilder<OrdersController>(
              builder: (controller) =>
                  controller.statuesRequest == StatuesRequest.loading
                      ? loading(90.h)
                      : Form(
                          key: controller.personalRentKey,
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(top: 3.w, bottom: 3.w),
                                margin: EdgeInsets.only(
                                    top: 5.w, right: 7.w, left: 7.w),
                                color: LightMode.fillTextFieldColor,
                                height: 20.w,
                                child: textFailed(
                                    controller.nameController,
                                    TextInputType.text,
                                    false,
                                    S.of(context).name,
                                    false,
                                    null, (val) {
                                  if (val!.isEmpty) {
                                    return S.of(context).errorUserName_1;
                                  } else {
                                    return null;
                                  }
                                }, true, false),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 3.w, bottom: 3.w),
                                margin: EdgeInsets.only(
                                    top: 5.w, right: 7.w, left: 7.w),
                                color: LightMode.fillTextFieldColor,
                                height: 20.w,
                                child: textFailed(
                                    controller.phoneController,
                                    TextInputType.number,
                                    false,
                                    S.of(context).phoneRenter,
                                    false,
                                    null, (val) {
                                  if (val!.length < 8 || val.length > 9) {
                                    return S.of(context).errorPhone_2;
                                  } else {
                                    return null;
                                  }
                                }, true, true),
                              ),
                              dropDowenListPayment(
                                  controller.paymentPlan,
                                  controller.paymentPlan,
                                  controller.paymentPlans, (val) {
                                controller.changePAymentPlan(val);
                              }),
                              Container(
                                padding: EdgeInsets.only(top: 3.w, bottom: 3.w),
                                margin: EdgeInsets.only(
                                    top: 5.w, right: 7.w, left: 7.w),
                                color: LightMode.fillTextFieldColor,
                                height: 20.w,
                                child: textFailed(
                                    controller.yearelyRentController,
                                    TextInputType.number,
                                    false,
                                    S.of(context).yearlyRent,
                                    false,
                                    null,
                                    (val) {
                                      if (!val!.isNum) {
                                        return S.of(context).errorEnterEjar;
                                      } else {
                                        return null;
                                      }
                                    },
                                    true,
                                    false,
                                    onChange: (val) {
                                      controller.computeMonthlyRent();
                                    }),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 3.w, bottom: 3.w),
                                margin: EdgeInsets.only(
                                    top: 5.w, right: 7.w, left: 7.w),
                                color: LightMode.fillTextFieldColor,
                                height: 20.w,
                                child: textFailed(
                                    controller.monthRentController,
                                    TextInputType.number,
                                    false,
                                    S.of(context).monthlyRent,
                                    false,
                                    null, (val) {
                                  return null;
                                }, false, false),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 3.w, bottom: 3.w),
                                margin: EdgeInsets.only(
                                    top: 5.w, right: 7.w, left: 7.w),
                                color: LightMode.fillTextFieldColor,
                                height: 20.w,
                                child: textFailed(
                                    controller.nameOwnerController,
                                    TextInputType.text,
                                    false,
                                    S.of(context).ownerName,
                                    false,
                                    null, (val) {
                                  if (val!.isEmpty) {
                                    return S.of(context).errorUserName_1;
                                  } else {
                                    return null;
                                  }
                                }, true, false),
                              ),

                              Container(
                                padding: EdgeInsets.only(top: 3.w, bottom: 3.w),
                                margin: EdgeInsets.only(
                                    top: 5.w, right: 7.w, left: 7.w),
                                color: LightMode.fillTextFieldColor,
                                height: 20.w,
                                child: textFailed(
                                    controller.phoneOwnerController,
                                    TextInputType.number,
                                    false,
                                    S.of(context).ownerPhone,
                                    false,
                                    null, (val) {
                                  if (val!.length < 8 || val.length > 9) {
                                    return S.of(context).errorPhone_1;
                                  } else {
                                    return null;
                                  }
                                }, true, true),
                              ),
                              yesOrNo((val) {
                                controller.changeTytpe(val);
                              }, (val) {
                                controller.changeTytpe(val);
                              }, controller.type, context),
                              dropDowenListArea(
                                  S.of(context).area,
                                  controller.areaName,
                                  controller.areasList, (val) {
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
                              Container(
                                padding: EdgeInsets.only(top: 3.w, bottom: 3.w),
                                margin: EdgeInsets.only(
                                    top: 5.w, right: 7.w, left: 7.w),
                                color: LightMode.fillTextFieldColor,
                                height: 20.w,
                                child: textFailed(
                                    controller.linkLocationController,
                                    TextInputType.url,
                                    false,
                                    S.of(context).hintGoogleMap,
                                    false,
                                    null, (val) {
                                  if (val!.isEmpty) {
                                    return S.of(context).locationError_1;
                                  } else if (!val.isURL) {
                                    return S.of(context).locationError_2;
                                  }
                                  {
                                    return null;
                                  }
                                }, true, false,
                                    hint: true,
                                    text2: S.of(context).hintGoogleMap),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 3.w, bottom: 3.w),
                                margin: EdgeInsets.only(
                                    top: 5.w, right: 7.w, left: 7.w),
                                color: LightMode.fillTextFieldColor,
                                // height: 30.h,
                                width: 90.w,
                                child: textFailedDescription(
                                    controller.notesController,
                                    TextInputType.text,
                                    false,
                                    S.of(context).descripeUnite,
                                    false,
                                    null, (val) {
                                  if (val!.isEmpty) {
                                    return S.of(context).errorDescripe;
                                  } else {
                                    return null;
                                  }
                                }),
                              ),
                              SizedBox(
                                height: 15.w,
                              ),
                              btnClick(S.of(context).rentOrder, () {
                                //validate  dont forget
                                controller.rentPersobal(context);
                              }, LightMode.whiteColor, LightMode.blueColor,
                                  LightMode.blueColor),
                              SizedBox(
                                height: 10.w,
                              ),
                            ],
                          )),
            )
          ],
        ),
      ),
    );
  }
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
          labelStyle: GoogleFonts.tajawal(
              fontSize: 5.w,
              fontWeight: FontWeight.w700,
              color: LightMode.blueColor.withValues(alpha: .5)),
          suffixIcon: iconic == true ? icon : null,
          suffixIconColor: LightMode.blueColor),
    ),
  );
}

Widget yesOrNo(Function(String?)? onChanged1, Function(String?)? onChanged2,
    type, context) {
  return Container(
    margin: EdgeInsets.only(right: 7.w, left: 7.w, top: 2.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          S.of(Get.context!).areYouAgree,
          style: GoogleFonts.tajawal(
              fontSize: 5.w,
              fontWeight: FontWeight.w700,
              color: LightMode.blueColor),
        ),
        Row(
          children: [
            SizedBox(
              width: 30.w,
              child: Row(
                children: [
                  Radio<String>(
                      activeColor: LightMode.blueColor,
                      value: 'نعم',
                      groupValue: type,
                      onChanged: onChanged1),
                  Text(
                    S.of(Get.context!).yes,
                    style: GoogleFonts.tajawal(
                        fontSize: 3.5.w,
                        fontWeight: FontWeight.w700,
                        color: LightMode.blueColor),
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
                      value: 'لا',
                      groupValue: type,
                      onChanged: onChanged2),
                  Text(
                    S.of(Get.context!).no,
                    style: GoogleFonts.tajawal(
                        fontSize: 3.5.w,
                        fontWeight: FontWeight.w700,
                        color: LightMode.blueColor),
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
                    OrdersController controller = Get.put(OrdersController());
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
                    OrdersController controller = Get.put(OrdersController());
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

Widget textFailed(controller, keyBoardType, obscure, hintText, bool iconic,
    icon, String? Function(String?)? validate, enabel, phone,
    {onChange, hint, text2}) {
  return TextFormField(
    validator: validate,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    controller: controller,
    keyboardType: keyBoardType,
    onChanged: onChange,
    enabled: enabel,
    obscureText: obscure,
    style: GoogleFonts.tajawal(
        fontSize: 5.w, fontWeight: FontWeight.w700, color: LightMode.blueColor),
    decoration: InputDecoration(
        prefixText: phone == true ? "+966 " : null,
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
        labelText: hint == true ? text2 : hintText,
        labelStyle: GoogleFonts.tajawal(
            fontSize: 5.w,
            fontWeight: FontWeight.w700,
            color: LightMode.blueColor.withValues(alpha: .5)),
        suffixIcon: iconic == true ? icon : null,
        suffixIconColor: LightMode.blueColor),
  );
}
