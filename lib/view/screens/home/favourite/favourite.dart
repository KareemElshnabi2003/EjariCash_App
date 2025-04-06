import 'package:ejary_cash/controller/home/favourite/favourite_controller.dart';
import 'package:ejary_cash/controller/home/home_controller.dart';
import 'package:ejary_cash/core/constant/colors.dart';
import 'package:ejary_cash/core/constant/images.dart';
import 'package:ejary_cash/generated/l10n.dart';
import 'package:ejary_cash/view/screens/auth/register/sign_up.dart';
import 'package:ejary_cash/view/screens/home/ads/ads_info.dart';
import 'package:ejary_cash/view/widget/no_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class Favourite extends StatelessWidget {
  const Favourite({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = Get.put(HomeController());
    Get.put(FavouriteController());
    return Scaffold(
      backgroundColor: LightMode.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            appBarSign(() {
              homeController.goToHomeWithIndex(1, {});
            }, S.of(context).favourite),
            SizedBox(
              height: 3.h,
            ),
            GetBuilder<FavouriteController>(
              builder: (controller) => controller.favouriteItems.isEmpty
                  ? Center(child: noData(S.of(context).noFav))
                  : Container(
                      margin: EdgeInsets.only(right: 5.w, left: 5.w),
                      width: 100.w,
                      height: 88.h,
                      child: ListView.separated(
                        padding: EdgeInsets.zero,
                        itemCount: controller.favouriteItems.length,
                        separatorBuilder: (context, index) => SizedBox(
                          height: 5.w,
                        ),
                        itemBuilder: (context, index) => cardOfUnit(
                            controller.favouriteItems[index].productImage == ""
                                ? const AssetImage(ImagesLink.splashLogoImage)
                                : NetworkImage(controller
                                    .favouriteItems[index].productImage!),
                            controller.favouriteItems[index].name,
                            "${controller.favouriteItems[index].cityName ?? S.of(context).notMark} , ${controller.favouriteItems[index].areaName ?? S.of(context).notMark}",
                            () {
                              Get.to(() => const AdsInfo(),
                                  arguments: {
                                    "AdsInfo": controller.favouriteItems[index]
                                        .toJson()
                                  },
                                  transition: Transition.leftToRightWithFade,
                                  duration: const Duration(milliseconds: 800));
                            },
                            "${controller.favouriteItems[index].price} ريال",
                            "${controller.favouriteItems[index].bathroomsNo ?? 0} ${S.of(context).bathroom} ",
                            "${controller.favouriteItems[index].width ?? 0} ${S.of(context).m2}",
                            "${controller.favouriteItems[index].bedroomsNo ?? 0} ${S.of(context).room}",
                            controller.isFav[
                                controller.favouriteItems[index].id.toString()],
                            () {
                              controller.setFavourite(
                                  controller.favouriteItems[index].id
                                      .toString(),
                                  "0");
                              controller.removeFavouriteItems(
                                  context,
                                  controller.favouriteItems[index].id
                                      .toString());
                            }),
                      ),
                    ),
            )
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
                      color: LightMode.whiteColor.withOpacity(.5),
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
                      children: [
                        Text(
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
                    ),
                    favouriteItem(onPressFav, isFav),
                  ],
                )
              ],
            ),
          ),
          SizedBox(height: 2.w),
          Row(
            children: [
              btnClickProject(() {}, distence, 27.w, Icons.business_sharp),
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
          size: 5.w,
          color: LightMode.blueColor,
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
          color: Colors.white70.withOpacity(0.5),
          borderRadius: BorderRadius.circular(7.w),
        ),
        child: Icon(
          Icons.favorite,
          color: Colors.red,
          size: 7.w,
        ),
      ),
    ),
  );
}
