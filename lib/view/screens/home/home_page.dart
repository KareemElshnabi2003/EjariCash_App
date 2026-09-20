import 'package:cached_network_image/cached_network_image.dart';
import 'package:ejary_cash/controller/home/home_controller.dart';
import 'package:ejary_cash/controller/home/home_page_controller.dart';
import 'package:ejary_cash/core/constant/colors.dart';
import 'package:ejary_cash/core/constant/images.dart';
import 'package:ejary_cash/data/model/ads_model.dart';
import 'package:ejary_cash/data/model/order_info_model.dart';
import 'package:ejary_cash/generated/l10n.dart';
import 'package:ejary_cash/main.dart';
import 'package:ejary_cash/view/screens/home/ads/ads_info.dart';
import 'package:ejary_cash/view/screens/home/chat/all_chats.dart';
import 'package:ejary_cash/view/screens/home/home_page_owner.dart';
import 'package:ejary_cash/view/screens/home/notification/notification.dart';
import 'package:ejary_cash/view/screens/home/orders/make_order/main_make_order.dart';
import 'package:ejary_cash/view/screens/home/orders/orders_info.dart';
import 'package:ejary_cash/view/screens/home/monthly%20ejar/monthly_ejar_calc.dart';
import 'package:ejary_cash/view/widget/loading.dart';
import 'package:ejary_cash/view/widget/no_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomePageController homePageController = Get.put(HomePageController());
    HomeController homeController = Get.put(HomeController());
    return Container(
        height: 100.h,
        color: LightMode.whiteColor,
        child: SingleChildScrollView(
            child: sharedPreferences!.getString("typeOfUser") == "مالك"
                ? const HomePageOwner()
                : Column(children: [
                    appBarHome(S.of(context).ejariCash, () {
                      Get.to(() => const AllChats(),
                          transition: Transition.leftToRightWithFade,
                          duration: const Duration(milliseconds: 800));
                    }, () {
                      Get.to(() => const NotificationPage(),
                          transition: Transition.leftToRightWithFade,
                          duration: const Duration(milliseconds: 800));
                    }),
                    partOfEjar(() {
                      Get.to(() => const MainMakeOrder(),
                          arguments: {"price": 0},
                          transition: Transition.leftToRightWithFade,
                          duration: const Duration(milliseconds: 800));
                    }),
                    partMonthlyEjar(() {
                      Get.to(() => const MonthlyEjarCalc(),
                          transition: Transition.leftToRightWithFade,
                          duration: const Duration(milliseconds: 800));
                    }),
                    divider(),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ordersPart(
                          () {
                            homeController.changePage(2);
                          },
                          SizedBox(
                            height: 20.h,
                            width: 100.w,
                            child: FutureBuilder<List<OrderInfoModel>>(
                              initialData: homePageController.myRentes,
                              future: homePageController.getMyRents(context),
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
                                  return ListView.separated(
                                    separatorBuilder: (context, index) =>
                                        SizedBox(
                                      width: 5.w,
                                    ),
                                    itemCount: snapshot.data!.length,
                                    shrinkWrap: true,
                                    padding: EdgeInsets.zero,
                                    scrollDirection: Axis.horizontal,
                                    itemBuilder: (context, index) => InkWell(
                                      onTap: () {
                                        Get.to(
                                          () => const OrdersInfo(),
                                          arguments: {
                                            "orderInfo": snapshot.data![index]
                                          },
                                        );
                                      },
                                      child: cardOfOrder(
                                        "${snapshot.data![index].yearlyRent} ريال",
                                        () {},
                                        () {},
                                        snapshot.data![index].status ==
                                                "pending"
                                            ? S.of(context).review
                                            : snapshot.data![index].status ==
                                                    "accepted"
                                                ? S.of(context).approve
                                                : snapshot.data![index]
                                                            .status ==
                                                        "declined"
                                                    ? S.of(context).reject
                                                    : S.of(context).complete,
                                        snapshot.data![index].status ==
                                                "pending"
                                            ? LightMode.yellowColor
                                            : snapshot.data![index].status ==
                                                    "accepted"
                                                ? LightMode.greenColor
                                                : snapshot.data![index]
                                                            .status ==
                                                        "declined"
                                                    ? Colors.red
                                                    : LightMode.greycolor,
                                      ),
                                    ),
                                  );
                                }
                              },
                            ),
                          ),
                        ),
                        divider(),
                        partUnites(() {
                          homeController.changePage(1);
                        },
                            SizedBox(
                                width: 100.w,
                                height:
                                    MediaQuery.sizeOf(context).shortestSide >
                                            600
                                        ? 25.h
                                        : 19.h,
                                child: FutureBuilder<List<AdsModel>>(
                                  future:
                                      homePageController.getAllUnites(context),
                                  initialData: homePageController.allUnites,
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return loading(20.h);
                                    } else if (snapshot.hasError) {
                                      return Center(
                                          child:
                                              Text('Error: ${snapshot.error}'));
                                    } else if (!snapshot.hasData ||
                                        snapshot.data!.isEmpty) {
                                      return noData(S.of(context).noAds);
                                    } else {
                                      return ListView.separated(
                                        separatorBuilder: (context, index) =>
                                            SizedBox(
                                          width: 5.w,
                                        ),
                                        padding: EdgeInsets.zero,
                                        scrollDirection: Axis.horizontal,
                                        itemCount: snapshot.data!.length,
                                        shrinkWrap: true,
                                        itemBuilder: (context, index) => cardOfUnit(
                                            snapshot.data![index]
                                                        .productImage ==
                                                    ""
                                                ? const AssetImage(
                                                    ImagesLink.splashLogoImage)
                                                : CachedNetworkImageProvider(
                                                    snapshot.data![index]
                                                        .productImage!),
                                            snapshot.data![index].name,
                                            "${snapshot.data![index].areaName} , ${snapshot.data![index].cityName}",
                                            () {
                                          Get.to(() => const AdsInfo(),
                                              arguments: {
                                                "AdsInfo": snapshot.data![index]
                                                    .toJson()
                                              },
                                              transition: Transition
                                                  .leftToRightWithFade,
                                              duration: const Duration(
                                                  milliseconds: 800));
                                        },
                                            "${snapshot.data![index].price} ريال",
                                            "${snapshot.data![index].bathroomsNo ?? 0} ${S.of(context).bathroom}",
                                            "${snapshot.data![index].width ?? 0} ${S.of(context).m2}",
                                            "${snapshot.data![index].bedroomsNo ?? 0} ${S.of(context).room}"),
                                      );
                                    }
                                  },
                                ))),
                        // partOfProjecct(() {
                        //   Get.to(() => const AllProjects(),
                        //       arguments: {
                        //         "AllProjects": homePageController.allProjects
                        //       },
                        //       transition: Transition.leftToRightWithFade,
                        //       duration: const Duration(milliseconds: 800));
                        // },
                        //     SizedBox(
                        //         height: 70.h,
                        //         width: 100.w,
                        //         child: FutureBuilder<List<PartenerModel>>(
                        //           initialData: homePageController.allProjects,
                        //           future: homePageController
                        //               .getAllProjects(context),
                        //           builder: (context, snapshot) {
                        //             if (snapshot.connectionState ==
                        //                 ConnectionState.waiting) {
                        //               return loading(20.h);
                        //             } else if (snapshot.hasError) {
                        //               return Center(
                        //                   child:
                        //                       Text('Error: ${snapshot.error}'));
                        //             } else if (!snapshot.hasData ||
                        //                 snapshot.data!.isEmpty) {
                        //               return noData(S.of(context).noPartener);
                        //             } else {
                        //               return GridView.builder(
                        //                 shrinkWrap: true,
                        //                 gridDelegate:
                        //                     SliverGridDelegateWithFixedCrossAxisCount(
                        //                         crossAxisCount: 2,
                        //                         crossAxisSpacing: 10.w,
                        //                         mainAxisSpacing: 10.w,
                        //                         childAspectRatio: .68),
                        //                 itemBuilder: (context, index) =>
                        //                     cardOfProject(
                        //                         CachedNetworkImageProvider(
                        //                             snapshot.data![index]
                        //                                 .partnerImage!),
                        //                         snapshot.data![index].name, () {
                        //                   Get.to(() => const ProjectInfo(),
                        //                       arguments: {
                        //                         "id": snapshot.data![index].id
                        //                             .toString()
                        //                       },
                        //                       transition: Transition
                        //                           .leftToRightWithFade,
                        //                       duration: const Duration(
                        //                           milliseconds: 800));
                        //                 }),
                        //                 itemCount: snapshot.data!.length > 4
                        //                     ? 4
                        //                     : snapshot.data!.length,
                        //                 physics:
                        //                     const NeverScrollableScrollPhysics(),
                        //                 padding: EdgeInsets.zero,
                        //               );
                        //             }
                        //           },
                        //         ))),
                        SizedBox(
                          height: 20.w,
                        )
                      ],
                    ),
                  ])));
  }
}

