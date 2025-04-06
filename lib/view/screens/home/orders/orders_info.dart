import 'package:ejary_cash/controller/home/orders/order_info_controller.dart';
import 'package:ejary_cash/core/constant/colors.dart';
import 'package:ejary_cash/generated/l10n.dart';
import 'package:ejary_cash/view/screens/auth/register/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class OrdersInfo extends StatelessWidget {
  const OrdersInfo({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderInfoController());
    return Scaffold(
      backgroundColor: LightMode.whiteColor,
      body: GetBuilder<OrderInfoController>(
        builder: (controller) => SingleChildScrollView(
          child: Column(
            children: [
              appBarSign(() {
                Get.back();
              }, S.of(context).orderInfo),
              SizedBox(
                height: 5.w,
              ),
              rowInfo("${S.of(context).numOfOrder} : ",
                  "#${controller.orderInfoModel!.id}", LightMode.blueColor, 1),
              rowInfo(
                  "${S.of(context).statusOfOrder}: ",
                  controller.orderInfoModel!.status == "pending"
                      ? S.of(context).review
                      : controller.orderInfoModel!.status == "accepted"
                          ? S.of(context).approve
                          : controller.orderInfoModel!.status == "declined"
                              ? S.of(context).reject
                              : S.of(context).complete,
                  controller.orderInfoModel!.status == "pending"
                      ? LightMode.yellowColor
                      : controller.orderInfoModel!.status == "accepted"
                          ? LightMode.greenColor
                          : controller.orderInfoModel!.status == "declined"
                              ? Colors.red
                              : LightMode.greycolor,
                  1),
              if (controller.orderInfoModel!.notes != null)
                rowInfo("${S.of(context).descripe} : ",
                    controller.orderInfoModel!.notes, LightMode.blueColor, 2),
              if (controller.orderInfoModel!.paymentPlan != null)
                rowInfo(
                    "${S.of(context).paymentPlan}  : ",
                    controller.orderInfoModel!.paymentPlan == "1"
                        ? "دفعة واحدة"
                        : "دفعتان",
                    LightMode.blueColor,
                    1),
              if (controller.orderInfoModel!.yearlyRent != null)
                rowInfo(
                    "${S.of(context).yearlyRent}  : ",
                    controller.orderInfoModel!.yearlyRent.toString(),
                    LightMode.blueColor,
                    1),
              if (controller.orderInfoModel!.yearlyRent != null)
                rowInfo(
                    "${S.of(context).monthlyRent} : ",
                    "${(controller.orderInfoModel!.yearlyRent! + (controller.orderInfoModel!.yearlyRent! / 5)) / 12}",
                    LightMode.blueColor,
                    1),
              if (controller.orderInfoModel!.location != null)
                rowInfo(
                    "${S.of(context).location} : ",
                    controller.orderInfoModel!.location,
                    LightMode.blueColor,
                    2),
              if (controller.orderInfoModel!.areaName != null)
                rowInfo(
                    "${S.of(context).area} : ",
                    controller.orderInfoModel!.areaName,
                    LightMode.blueColor,
                    1),
              if (controller.orderInfoModel!.cityName != null)
                rowInfo(
                    "${S.of(context).city} : ",
                    controller.orderInfoModel!.cityName,
                    LightMode.blueColor,
                    1),
              if (controller.orderInfoModel!.name != null)
                rowInfo("${S.of(context).nameOfRenter} : ",
                    controller.orderInfoModel!.name, LightMode.blueColor, 1),
              if (controller.orderInfoModel!.mobile != null)
                rowInfo(
                    "${S.of(context).phone} : ",
                    "${controller.orderInfoModel!.mobile}",
                    LightMode.blueColor,
                    1),
              if (controller.orderInfoModel!.email != null)
                rowInfo(
                    "${S.of(context).email} : ",
                    "${controller.orderInfoModel!.email}",
                    LightMode.blueColor,
                    2),
              if (controller.orderInfoModel!.brokerName != null)
                rowInfo(
                    "${S.of(context).ownerName} : ",
                    "${controller.orderInfoModel!.brokerName}",
                    LightMode.blueColor,
                    1),
              if (controller.orderInfoModel!.brokerWhatsappPhone != null)
                rowInfo(
                    "${S.of(context).ownerPhone} : ",
                    "${controller.orderInfoModel!.brokerWhatsappPhone}",
                    LightMode.blueColor,
                    1),
              if (controller.orderInfoModel!.createdAt != null)
                rowInfo(
                    "${S.of(context).date}  : ",
                    DateFormat('d/M/yyyy').format(
                        DateTime.parse(controller.orderInfoModel!.createdAt!)),
                    LightMode.blueColor,
                    1),
              if (controller.orderInfoModel!.createdAt != null)
                rowInfo(
                    "${S.of(context).time}  : ",
                    DateFormat('hh:mm a').format(
                        DateTime.parse(controller.orderInfoModel!.createdAt!)),
                    LightMode.blueColor,
                    1),
            ],
          ),
        ),
      ),
    );
  }
}

Widget rowInfo(title, body, colorBody, lines) {
  return Container(
    margin: EdgeInsets.only(right: 5.w, left: 5.w, top: 3.w),
    child: Row(
      children: [
        SizedBox(
          height: lines > 1 ? 10.h : null,
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: GoogleFonts.tajawal(
                fontSize: 4.5.w,
                fontWeight: FontWeight.bold,
                color: LightMode.blackColor),
          ),
        ),
        SizedBox(
          width: 3.w,
        ),
        SizedBox(
          height: lines > 1 ? 10.h : null,
          width: lines > 1 ? 50.w : null,
          child: Text(
            maxLines: lines,
            body,
            style: GoogleFonts.tajawal(
                fontSize: 5.w, fontWeight: FontWeight.w500, color: colorBody),
          ),
        )
      ],
    ),
  );
}
