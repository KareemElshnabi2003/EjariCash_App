import 'package:ejary_cash/controller/home/orders/orders_controller.dart';
import 'package:ejary_cash/core/constant/colors.dart';
import 'package:ejary_cash/generated/l10n.dart';
import 'package:ejary_cash/main.dart';
import 'package:ejary_cash/view/screens/auth/register/sign_up.dart';
import 'package:ejary_cash/view/screens/home/orders/make_order/ads_order_part_two.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class AdsOrder extends StatelessWidget {
  final int priceAds;
  final String adsId;
  final dynamic yearlyRent;
  const AdsOrder(
      {super.key,
      required this.priceAds,
      required this.adsId,
      required this.yearlyRent});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersController());
    return Scaffold(
      backgroundColor: LightMode.whiteColor,
      body: ListView(
        padding: EdgeInsets.only(bottom: 5.w),
        children: [
          appBarSign(() {
            Get.back();
          }, S.of(context).requestNow),
          infoEjar(),
          GetBuilder<OrdersController>(
            builder: (controller) => Form(
                key: controller.ownAdsRentKey,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 3.w, bottom: 3.w),
                      margin: EdgeInsets.only(top: 5.w, right: 7.w, left: 7.w),
                      color: LightMode.fillTextFieldColor,
                      height: 20.w,
                      child: textFailed(
                          controller.timeRentController,
                          TextInputType.number,
                          false,
                          S.of(context).durationOneYear,
                          false,
                          null, (val) {
                        return null;
                      }, false),
                    ),
                    // dropDowenListPayment(controller.paymentPlan,
                    //     controller.paymentPlan, controller.paymentPlans, (val) {
                    //   controller.changePAymentPlan(val);
                    // }),
                    InkWell(
                      onTap: () {
                        controller.selectDate(context);
                      },
                      child: Container(
                        padding: EdgeInsets.only(top: 3.w, bottom: 3.w),
                        margin:
                            EdgeInsets.only(top: 5.w, right: 7.w, left: 7.w),
                        color: LightMode.fillTextFieldColor,
                        height: 20.w,
                        child: textFailed(
                            controller.dateOfMoveController,
                            TextInputType.text,
                            false,
                            S.of(context).dateOfMove,
                            false,
                            null, (val) {
                          if (val!.isEmpty) {
                            return S.of(context).errorDate;
                          } else {
                            return null;
                          }
                        }, false),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 3.w, bottom: 3.w),
                      margin: EdgeInsets.only(top: 5.w, right: 7.w, left: 7.w),
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
                      }, true),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 3.w, bottom: 3.w),
                      margin: EdgeInsets.only(top: 5.w, right: 7.w, left: 7.w),
                      color: LightMode.fillTextFieldColor,
                      height: 20.w,
                      child: textFailed(
                          controller.emailController,
                          TextInputType.text,
                          false,
                          S.of(context).email,
                          false,
                          null, (val) {
                        if (val!.isEmpty) {
                          return S.of(context).errorEmail_1;
                        } else {
                          return null;
                        }
                      }, true),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 3.w, bottom: 3.w),
                      margin: EdgeInsets.only(top: 5.w, right: 7.w, left: 7.w),
                      color: LightMode.fillTextFieldColor,
                      height: 20.w,
                      child: textFailed(
                          controller.phoneController,
                          TextInputType.phone,
                          false,
                          S.of(context).phone,
                          false,
                          null, (val) {
                        if (val!.isEmpty) {
                          return S.of(context).errorPhone_1;
                        } else {
                          return null;
                        }
                      }, true, phone: true),
                    ),

                    SizedBox(
                      height: 5.w,
                    ),
                    bottomInfo(S.of(context).mounthlyAmount,
                        "${(priceAds / 12).toStringAsFixed(2)} ريال"),
                    SizedBox(
                      height: 5.w,
                    ),
                    bottomInfo(S.of(context).unitPrice, "$priceAds ريال"),

                    SizedBox(
                      height: 15.w,
                    ),
                    btnClick(S.of(context).next, () {
                      if (controller.ownAdsRentKey.currentState!.validate()) {
                        Get.to(
                            () => AdsOrderPartTwo(
                                  adsId: adsId,
                                  yearlyRent: yearlyRent,
                                ),
                            transition: Transition.leftToRightWithFade,
                            duration: const Duration(milliseconds: 800));
                      }
                    }, LightMode.whiteColor, LightMode.blueColor,
                        LightMode.blueColor),
                  ],
                )),
          )
        ],
      ),
    );
  }
}

Widget dropDowenListPayment(
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
            title ?? S.of(Get.context!).paymentPlan,
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
    icon, String? Function(String?)? validate, enabel,
    {phone}) {
  return TextFormField(
    validator: validate,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    controller: controller,
    keyboardType: keyBoardType,
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
  );
}

Widget infoEjar() {
  return Container(
    alignment: Alignment.center,
    width: 100.w,
    margin: EdgeInsets.only(right: 10.w, left: 10.w, top: 5.w, bottom: 5.w),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              S.of(Get.context!).infoEjar,
              style: GoogleFonts.tajawal(
                  fontSize: 4.w,
                  fontWeight: FontWeight.w500,
                  color: LightMode.blueColor),
            ),
            SizedBox(
              width: 5.w,
            ),
            Text(
              S.of(Get.context!).reviewText,
              style: GoogleFonts.tajawal(
                  fontSize: 4.w,
                  fontWeight: FontWeight.w500,
                  color: LightMode.blueColor),
            )
          ],
        ),
        SizedBox(
          height: 2.w,
        ),
        SizedBox(
          width: 70.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 15.w,
                child: Divider(
                  color: LightMode.blackColor,
                  thickness: 2,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: LightMode.blueColor),
                  color: LightMode.whiteColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.done,
                  color: LightMode.blueColor,
                  size: 4.w,
                ),
              ),
              SizedBox(
                width: 25.w,
                child: Divider(
                  color: LightMode.greycolor,
                  thickness: 2,
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border:
                      Border.all(color: LightMode.blueColor.withValues(alpha: .2)),
                  color: LightMode.whiteColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.done,
                  color: LightMode.blueColor.withValues(alpha: .2),
                  size: 4.w,
                ),
              ),
              SizedBox(
                width: 15.w,
                child: Divider(
                  color: LightMode.greycolor,
                  thickness: 2,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget bottomInfo(title, price) {
  return Container(
    width: 100.w,
    margin: EdgeInsets.only(
      right: 5.w,
      left: 5.w,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.tajawal(
              fontSize: 5.w,
              fontWeight: FontWeight.bold,
              color: LightMode.blueColor),
        ),
        Text(
          price,
          style: GoogleFonts.tajawal(
              fontSize: 5.w,
              fontWeight: FontWeight.bold,
              color: LightMode.yellowColor),
        ),
      ],
    ),
  );
}