Widget cardOwnerHomePage() {
  return Container(
    width: 100.w,
    margin: EdgeInsets.only(right: 5.w, left: 5.w, top: 5.w, bottom: 5.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 100.w,
          height: 18.h,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4.w),
              image: const DecorationImage(
                  image: AssetImage(ImagesLink.ownerCardImage),
                  fit: BoxFit.fill)),
        ),
        SizedBox(
          height: 3.w,
        ),
        Text(
          S.of(Get.context!).rentUnit,
          style: GoogleFonts.tajawal(
              color: LightMode.blackColor,
              fontSize: 5.w,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 3.w,
        ),
        Row(
          children: [
            Text(
              S.of(Get.context!).addUnit,
              style: GoogleFonts.tajawal(
                  color: LightMode.blueColor,
                  fontSize: 4.5.w,
                  fontWeight: FontWeight.w600),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: LightMode.blueColor,
              size: 6.w,
            )
          ],
        ),
      ],
    ),
  );
}

Widget partUnites(onPressShowAll, listView) {
  return Container(
    margin: EdgeInsets.only(right: 5.w, left: 5.w, bottom: 3.w),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              sharedPreferences!.getString("typeOfUser") == "مالك"
                  ? S.of(Get.context!).unitOwner
                  : S.of(Get.context!).units,
              style: GoogleFonts.tajawal(
                  color: LightMode.blackColor,
                  fontSize: sharedPreferences!.getString("typeOfUser") == "مالك"
                      ? 4.w
                      : 5.w,
                  fontWeight: FontWeight.w700),
            ),
            textClik(onPressShowAll, S.of(Get.context!).seeAll),
          ],
        ),
        listView
      ],
    ),
  );
}

