import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ejary_cash/controller/home/ads/ads_controller.dart';
import 'package:ejary_cash/controller/home/favourite/favourite_controller.dart';
import 'package:ejary_cash/controller/home/home_controller.dart';
import 'package:ejary_cash/core/constant/colors.dart';
import 'package:ejary_cash/core/constant/images.dart';
import 'package:ejary_cash/data/model/ads_model.dart';
import 'package:ejary_cash/generated/l10n.dart';
import 'package:ejary_cash/main.dart';
import 'package:ejary_cash/view/screens/home/ads/ads_info.dart';
import 'package:ejary_cash/view/screens/home/ads/ads_page_owner.dart';
import 'package:ejary_cash/view/screens/home/favourite/favourite.dart';
import 'package:ejary_cash/view/widget/loading.dart';
import 'package:ejary_cash/view/widget/no_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class AdsPage extends StatelessWidget {
  const AdsPage({super.key});

  @override
  Widget build(BuildContext context) {
    AdsController controller = Get.put(AdsController());
    Get.put(FavouriteController());

    HomeController homeController = Get.put(HomeController());
    return Container(
      width: 100.w,
      height: 100.h,
      color: LightMode.whiteColor,
      child: SingleChildScrollView(
        child: sharedPreferences!.getString("typeOfUser") == "مالك"
            ? const AdsPageOwner()
            : Column(
                children: [
                  appBarAds(() {
                    // sharedPreferences!.clear();
                    homeController.changePage(0);
                  }, () {
                    //onPressFav
                    Get.off(() => const Favourite(),
                        transition: Transition.leftToRightWithFade,
                        duration: const Duration(milliseconds: 800));
                  }, () {
                    //onPressFilter
                    controller.messageFilterAds();
                  }, () {
                    //onPressMap
                  }),
                  SizedBox(
                    height: 3.w,
                  ),
                  GetBuilder<AdsController>(
                    builder: (controller) => controller.filter == true
                        ? InkWell(
                            onTap: () {
                              controller.filter = false;
                              controller.type = '';
                              controller.maxController.clear();
                              controller.minController.clear();
                              controller.numOfRoome = 0;
                              controller.update();
                            },
                            child: Text(
                              S.of(context).cancelFilter,
                              style: TextStyle(
                                  color: LightMode.blueColor,
                                  fontSize: 4.w,
                                  fontWeight: FontWeight.w600),
                            ))
                        : const SizedBox(),
                  ),
                  controller.filter
                      ? Container(
                          margin: EdgeInsets.only(
                              right: 5.w, left: 5.w, bottom: 10.w),
                          width: 100.w,
                          height: 82.h,
                          child: FutureBuilder<List<AdsModel>>(
                            initialData: controller.filterAds,
                            future: controller.getFilterAds(context),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return loading(20.h);
                              } else if (snapshot.hasError) {
                                return Center(
                                    child: Text('Error: ${snapshot.error}'));
                              } else if (!snapshot.hasData ||
                                  snapshot.data!.isEmpty) {
                                return noData(S.of(context).noAds);
                              } else {
                                return ListView.separated(
                                  padding: EdgeInsets.only(bottom: 10.w),
                                  itemCount: snapshot.data!.length,
                                  separatorBuilder: (context, index) =>
                                      SizedBox(
                                    height: 5.w,
                                  ),
                                  itemBuilder: (context, index) =>
                                      GetBuilder<FavouriteController>(
                                    builder: (favcontroller) => cardOfUnit(
                                        CachedNetworkImageProvider(snapshot
                                            .data![index].productImage!),
                                        snapshot.data![index].name,
                                        "${snapshot.data![index].areaName ?? "لم يتم التحديد"} , ${snapshot.data![index].cityName ?? "لم يتم التحديد"}",
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
                                        "${snapshot.data![index].bathroomsNo ?? 0} ${S.of(context)..bathroom}",
                                        "${snapshot.data![index].width ?? 0} ${S.of(context).m2}",
                                        "${snapshot.data![index].bedroomsNo ?? 0} ${S.of(context).room}",
                                        favcontroller.isFav[snapshot
                                            .data![index].id
                                            .toString()],
                                        () {
                                          if (favcontroller.isFav[snapshot
                                                      .data![index].id
                                                      .toString()] ==
                                                  "0" ||
                                              favcontroller.isFav[snapshot
                                                      .data![index].id
                                                      .toString()] ==
                                                  null) {
                                            favcontroller.setFavourite(
                                                snapshot.data![index].id
                                                    .toString(),
                                                "1");
                                            favcontroller.addFavouriteItems(
                                                context,
                                                snapshot.data![index].id
                                                    .toString());
                                          } else {
                                            favcontroller.setFavourite(
                                                snapshot.data![index].id
                                                    .toString(),
                                                "0");
                                            favcontroller.removeFavouriteItems(
                                                context,
                                                snapshot.data![index].id
                                                    .toString());
                                          }
                                        }),
                                  ),
                                );
                              }
                            },
                          ))
                      : Container(
                          margin: EdgeInsets.only(right: 5.w, left: 5.w),
                          width: 100.w,
                          height: 82.h,
                          child: FutureBuilder<List<AdsModel>>(
                            initialData: controller.allAds,
                            future: controller.getAllAds(context),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return loading(20.h);
                              } else if (snapshot.hasError) {
                                return Center(
                                    child: Text('Error: ${snapshot.error}'));
                              } else if (!snapshot.hasData ||
                                  snapshot.data!.isEmpty) {
                                return noData(S.of(context).noAds);
                              } else {
                                return ListView.separated(
                                  padding: EdgeInsets.only(bottom: 20.w),
                                  itemCount: snapshot.data!.length,
                                  separatorBuilder: (context, index) =>
                                      SizedBox(
                                    height: 5.w,
                                  ),
                                  itemBuilder: (context, index) =>
                                      GetBuilder<FavouriteController>(
                                    builder: (favcontroller) => cardOfUnit(
                                        snapshot.data![index].productImage == ""
                                            ? const AssetImage(
                                                ImagesLink.splashLogoImage)
                                            : CachedNetworkImageProvider(
                                                snapshot.data![index]
                                                    .productImage!),
                                        snapshot.data![index].name,
                                        "${snapshot.data![index].areaName ?? S.of(context).notMark} , ${snapshot.data![index].cityName ?? S.of(context).notMark}",
                                        () {
                                          log(sharedPreferences!
                                              .getString("token")!);
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
                                        "${snapshot.data![index].bathroomsNo ?? 0}  ${S.of(context).bathroom}",
                                        "${snapshot.data![index].width ?? 0} ${S.of(context).m2}",
                                        "${snapshot.data![index].bedroomsNo ?? 0} ${S.of(context).room}",
                                        favcontroller.isFav[snapshot
                                            .data![index].id
                                            .toString()],
                                        () {
                                          if (favcontroller.isFav[snapshot
                                                      .data![index].id
                                                      .toString()] ==
                                                  "0" ||
                                              favcontroller.isFav[snapshot
                                                      .data![index].id
                                                      .toString()] ==
                                                  null) {
                                            favcontroller.setFavourite(
                                                snapshot.data![index].id
                                                    .toString(),
                                                "1");
                                            favcontroller.addFavouriteItems(
                                                context,
                                                snapshot.data![index].id
                                                    .toString());
                                          } else {
                                            favcontroller.setFavourite(
                                                snapshot.data![index].id
                                                    .toString(),
                                                "0");
                                            favcontroller.removeFavouriteItems(
                                                context,
                                                snapshot.data![index].id
                                                    .toString());
                                          }
                                        }),
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

Widget cardOfUnit(img, title, address, onPress, unitPrice, numOfShowerRoom,
    distence, roomNum, isFav, onPressFav) {
  return InkWell(
    onTap: onPress,
    child: SizedBox(
      width: 100.w,
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(3.w),
            width: 100.w,
            height: 18.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(3.w),
              image: DecorationImage(
                image: img,
                fit: BoxFit.fill,
                opacity: .8,
                onError: (exception, stackTrace) =>
                    const AssetImage(ImagesLink.noImageData),
              ),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 70.w,
                          child: Text(
                            title,
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
                        ),
                        SizedBox(
                          width: 55.w,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
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
                        ),
                      ],
                    ),
                    sharedPreferences!.getString("typeOfUser") == "مستأجر"
                        ? favouriteItem(onPressFav, isFav)
                        : const SizedBox(),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 2.w),
          Row(
            children: [
              btnClickProject(() {}, distence, 27.w, Icons.business_rounded),
              SizedBox(
                width: 3.w,
              ),
              btnClickProject(
                  () {}, numOfShowerRoom, 30.w, Icons.bathroom_outlined),
              SizedBox(
                width: 3.w,
              ),
              btnClickProject(() {}, roomNum, 27.w, Icons.bed_outlined),
            ],
          )
        ],
      ),
    ),
  );
}

Widget btnClickProject(onPressBTN, text, width, icon) {
  return Container(
    width: width,
    height: 4.5.h,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.w),
        border: Border.all(color: LightMode.blueColor),
        color: LightMode.whiteColor),
    alignment: Alignment.center,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
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
          style:
              GoogleFonts.tajawal(color: LightMode.blueColor, fontSize: 3.5.w),
        ),
      ],
    ),
  );
}

