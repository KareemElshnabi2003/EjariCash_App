import 'package:ejary_cash/controller/home/profile/faq_controller.dart';
import 'package:ejary_cash/core/constant/colors.dart';
import 'package:ejary_cash/generated/l10n.dart';
import 'package:ejary_cash/view/screens/auth/register/sign_up.dart';
import 'package:ejary_cash/view/widget/no_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class Faq extends StatelessWidget {
  const Faq({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FaqController());
    return Scaffold(
      backgroundColor: LightMode.whiteColor,
      body: GetBuilder<FaqController>(
        builder: (controller) => SingleChildScrollView(
          child: Column(
            children: [
              appBarSign(() {
                Get.back();
              }, S.of(context).faq),
              Container(
                margin: EdgeInsets.only(top: 5.w, right: 7.w, left: 7.w),
                height: 20.w,
                child: textFailed(
                    controller.searchController,
                    TextInputType.text,
                    false,
                    S.of(context).searchFAQ,
                    false,
                    null, (val) {
                  return null;
                }, (val) {
                  controller.checkSearch(val);
                }),
              ),
              controller.isSearch == false
                  ? Container(
                      width: 100.w,
                      height: 80.h,
                      margin: EdgeInsets.only(
                          right: 6.w, left: 6.w, bottom: 5.w, top: 10.w),
                      child: ListView.separated(
                          separatorBuilder: (context, index) => SizedBox(
                                height: 10.w,
                              ),
                          padding: EdgeInsets.zero,
                          itemCount: controller.faqList.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) => questionText(
                                  controller.isFav[controller.faqList[index].id.toString()] == "0" || controller.isFav[controller.faqList[index].id.toString()] == null
                                      ? 11.h
                                      : 20.h,
                                  controller.isFav[controller.faqList[index].id.toString()] == "0" || controller.isFav[controller.faqList[index].id.toString()] == null
                                      ? null
                                      : LightMode.whiteColor,
                                  controller.faqList[index].question,
                                  controller.isFav[controller.faqList[index].id.toString()] == "0" || controller.isFav[controller.faqList[index].id.toString()] == null
                                      ? LightMode.blackColor
                                      : LightMode.blueColor, () {
                                if (controller.isFav[controller
                                        .faqList[index].id
                                        .toString()] ==
                                    "0") {
                                  controller.setFavourite(
                                      controller.faqList[index].id.toString(),
                                      "1");
                                } else {
                                  controller.setFavourite(
                                      controller.faqList[index].id.toString(),
                                      "0");
                                }
                              },
                                  controller.isFav[controller.faqList[index].id.toString()] == "0" ||
                                          controller.isFav[controller.faqList[index].id.toString()] ==
                                              null
                                      ? Icons.arrow_drop_down
                                      : Icons.arrow_drop_up,
                                  controller.isFav[controller.faqList[index].id.toString()] ==
                                              "0" ||
                                          controller.isFav[controller.faqList[index].id.toString()] == null
                                      ? LightMode.blackColor
                                      : LightMode.blueColor,
                                  controller.isFav[controller.faqList[index].id.toString()],
                                  controller.faqList[index].answer)

                          //  cardQuestion(
                          //     controller.faqList[index].question,
                          //     controller.faqList[index].answer,
                          //     controller.index==index
                          //     controller.isAnswer, () {
                          //   controller.index = index;
                          //   controller.change();
                          // }),
                          ),
                    )
                  : controller.result.isEmpty
                      ? noData("لا يوجد أسئلة")
                      : Container(
                          width: 100.w,
                          height: 80.h,
                          margin: EdgeInsets.only(
                              right: 6.w, left: 6.w, bottom: 5.w, top: 5.w),
                          child: ListView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: controller.result.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) => questionText(
                                      controller.isFav[controller.result[index].id.toString()] == "0" || controller.isFav[controller.result[index].id.toString()] == null
                                          ? 11.h
                                          : 20.h,
                                      controller.isFav[controller.result[index].id.toString()] == "0" || controller.isFav[controller.result[index].id.toString()] == null
                                          ? null
                                          : LightMode.whiteColor,
                                      controller.result[index].question,
                                      controller.isFav[controller.result[index].id.toString()] == "0" || controller.isFav[controller.result[index].id.toString()] == null
                                          ? LightMode.blackColor
                                          : LightMode.blueColor, () {
                                    if (controller.isFav[controller
                                            .result[index].id
                                            .toString()] ==
                                        "0") {
                                      controller.setFavourite(
                                          controller.result[index].id
                                              .toString(),
                                          "1");
                                    } else {
                                      controller.setFavourite(
                                          controller.result[index].id
                                              .toString(),
                                          "0");
                                    }
                                  },
                                      controller.isFav[controller.result[index].id.toString()] == "0" ||
                                              controller.isFav[controller.result[index].id.toString()] ==
                                                  null
                                          ? Icons.arrow_drop_down
                                          : Icons.arrow_drop_up,
                                      controller.isFav[controller.result[index].id.toString()] == "0" ||
                                              controller.isFav[controller.result[index].id.toString()] == null
                                          ? LightMode.blackColor
                                          : LightMode.blueColor,
                                      controller.isFav[controller.result[index].id.toString()],
                                      controller.result[index].answer)

                              //  cardQuestion(
                              //     controller.faqList[index].question,
                              //     controller.faqList[index].answer,
                              //     controller.index==index
                              //     controller.isAnswer, () {
                              //   controller.index = index;
                              //   controller.change();
                              // }),
                              ),
                        ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget textFailed(controller, keyBoardType, obscure, hintText, bool iconic,
    icon, String? Function(String?)? validate, Function(String)? onChange) {
  return TextFormField(
    onChanged: onChange,
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
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3.w),
          borderSide: BorderSide(color: LightMode.blueColor),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3.w),
          borderSide: BorderSide(color: LightMode.blueColor),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3.w),
          borderSide: BorderSide(color: LightMode.blueColor),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(3.w),
          borderSide: BorderSide(color: LightMode.blueColor),
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

Widget questionText(
    height, color, title, textColor, onPress, icon, colorIcon, show, body) {
  return Container(
    margin: EdgeInsets.only(top: 2.w),
    //  padding: EdgeInsets.only(top: 2.w, bottom: 3.w, right: 5.w, left: 5.w),
    width: 100.w,
    // height: height,
    color: color,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 70.w,
              // height: 5.h,
              child: Text(
                title,
                maxLines: 2,
                style: GoogleFonts.tajawal(
                    fontSize: 3.5.w,
                    fontWeight: FontWeight.bold,
                    color: textColor),
              ),
            ),
            IconButton(
                onPressed: onPress,
                icon: Icon(
                  icon,
                  color: colorIcon,
                ))
          ],
        ),
        show == "1"
            ? Text(
                body,
                style: GoogleFonts.tajawal(
                    fontSize: 3.w,
                    fontWeight: FontWeight.w600,
                    color: LightMode.blackColor),
              )
            : const SizedBox(),
        show == "0" || show == null
            ? Divider(
                color: LightMode.blackColor,
                height: 2,
              )
            : const SizedBox()
      ],
    ),
  );
}

Widget cardQuestion(quuestion, answer, icon, height, isAnswer, onPress) {
  return SizedBox(
    width: 100.w,
    height: height,
    child: Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            quuestion,
            maxLines: 2,
            style: TextStyle(
              fontSize: 5.w,
              fontWeight: FontWeight.bold,
              color: LightMode.blueColor,
            ),
          ),
          IconButton(
              onPressed: onPress,
              icon: Icon(
                icon,
                color: LightMode.blueColor,
                size: 6.w,
              ))
        ]),
        isAnswer == true
            ? SizedBox(
                height: 2.h,
              )
            : const SizedBox(),
        isAnswer == true
            ? Text(
                answer,
                style: TextStyle(
                  fontSize: 4.w,
                  fontWeight: FontWeight.w500,
                  color: LightMode.blackColor,
                ),
              )
            : const SizedBox()
      ],
    ),
  );
}