Widget cardOfUnit(img, title, address, onPress, unitPrice, numOfShowerRoom,
    distence, roomNum) {
  return InkWell(
    onTap: onPress,
    child: SizedBox(
      width: 80.w,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(3.w),
            width: 80.w,
            //height: 15.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3.w),
              image: DecorationImage(image: img, fit: BoxFit.fill, opacity: .8),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      color: LightMode.whiteColor.withValues(alpha: .5),
                      width: 25.w,
                      height: 4.h,
                      child: Text(
                        unitPrice,
                        style: GoogleFonts.tajawal(
                            color: LightMode.blackColor,
                            fontSize: 3.5.w,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.tajawal(
                          shadows: [
                            Shadow(
                              color: LightMode.blackColor,
                              blurRadius: .5,
                            ),
                            Shadow(
                              color: LightMode.blackColor,
                              blurRadius: .5,
                            ),
                            Shadow(
                              color: LightMode.blackColor,
                              blurRadius: .5,
                            )
                          ],
                          color: LightMode.whiteColor,
                          fontSize: 4.w,
                          fontWeight: FontWeight.bold),
                    ),
                    Row(
                      children: [
                        Icon(Icons.location_on_outlined,
                            color: LightMode.whiteColor, size: 5.w),
                        SizedBox(
                          width: 3.w,
                        ),
                        Text(
                          address,
                          style: GoogleFonts.tajawal(
                              shadows: [
                                Shadow(
                                  color: LightMode.blackColor,
                                  blurRadius: .5,
                                ),
                                Shadow(
                                  color: LightMode.blackColor,
                                  blurRadius: .5,
                                ),
                                Shadow(
                                  color: LightMode.blackColor,
                                  blurRadius: .5,
                                )
                              ],
                              color: LightMode.whiteColor,
                              fontSize: 3.w,
                              fontWeight: FontWeight.w700),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 2.w),
          Row(
            children: [
              btnClickProject(() {}, distence, 23.w, Icons.business),
              SizedBox(
                width: 2.5.w,
              ),
              btnClickProject(
                  () {}, numOfShowerRoom, 29.w, Icons.bathroom_outlined),
              SizedBox(
                width: 2.5.w,
              ),
              btnClickProject(() {}, roomNum, 23.w, Icons.bed_outlined),
            ],
          )
        ],
      ),
    ),
  );
}

Widget partOfProjecct(onPressShowAll, listView) {
  return Container(
    margin: EdgeInsets.only(right: 5.w, left: 5.w, top: 3.w, bottom: 3.w),
    width: 100.w,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              S.of(Get.context!).parteners,
              style: GoogleFonts.tajawal(
                  color: LightMode.blackColor,
                  fontSize: 5.w,
                  fontWeight: FontWeight.w700),
            ),
            textClik(onPressShowAll, S.of(Get.context!).seeAll),
          ],
        ),
        SizedBox(
          height: 3.w,
        ),
        listView
      ],
    ),
  );
}

