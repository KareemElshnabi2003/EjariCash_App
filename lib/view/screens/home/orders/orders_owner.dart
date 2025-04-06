import 'package:ejary_cash/controller/home/home_controller.dart';
import 'package:ejary_cash/controller/home/orders/orders_owner_controller.dart';
import 'package:ejary_cash/core/class/status_request.dart';
import 'package:ejary_cash/core/constant/colors.dart';
import 'package:ejary_cash/generated/l10n.dart';
import 'package:ejary_cash/main.dart';
import 'package:ejary_cash/view/screens/home/orders/orders.dart';
import 'package:ejary_cash/view/widget/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class OrdersOwner extends StatelessWidget {
  const OrdersOwner({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersOwnerController());
    HomeController homeController = Get.put(HomeController());

    return Container(
      width: 100.w,
      height: 100.h,
      color: LightMode.whiteColor.withOpacity(.9),
      child: Container(
        margin: EdgeInsets.only(right: 5.w, left: 5.w, bottom: 10.w),
        width: 100.w,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              appBarOrders(() {
                homeController.changePage(0);
              }, S.of(context).orders),

              SizedBox(
                height: 10.w,
              ),
              Text(
                S.of(context).adsManage,
                style: GoogleFonts.tajawal(
                    fontSize: 5.w,
                    fontWeight: FontWeight.w700,
                    color: LightMode.blackColor),
              ),
              SizedBox(
                height: 5.w,
              ),
              GetBuilder<OrdersOwnerController>(
                builder: (controller) => controller.statuesRequest ==
                        StatuesRequest.loading
                    ? loading(80.h)
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          cardOrderPage(
                              Icons.campaign_outlined,
                              false,
                              S.of(context).ads,
                              sharedPreferences!.getString("countAds") ?? "0"),
                          cardOrderPage(
                              Icons.visibility,
                              false,
                              S.of(context).views,
                              sharedPreferences!.getString("view") ?? "0"),
                          cardOrderPage(
                              Icons.favorite,
                              true,
                              S.of(context).favourites,
                              sharedPreferences!.getString("fav") ?? "0"),
                        ],
                      ),
              ),
              SizedBox(
                height: 10.w,
              ),
              // Text(
              //   "العقود",
              //   style: GoogleFonts.tajawal(
              //       fontSize: 5.w,
              //       fontWeight: FontWeight.w700,
              //       color: LightMode.blackColor),
              // ),
              // SizedBox(
              //   height: 7.w,
              // ),
              // SizedBox(
              //     width: 100.w,
              //     height: 25.h,
              //     child: noData("لا يوجد عقود حاليا"))
            ],
          ),
        ),
      ),
    );
  }
}

Widget cardOrderPage(icon, fav, text, number) {
  return Container(
    width: 28.w,
    height: 30.w,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          3.w,
        ),
        color: LightMode.whiteColor,
        border: Border.all(color: LightMode.blackColor.withOpacity(.1))),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Icon(
          icon,
          color: fav == false ? LightMode.blueColor : Colors.red,
          size: 6.w,
        ),
        Text(
          text,
          style: GoogleFonts.tajawal(
              fontSize: 4.w,
              fontWeight: FontWeight.w700,
              color: LightMode.blackColor),
        ),
        Text(
          "$number",
          style: GoogleFonts.tajawal(
              fontSize: 4.w,
              fontWeight: FontWeight.w700,
              color: LightMode.yellowColor),
        ),
      ],
    ),
  );
}
