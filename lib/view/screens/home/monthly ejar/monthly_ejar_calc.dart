import 'package:ejary_cash/controller/home/monthlyejar/monthly_ejar_calc_controller.dart';
import 'package:ejary_cash/core/constant/colors.dart';
import 'package:ejary_cash/generated/l10n.dart';
import 'package:ejary_cash/view/screens/auth/register/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class MonthlyEjarCalc extends StatelessWidget {
  const MonthlyEjarCalc({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MonthlyEjarCalcController());
    return Scaffold(
      backgroundColor: LightMode.whiteColor,
      body: SizedBox(
        width: 100.w,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              appBarSign(() {
                Get.back();
              }, S.of(context).computeMonthlyEjar),
              GetBuilder<MonthlyEjarCalcController>(
                builder: (controller) => Form(
                  key: controller.formGlobalKey,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 3.w, bottom: 3.w),
                        margin:
                            EdgeInsets.only(top: 5.w, right: 7.w, left: 7.w),
                        color: LightMode.fillTextFieldColor,
                        height: 20.w,
                        child: textFailed(
                          controller.monthlySalaryController,
                          TextInputType.number,
                          S.of(context).monthlySalary,
                          (val) {
                            return controller.monthSalleryValidate(val!);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 3.w,
                      ),
                      dropDowenList(S.of(context).typeOfJob, controller.typeJop,
                          controller.typeJopList, (val) {
                        controller.changeValJop(val);
                      }),
                      SizedBox(
                        height: 3.w,
                      ),
                      dropDowenList(
                          S.of(context).education,
                          controller.education,
                          controller.educationList, (val) {
                        controller.changeValeducation(val);
                      }),
                      Container(
                        padding: EdgeInsets.only(top: 3.w, bottom: 3.w),
                        margin:
                            EdgeInsets.only(top: 5.w, right: 7.w, left: 7.w),
                        color: LightMode.fillTextFieldColor,
                        height: 20.w,
                        child: textFailed(
                          controller.monthlyDemandsController,
                          TextInputType.text,
                          S.of(context).monthlyObligations,
                          (val) {
                            return controller.monthlyDemandsValidate(val!);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 3.w,
                      ),
                      radioButton(S.of(context).nationality,
                          S.of(context).saudi, S.of(context).resident, (val) {
                        controller.changeTytpe_1(val);
                      }, (val) {
                        controller.changeTytpe_1(val);
                      }, controller.type1),
                      Container(
                        padding: EdgeInsets.only(top: 3.w, bottom: 3.w),
                        margin:
                            EdgeInsets.only(top: 5.w, right: 7.w, left: 7.w),
                        color: LightMode.fillTextFieldColor,
                        height: 20.w,
                        child: textFailed(
                          controller.ageController,
                          TextInputType.number,
                          S.of(context).age,
                          (val) {
                            return controller.ageeValidate(val!);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 3.w,
                      ),
                      radioButton(S.of(context).marriage, S.of(context).yes,
                          S.of(context).no, (val) {
                        controller.changeTytpe_2(val);
                      }, (val) {
                        controller.changeTytpe_2(val);
                      }, controller.type2),
                      Container(
                        padding: EdgeInsets.only(top: 3.w, bottom: 3.w),
                        margin:
                            EdgeInsets.only(top: 5.w, right: 7.w, left: 7.w),
                        color: LightMode.fillTextFieldColor,
                        height: 20.w,
                        child: textFailed(
                          controller.numOfFamilyController,
                          TextInputType.number,
                          S.of(context).countOfFamily,
                          (val) {
                            return controller.numOfFamilyValidate(val!);
                          },
                        ),
                      ),
                      SizedBox(
                        height: 7.w,
                      ),
                      btnClick(S.of(context).next, () {
                        controller.computeMonthluEjar(context);
                      }, LightMode.whiteColor, LightMode.blueColor,
                          LightMode.blueColor),
                      SizedBox(
                        height: 7.w,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget radioButton(title, value1, value2, Function(String?)? onChanged1,
    Function(String?)? onChanged2, type) {
  return Container(
    margin: EdgeInsets.only(right: 7.w, left: 7.w, top: 2.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style:
              GoogleFonts.tajawal(fontSize: 5.w, fontWeight: FontWeight.w700),
        ),
        Row(
          children: [
            SizedBox(
              width: 30.w,
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
                        fontSize: 3.5.w, fontWeight: FontWeight.w700),
                  )
                ],
              ),
            ),
            SizedBox(
              width: 30.w,
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

Widget dropDowenList(
    title, value, List valueList, Function(Object?)? onChange) {
  return Container(
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

Widget textFailed(
    controller, keyBoardType, hintText, String? Function(String?)? validate) {
  return TextFormField(
    validator: validate,
    autovalidateMode: AutovalidateMode.onUserInteraction,
    controller: controller,
    keyboardType: keyBoardType,
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
    ),
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
