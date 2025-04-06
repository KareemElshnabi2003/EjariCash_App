import 'package:ejary_cash/controller/home/home_controller.dart';
import 'package:ejary_cash/controller/home/orders/order_ejar_controller.dart';
import 'package:ejary_cash/core/constant/colors.dart';
import 'package:ejary_cash/data/model/order_info_model.dart';
import 'package:ejary_cash/generated/l10n.dart';
import 'package:ejary_cash/main.dart';
import 'package:ejary_cash/view/screens/home/orders/orders_info.dart';
import 'package:ejary_cash/view/screens/home/orders/orders_owner.dart';
import 'package:ejary_cash/view/widget/loading.dart';
import 'package:ejary_cash/view/widget/no_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class Orders extends StatelessWidget {
  const Orders({super.key});

  @override
  Widget build(BuildContext context) {
    OrderEjarController orderEjarController = Get.put(OrderEjarController());
    HomeController controller = Get.put(HomeController());
    return sharedPreferences!.getString("typeOfUser") == "مالك"
        ? const OrdersOwner()
        : Container(
            height: 100.h,
            color: LightMode.whiteColor,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  appBarOrders(() {
                    controller.changePage(0);
                  }, S.of(context).orders),
                  Container(
                      width: 100.w,
                      height: 80.h,
                      margin: EdgeInsets.only(
                        right: 5.w,
                        left: 5.w,
                        top: 5.w,
                      ),
                      child: FutureBuilder<List<OrderInfoModel>>(
                        initialData: orderEjarController.allRents,
                        future: orderEjarController.getMyRents(context),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return loading(20.h);
                          } else if (snapshot.hasError) {
                            return Center(
                                child: Text('Error: ${snapshot.error}'));
                          } else if (!snapshot.hasData ||
                              snapshot.data!.isEmpty) {
                            return noData(S.of(context).noOrders);
                          } else {
                            return GridView.builder(
                              padding: EdgeInsets.zero,
                              itemCount: orderEjarController.allRents.length,
                              shrinkWrap: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      crossAxisSpacing: 5.w,
                                      mainAxisSpacing: 5.w,
                                      childAspectRatio: .7),
                              itemBuilder: (context, index) => InkWell(
                                onTap: () {
                                  Get.to(() => const OrdersInfo(),
                                      arguments: {
                                        "orderInfo":
                                            orderEjarController.allRents[index]
                                      },
                                      transition:
                                          Transition.leftToRightWithFade,
                                      duration:
                                          const Duration(milliseconds: 800));
                                },
                                child: partOfOrder(
                                  "#${orderEjarController.allRents[index].id}",
                                  "${orderEjarController.allRents[index].yearlyRent} ريال",
                                  () {},
                                  () {},
                                  orderEjarController.allRents[index].status ==
                                          "pending"
                                      ? S.of(context).review
                                      : orderEjarController
                                                  .allRents[index].status ==
                                              "accepted"
                                          ? S.of(context).approve
                                          : orderEjarController
                                                      .allRents[index].status ==
                                                  "declined"
                                              ? S.of(context).reject
                                              : S.of(context).complete,
                                  orderEjarController.allRents[index].status ==
                                          "pending"
                                      ? LightMode.yellowColor
                                      : orderEjarController
                                                  .allRents[index].status ==
                                              "accepted"
                                          ? LightMode.greenColor
                                          : orderEjarController
                                                      .allRents[index].status ==
                                                  "declined"
                                              ? Colors.red
                                              : LightMode.greycolor,
                                ),
                              ),
                            );
                          }
                        },
                      )),
                ],
              ),
            ),
          );
  }
}

Widget partOfOrder(numOfOrder, yearlyPrice, onPressReject, onPressSure,
    orderType, orderColor) {
  return Column(
    children: [
      Text(
        "${S.of(Get.context!).numOfOrder} $numOfOrder",
        style: GoogleFonts.tajawal(
            color: LightMode.yellowColor,
            fontSize: 4.w,
            fontWeight: FontWeight.w400),
      ),
      SizedBox(
        height: 3.w,
      ),
      cardOfOrder(
          yearlyPrice, onPressReject, onPressSure, orderType, orderColor)
    ],
  );
}

Widget cardOfOrder(
    yearlyPrice, onPressReject, onPressSure, orderType, orderColor) {
  return SizedBox(
    width: 30.w,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(Get.context!).yearlyRent,
          style: GoogleFonts.tajawal(
              color: LightMode.blackColor.withOpacity(.5),
              fontSize: 3.5.w,
              fontWeight: FontWeight.w400),
        ),
        SizedBox(
          height: 2.w,
        ),
        Text(
          yearlyPrice,
          style: GoogleFonts.tajawal(
              color: LightMode.blackColor,
              fontSize: 4.w,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 3.w,
        ),
        Text(
          S.of(Get.context!).statusContract,
          style: GoogleFonts.tajawal(
              color: LightMode.blackColor.withOpacity(.5),
              fontSize: 3.w,
              fontWeight: FontWeight.w400),
        ),
        SizedBox(
          height: 3.w,
        ),
        //change about status
        btnClickOrder(onPressReject, orderType, orderColor),
        // SizedBox(
        //   height: 3.w,
        // ),
        //  btnClickOrder(onPressSure, "تأكيد الهوية", LightMode.blueColor)
      ],
    ),
  );
}

Widget btnClickOrder(onPressBTN, text, color) {
  return Container(
    width: 25.w,
    height: 4.h,
    decoration: BoxDecoration(color: color),
    alignment: Alignment.center,
    child: Text(text,
        style:
            GoogleFonts.tajawal(color: LightMode.blackColor, fontSize: 3.5.w)),
  );
}

Widget appBarOrders(onPressBack, text) {
  return Container(
    margin: EdgeInsets.only(top: 5.h, right: 7.w, left: 7.w),
    child: Row(
      children: [
        InkWell(
          onTap: onPressBack,
          child: Container(
            width: 10.w,
            height: 7.w,
            decoration: BoxDecoration(
                gradient: LinearGradient(colors: [
                  LightMode.blueColor,
                  LightMode.blueColor.withOpacity(.8),
                ]),
                borderRadius: BorderRadius.circular(3.w),
                color: LightMode.blueColor),
            child: Icon(
              Icons.arrow_back,
              size: 6.w,
              color: LightMode.whiteColor,
            ),
          ),
        ),
        SizedBox(
          width: 3.w,
        ),
        Container(
          height: 7.w,
          alignment: Alignment.center,
          child: Text(
            text,
            style: GoogleFonts.tajawal(
                fontSize: 6.w,
                fontWeight: FontWeight.bold,
                color: LightMode.blackColor),
          ),
        )
      ],
    ),
  );
}