Widget cardOfOrder(
    yearlyPrice, onPressReject, onPressSure, typeOrder, colorOrder) {
  return SizedBox(
    width: 30.w,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(Get.context!).yearlyRent,
          style: GoogleFonts.tajawal(
              color: LightMode.blackColor.withValues(alpha: .5),
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
              color: LightMode.blackColor.withValues(alpha: .5),
              fontSize: 3.w,
              fontWeight: FontWeight.w400),
        ),
        SizedBox(
          height: 3.w,
        ),

        // change on status
        btnClickOrder(onPressReject, typeOrder, colorOrder),
        SizedBox(
          height: 3.w,
        ),
        //btnClickOrder(onPressSure, "تأكيد الهوية", LightMode.blueColor)
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

Widget cardOfProject(img, text, onPressOpen) {
  return SizedBox(
    width: 50.w,
    child: Column(
      children: [
        Container(
          width: 50.w,
          height: 30.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3.w),
            image: DecorationImage(
              image: img,
              fit: BoxFit.fill,
            ),
          ),
        ),
        SizedBox(height: 3.w),
        SizedBox(
          height: 15.w,
          width: 40.w,
          child: Text(
            text,
            maxLines: 2,
            style: TextStyle(
                overflow: TextOverflow.ellipsis,
                color: LightMode.blackColor,
                fontSize: 4.w,
                fontWeight: FontWeight.w700),
          ),
        ),
        SizedBox(height: 2.w),
        btnClickProject(onPressOpen, S.of(Get.context!).openProject, 40.w, null)
      ],
    ),
  );
}

Widget btnClickProject(onPressBTN, text, width, icon) {
  return InkWell(
    onTap: onPressBTN,
    child: Container(
      width: width,
      height: 3.5.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(2.w),
          border: Border.all(color: LightMode.blueColor),
          color: LightMode.whiteColor),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null)
            Icon(
              icon,
              color: LightMode.blueColor,
              size: 5.w,
            ),
          SizedBox(
            width: 1.w,
          ),
          Text(
            text,
            style: GoogleFonts.tajawal(
                color: LightMode.blueColor, fontSize: 3.5.w),
          ),
        ],
      ),
    ),
  );
}

