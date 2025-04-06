// import 'package:ejary_cash/controller/home/orders/orders_controller.dart';
// import 'package:ejary_cash/core/constant/colors.dart';
// import 'package:ejary_cash/data/model/partener_model.dart';
// import 'package:ejary_cash/view/screens/auth/register/sign_up.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:screen_go/extensions/responsive_nums.dart';

// class PartenerOrder extends StatelessWidget {
//   const PartenerOrder({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: LightMode.whiteColor,
//         body: SingleChildScrollView(
//           child: Column(
//             children: [
//               appBarSign(() {
//                 Get.back();
//               }, "طلب الآن"),
//               GetBuilder<OrdersController>(
//                 builder: (controller) => Form(
//                     key: controller.partenerRentKey,
//                     child: Column(
//                       children: [
//                         dropDowenList(
//                             "شريك إيجاري كاش",
//                             controller.partenerController,
//                             controller.partenerEjar, (val) {
//                           controller.changePartener(val);
//                         }, controller.partenerId),
//                         Container(
//                           padding: EdgeInsets.only(top: 3.w, bottom: 3.w),
//                           margin:
//                               EdgeInsets.only(top: 5.w, right: 7.w, left: 7.w),
//                           color: LightMode.fillTextFieldColor,
//                           height: 20.w,
//                           child: textFailed(
//                               controller.yearelyRentController,
//                               TextInputType.number,
//                               false,
//                               "الإيجار السنوي",
//                               false,
//                               null, (val) {
//                             if (!val!.isNum) {
//                               return "الرجاء ادخال السعر بشكل صحيح";
//                             } else {
//                               return null;
//                             }
//                           }, true),
//                         ),
//                         Container(
//                           padding: EdgeInsets.only(top: 3.w, bottom: 3.w),
//                           margin:
//                               EdgeInsets.only(top: 5.w, right: 7.w, left: 7.w),
//                           color: LightMode.fillTextFieldColor,
//                           height: 20.w,
//                           child: textFailed(
//                               controller.notesController,
//                               TextInputType.text,
//                               false,
//                               "ملاحظات",
//                               false,
//                               null, (val) {
//                             return null;
//                           }, true),
//                         ),
//                         Container(
//                           padding: EdgeInsets.only(top: 3.w, bottom: 3.w),
//                           margin:
//                               EdgeInsets.only(top: 5.w, right: 7.w, left: 7.w),
//                           color: LightMode.fillTextFieldColor,
//                           height: 20.w,
//                           child: textFailed(
//                               controller.linkLocationController,
//                               TextInputType.url,
//                               false,
//                               "الموقع",
//                               false,
//                               null, (val) {
//                             if (!val!.isURL) {
//                               return "الرجاء ادخال رابط الموقع بشكل صحيح";
//                             } else {
//                               return null;
//                             }
//                           }, true),
//                         ),
//                         InkWell(
//                           onTap: () {
//                             controller.selectDate(context);
//                           },
//                           child: Container(
//                             padding: EdgeInsets.only(top: 3.w, bottom: 3.w),
//                             margin: EdgeInsets.only(
//                                 top: 5.w, right: 7.w, left: 7.w),
//                             color: LightMode.fillTextFieldColor,
//                             height: 20.w,
//                             child: textFailed(
//                                 controller.dateOfMoveController,
//                                 TextInputType.text,
//                                 false,
//                                 "تاريخ الإنتقال dd-mm-yy",
//                                 false,
//                                 null, (val) {
//                               return null;
//                             }, false),
//                           ),
//                         ),
//                         SizedBox(
//                           height: 30.w,
//                         ),
//                         btnClick("تفديم الطلب", () {
//                           //validate  dont forget
//                           // sharedPreferences!.clear();
//                           controller.rentPartener(context);
//                         }, LightMode.whiteColor, LightMode.blueColor,
//                             LightMode.blueColor),
//                         SizedBox(
//                           height: 10.w,
//                         ),
//                       ],
//                     )),
//               )
//             ],
//           ),
//         ));
//   }
// }

// Widget dropDowenList(title, value, List<PartenerModel> valueList,
//     Function(Object?)? onChange, locationId) {
//   return Container(
//     margin: EdgeInsets.only(top: 5.w),
//     height: 20.w,
//     width: 86.w,
//     padding: const EdgeInsets.all(5),
//     color: LightMode.fillTextFieldColor,
//     child: DropdownButtonHideUnderline(
//       child: ButtonTheme(
//         alignedDropdown: true,
//         child: DropdownButton(
//           style: GoogleFonts.tajawal(
//               fontSize: 3.5.w,
//               fontWeight: FontWeight.w500,
//               color: LightMode.blueColor),
//           icon: const Icon(Icons.arrow_drop_down_sharp),
//           borderRadius: const BorderRadius.all(Radius.circular(25)),
//           iconDisabledColor: LightMode.blueColor,
//           iconEnabledColor: LightMode.blueColor,
//           menuMaxHeight: 25.h,
//           hint: Text(
//             title,
//             textAlign: TextAlign.end,
//             textDirection: TextDirection.rtl,
//             style: GoogleFonts.tajawal(
//                 fontSize: 3.5.w,
//                 fontWeight: FontWeight.w500,
//                 color: LightMode.blueColor),
//           ),
//           value: value,
//           dropdownColor: LightMode.whiteColor,
//           items: [
//             ...List.generate(
//               valueList.length,
//               (index) => DropdownMenuItem(
//                   onTap: () {
//                     OrdersController controller = Get.put(OrdersController());
//                     controller.partenerId = valueList[index].id!;
//                     Get.appUpdate();
//                   },
//                   value: valueList[index].name,
//                   child: Text(valueList[index].name!,
//                       style: GoogleFonts.tajawal(
//                           fontSize: 3.5.w,
//                           fontWeight: FontWeight.w500,
//                           color: LightMode.blueColor))),
//             )
//           ],
//           onChanged: onChange,
//         ),
//       ),
//     ),
//   );
// }

// Widget textFailed(controller, keyBoardType, obscure, hintText, bool iconic,
//     icon, String? Function(String?)? validate, enabel) {
//   return TextFormField(
//     validator: validate,
//     autovalidateMode: AutovalidateMode.onUserInteraction,
//     controller: controller,
//     keyboardType: keyBoardType,
//     enabled: enabel,
//     obscureText: obscure,
//     style: GoogleFonts.tajawal(
//         fontSize: 5.w, fontWeight: FontWeight.w700, color: LightMode.blueColor),
//     decoration: InputDecoration(
//         contentPadding: EdgeInsets.only(
//           bottom: 5.w,
//           right: 5.w,
//           left: 5.w,
//         ),
//         border: const OutlineInputBorder(
//           borderSide: BorderSide.none,
//         ),
//         enabledBorder: const OutlineInputBorder(
//           borderSide: BorderSide.none,
//         ),
//         disabledBorder: const OutlineInputBorder(
//           borderSide: BorderSide.none,
//         ),
//         filled: false,
//         fillColor: LightMode.fillTextFieldColor,
//         labelText: hintText,
//         labelStyle: GoogleFonts.tajawal(
//             fontSize: 5.w,
//             fontWeight: FontWeight.w700,
//             color: LightMode.blueColor.withOpacity(.5)),
//         suffixIcon: iconic == true ? icon : null,
//         suffixIconColor: LightMode.blueColor),
//   );
// }