Widget favouriteItem(onPressFav, isFav) {
  return Align(
    alignment: Alignment.bottomLeft,
    child: InkWell(
      onTap: onPressFav,
      child: Container(
        height: 10.w,
        width: 10.w,
        decoration: BoxDecoration(
          color: Colors.white70.withValues(alpha: 0.5),
          borderRadius: BorderRadius.circular(7.w),
        ),
        child: Icon(
          isFav == "1" ? Icons.favorite : Icons.favorite_border_outlined,
          color: Colors.red,
          size: 7.w,
        ),
      ),
    ),
  );
}

Widget appBarAds(onPressback, onPressFav, onPressFilter, onPressMap) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Container(
        margin: EdgeInsets.only(top: 7.h, right: 7.w, left: 7.w),
        child: Row(
          children: [
            InkWell(
              onTap: onPressback,
              child: Container(
                width: 10.w,
                height: 7.w,
                decoration: BoxDecoration(
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
              //width: 60.w,
              alignment: Alignment.center,
              child: Text(
                S.of(Get.context!).ads,
                // maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.tajawal(
                    fontSize: 6.w,
                    fontWeight: FontWeight.bold,
                    color: LightMode.blackColor),
              ),
            )
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: 7.h, left: 5.w),
        child: Row(
          children: [
            sharedPreferences!.getString("typeOfUser") == "مستأجر"
                ? InkWell(
                    onTap: onPressFav,
                    child: Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 4.h,
                    ),
                  )
                : const SizedBox(),
            SizedBox(
              width: 4.w,
            ),
            sharedPreferences!.getString("typeOfUser") == "مستأجر"
                ? InkWell(
                    onTap: onPressFilter,
                    child: Icon(
                      Icons.filter_list_alt,
                      color: const Color(0xfff2ad22),
                      size: 4.h,
                    ),
                  )
                : const SizedBox(),
            // InkWell(
            //   onTap: onPressMap,
            //   child: Icon(
            //     Icons.location_on_outlined,
            //     color: const Color(0xfff2ad22),
            //     size: 4.h,
            //   ),
            // )
          ],
        ),
      )
    ],
  );
}

Widget textClik(onPress, title) {
  return TextButton(
      onPressed: onPress,
      child: Text(
        title,
        style: GoogleFonts.tajawal(
            fontSize: 9.w,
            color: LightMode.blackColor,
            fontWeight: FontWeight.w700),
      ));
}