Widget ordersPart(onPressShowAll, listView) {
  return Container(
    width: 100.w,
    margin: EdgeInsets.only(right: 5.w, left: 5.w, top: 2.w, bottom: 2.w),
    child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              S.of(Get.context!).orders,
              style: GoogleFonts.tajawal(
                  color: LightMode.blackColor,
                  fontSize: 5.w,
                  fontWeight: FontWeight.w700),
            ),
            textClik(onPressShowAll, S.of(Get.context!).seeAll),
          ],
        ),
        SizedBox(
          height: 3.w,
        ),
        listView
      ],
    ),
  );
}

Widget divider() {
  return Divider(
    thickness: 1.5,
    color: LightMode.blackColor,
    indent: 0,
    endIndent: 0,
  );
}

Widget partMonthlyEjar(onPressEdit) {
  return Container(
    width: 100.w,
    margin: EdgeInsets.only(right: 5.w, left: 5.w, top: 2.w, bottom: 2.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              S.of(Get.context!).rentRequest,
              style: GoogleFonts.tajawal(
                  color: LightMode.blackColor,
                  fontSize: 3.5.w,
                  fontWeight: FontWeight.w600),
            ),
            IconButton(
                onPressed: onPressEdit,
                icon: Icon(
                  Icons.edit,
                  color: LightMode.yellowColor,
                  size: 7.w,
                ))
          ],
        ),
      ],
    ),
  );
}

Widget partOfEjar(onPress) {
  return Container(
    padding: EdgeInsets.all(4.w),
    width: 100.w,
    color: LightMode.blueColor.withValues(alpha: .1),
    child: Column(
      children: [
        Row(
          children: [
            Icon(
              Icons.receipt_long_outlined,
              color: LightMode.blueColor,
              size: 7.w,
            ),
            Text(
              S.of(Get.context!).requestEjar,
              style: GoogleFonts.tajawal(
                  color: LightMode.blackColor,
                  fontSize: 5.w,
                  fontWeight: FontWeight.w700),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(right: 7.w, top: 2.w),
          child: Text(
            S.of(Get.context!).bodyRequest,
            style: GoogleFonts.tajawal(
                color: LightMode.blackColor,
                fontSize: 3.5.w,
                fontWeight: FontWeight.w500),
          ),
        ),
        btnClick(S.of(Get.context!).buttonRequest, onPress,
            LightMode.whiteColor, LightMode.blueColor, LightMode.blueColor)
      ],
    ),
  );
}

Widget btnClick(title, onPress, colorText, colorBorder, colorBackGround,
    {width}) {
  return InkWell(
    onTap: onPress,
    child: Container(
      margin: EdgeInsets.only(top: 2.w),
      width: width ?? 100.w,
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
              fontSize: 5.w, fontWeight: FontWeight.w500, color: colorText),
        ),
      ),
    ),
  );
}

Widget textClik(onPress, title) {
  return TextButton(
      onPressed: onPress,
      child: Text(
        title,
        style: GoogleFonts.tajawal(
            fontSize: 4.w,
            color: LightMode.yellowColor,
            fontWeight: FontWeight.w700),
      ));
}

Widget appBarHome(text, onPressMessage, onPressNotify) {
  return Container(
    margin: EdgeInsets.only(right: 5.w, left: 5.w, top: 5.h, bottom: 2.h),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Image.asset(
              ImagesLink.appLogo,
              width: 10.w,
            ),
            SizedBox(
              width: 3.w,
            ),
            Text(
              text,
              style: GoogleFonts.tajawal(
                  color: LightMode.blackColor,
                  fontSize: 6.w,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
        Row(
          children: [
            // IconButton(
            //     onPressed: onPressMessage,
            //     icon: Icon(
            //       Icons.messenger_outline_sharp,
            //       size: 6.w,
            //     )),
            IconButton(
                onPressed: onPressNotify,
                icon: Icon(
                  Icons.notifications_none,
                  size: 6.w,
                )),
          ],
        )
      ],
    ),
  );
}
