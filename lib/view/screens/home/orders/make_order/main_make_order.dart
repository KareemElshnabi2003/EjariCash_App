import 'package:ejary_cash/controller/home/home_controller.dart';
import 'package:ejary_cash/controller/home/orders/orders_controller.dart';
import 'package:ejary_cash/core/constant/colors.dart';
import 'package:ejary_cash/generated/l10n.dart';
import 'package:ejary_cash/view/screens/auth/register/sign_up.dart';
import 'package:ejary_cash/view/screens/home/home.dart';
import 'package:ejary_cash/view/screens/home/orders/make_order/personal_order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class MainMakeOrder extends StatelessWidget {
  const MainMakeOrder({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersController());
    HomeController homeController = Get.put(HomeController());

    return Scaffold(
      backgroundColor: LightMode.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            appBarSign(() {
              Get.back();
            }, S.of(context).requestNow),
            Container(
              width: 100.w,
              alignment: Alignment.center,
              margin: EdgeInsets.only(
                right: 5.w,
                left: 5.w,
                top: 10.w,
              ),
              child: Text(
                S.of(context).chooseTypeOrder,
                style: GoogleFonts.tajawal(
                    fontSize: 5.w,
                    fontWeight: FontWeight.bold,
                    color: LightMode.blackColor),
              ),
            ),
            SizedBox(
              height: 5.w,
            ),
            GetBuilder<OrdersController>(
              builder: (controller) => Column(
                children: [
                  // cardMakeOrder(Icons.person_pin_outlined, "من شريك ايجاري كاش",
                  //     "احصل علي وحدتك من أحد شركاء إيجاري كاش", "", () {
                  //   controller.change_1();
                  // }, controller.choose_1),
                  cardMakeOrder(
                      Icons.admin_panel_settings_outlined,
                      S.of(context).titleOrder_1,
                      S.of(context).bodyOrder_1,
                      "", () {
                    controller.change_2();
                    Get.to(() => const PersonalOrder(),
                        transition: Transition.leftToRightWithFade,
                        duration: const Duration(milliseconds: 800));
                  }, controller.choose_2),
                  cardMakeOrder(
                      Icons.qr_code_2_outlined,
                      S.of(context).titleOrder_2,
                      S.of(context).bodyOrder_2,
                      "", () {
                    controller.change_3();
                    homeController.currentIndex = 1;
                    Get.to(() => const Home(),
                        transition: Transition.leftToRightWithFade,
                        duration: const Duration(milliseconds: 800));
                  }, controller.choose_3),
                  SizedBox(
                    height: 5.w,
                  ),
                  // btnClick(S.of(context).next, () {
                  //   if (controller.index == 0) {
                  //   } else if (controller.index == 1) {

                  //   } else if (controller.index == 2) {

                  //   } else {}
                  // }, LightMode.whiteColor, LightMode.blueColor,
                  //     LightMode.blueColor),
                  SizedBox(
                    height: 5.w,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget cardMakeOrder(icon, title, body, textClick, onPress, choose) {
  return InkWell(
    onTap: onPress,
    child: Container(
      width: 100.w,
      margin: EdgeInsets.only(right: 5.w, left: 5.w, top: 5.w),
      decoration: BoxDecoration(
          border: Border.all(
              color: choose == true
                  ? LightMode.blueColor
                  : LightMode.whiteBlueColor),
          borderRadius: BorderRadius.circular(3.w),
          color: LightMode.whiteBlueColor),
      child: Column(
        children: [
          SizedBox(
            height: 5.w,
          ),
          Icon(
            icon,
            size: 6.w,
            color: LightMode.blackColor,
          ),
          SizedBox(
            height: 5.w,
          ),
          Text(
            title,
            style: GoogleFonts.tajawal(
                fontSize: 5.w,
                fontWeight: FontWeight.bold,
                color: LightMode.blackColor),
          ),
          SizedBox(
            height: 5.w,
          ),
          SizedBox(
            width: 70.w,
            child: Text(
              body,
              textAlign: TextAlign.center,
              style: GoogleFonts.tajawal(
                  fontSize: 4.w,
                  fontWeight: FontWeight.w500,
                  color: LightMode.blackColor),
            ),
          ),
          textClick == ""
              ? const SizedBox()
              : Text(
                  textClick,
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      decorationColor: LightMode.yellowColor,
                      fontSize: 4.w,
                      fontWeight: FontWeight.w500,
                      color: LightMode.yellowColor),
                ),
          SizedBox(
            height: 5.w,
          ),
        ],
      ),
    ),
  );
}
