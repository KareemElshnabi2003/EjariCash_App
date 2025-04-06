import 'package:cached_network_image/cached_network_image.dart';
import 'package:ejary_cash/controller/home/ads/ads_info_controller.dart';
import 'package:ejary_cash/controller/home/favourite/favourite_controller.dart';
import 'package:ejary_cash/core/constant/colors.dart';
import 'package:ejary_cash/core/constant/images.dart';
import 'package:ejary_cash/generated/l10n.dart';
import 'package:ejary_cash/main.dart';
import 'package:ejary_cash/view/screens/home/ads/report.dart';
import 'package:ejary_cash/view/screens/home/orders/make_order/ads_order.dart';
import 'package:ejary_cash/view/screens/home/projects/project_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class AdsInfoOwner extends StatelessWidget {
  const AdsInfoOwner({super.key});

  @override
  Widget build(BuildContext context) {
    AdsInfoController adsInfoController = Get.put(AdsInfoController());
    Get.put(FavouriteController());
    return Scaffold(
      backgroundColor: LightMode.whiteColor,
      body: SizedBox(
        height: 100.h,
        width: 100.w,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              appBarAdsInfo(
                  () {
                    Get.back();
                  },
                  S.of(Get.context!).unitDetails,
                  () {
                    //onPressReport
                    Get.to(() => const Report(),
                        arguments: {
                          "adsId": adsInfoController.adsOwnerModel!.id
                        },
                        transition: Transition.leftToRightWithFade,
                        duration: const Duration(milliseconds: 800));
                  },
                  () {
                    //onPressShare
                  },
                  context),
              GetBuilder<FavouriteController>(
                builder: (controller) => imageWithIconFavO(() {
                  if (controller.isFav[
                              adsInfoController.adsOwnerModel!.id.toString()] ==
                          "0" ||
                      controller.isFav[
                              adsInfoController.adsOwnerModel!.id.toString()] ==
                          null) {
                    controller.setFavourite(
                        adsInfoController.adsOwnerModel!.id.toString(), "1");
                    controller.addFavouriteItems(context,
                        adsInfoController.adsOwnerModel!.id.toString());
                  } else {
                    controller.setFavourite(
                        adsInfoController.adsOwnerModel!.id.toString(), "0");
                    controller.removeFavouriteItems(context,
                        adsInfoController.adsOwnerModel!.id.toString());
                  }
                },
                    adsInfoController.adsOwnerModel!.productImage == ""
                        ? const AssetImage(ImagesLink.splashLogoImage)
                        : NetworkImage(
                            adsInfoController.adsOwnerModel!.productImage!),
                    controller
                        .isFav[adsInfoController.adsOwnerModel!.id.toString()]),
              ),
              infoAds(
                  adsInfoController.adsOwnerModel!.name,
                  "${adsInfoController.adsOwnerModel!.cityName ?? ""} , ${adsInfoController.adsOwnerModel!.areaName ?? ""}",
                  "${adsInfoController.adsOwnerModel!.price}",
                  adsInfoController.adsOwnerModel!.priceType == "per_month"
                      ? "month"
                      : "year",
                  "${adsInfoController.adsOwnerModel!.width} ${S.of(context).m2}",
                  "${adsInfoController.adsOwnerModel!.bathroomsNo} ${S.of(context).bathroom}",
                  "${adsInfoController.adsOwnerModel!.bedroomsNo} ${S.of(context).room}"),
              if (adsInfoController.adsOwnerModel!.description != null &&
                  adsInfoController.adsOwnerModel!.description != "null" &&
                  adsInfoController.adsOwnerModel!.description != "" &&
                  adsInfoController.adsOwnerModel!.description != "<p>	</p>")
                discriptionAds(
                    adsInfoController.adsOwnerModel!.description,
                    // adsInfoController.htmlData,
                    adsInfoController.adsOwnerModel!.imgaes!.isEmpty
                        ? false
                        : true,
                    adsInfoController.adsOwnerModel!.imgaes!.isEmpty
                        ? const SizedBox()
                        : SizedBox(
                            height: 18.h,
                            width: 88.w,
                            child: ListView.builder(
                              padding: EdgeInsets.zero,
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              itemCount: adsInfoController
                                  .adsOwnerModel!.imgaes!.length,
                              itemBuilder: (context, index) => imageProjectInfo(
                                  NetworkImage(adsInfoController
                                      .adsOwnerModel!.imgaes![index].url!), () {
                                Get.dialog(
                                  Container(
                                    margin: EdgeInsets.only(
                                        right: 5.w,
                                        left: 5.w,
                                        top: 20.h,
                                        bottom: 20.h),
                                    width: 100.w,
                                    height: 50.h,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(3.w),
                                        image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: CachedNetworkImageProvider(
                                                adsInfoController.adsOwnerModel!
                                                    .imgaes![index].url!))),
                                  ),
                                );
                              }),
                            ),
                          )),
              detailesAds(
                  adsInfoController.adsOwnerModel!.categoryName ??
                      S.of(context).notMark,
                  adsInfoController.adsOwnerModel!.bathroomsNo ??
                      S.of(context).notMark,
                  adsInfoController.adsOwnerModel!.width ??
                      S.of(context).notMark,
                  adsInfoController.adsOwnerModel!.streetWidth ??
                      S.of(context).notMark,
                  adsInfoController.adsOwnerModel!.yearBuilt ??
                      S.of(context).notMark,
                  adsInfoController.adsOwnerModel!.facade ??
                      S.of(context).notMark,
                  adsInfoController.adsOwnerModel!.price ??
                      S.of(context).notMark,
                  adsInfoController.adsOwnerModel!.priceType == "per_month"
                      ? "month"
                      : "year", () {
                Get.to(
                    () => AdsOrder(
                          yearlyRent: adsInfoController
                                      .adsOwnerModel!.priceType ==
                                  "per_year"
                              ? adsInfoController.adsOwnerModel!.price
                                  .toString()
                              : ((adsInfoController.adsOwnerModel!.price)! * 12)
                                  .toString(),
                          adsId: adsInfoController.adsOwnerModel!.id.toString(),
                          priceAds: adsInfoController.adsOwnerModel!.price!,
                        ),
                    arguments: {
                      "price": adsInfoController.adsOwnerModel!.price.toString()
                    },
                    transition: Transition.leftToRightWithFade,
                    duration: const Duration(milliseconds: 800));
              }),
              mapWidget(),
              statusWidget(adsInfoController.adsOwnerModel!.status == "show"
                  ? S.of(context).active
                  : S.of(context).notActive),
              barCodeWidget(

                  //  CachedNetworkImageProvider(adsInfoController.adsModel!.barcode!)
                  const AssetImage(ImagesLink.testBarCodeImage)),
              if (adsInfoController.adsOwnerModel!.productSpecificationData !=
                  null)
                companyInfo(
                    adsInfoController
                            .adsOwnerModel!.productSpecificationData!.companyName ??
                        adsInfoController.adsOwnerModel!
                            .productSpecificationData!.addedByName,
                    adsInfoController
                        .adsOwnerModel!.productSpecificationData!.addedByMobile,
                    adsInfoController
                        .adsOwnerModel!.productSpecificationData!.adNumber,
                    adsInfoController.adsOwnerModel!.productSpecificationData!
                        .valLicenseNumber),
              SizedBox(
                height: 5.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget companyInfo(companyName, phone, numOfAds, numOfVal) {
  return Container(
    margin: EdgeInsets.only(right: 6.w, left: 6.w, top: 8.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(Get.context!).advertiser,
          style: GoogleFonts.tajawal(
              fontSize: 5.w,
              fontWeight: FontWeight.bold,
              color: LightMode.blackColor),
        ),
        SizedBox(
          height: 3.w,
        ),
        Text(
          companyName,
          style: GoogleFonts.tajawal(
              fontSize: 6.w,
              fontWeight: FontWeight.bold,
              color: LightMode.yellowColor),
        ),
        SizedBox(
          height: 3.w,
        ),
        Row(
          children: [
            Text(
              "${S.of(Get.context!).ownerPhone} : ",
              style: GoogleFonts.tajawal(
                  fontSize: 4.w,
                  fontWeight: FontWeight.bold,
                  color: LightMode.blackColor),
            ),
            Text(
              phone.toString() == "null" ? "" : phone.toString(),
              style: GoogleFonts.tajawal(
                  fontSize: 4.w,
                  fontWeight: FontWeight.bold,
                  color: LightMode.blueColor),
            ),
          ],
        ),
        SizedBox(
          height: 3.w,
        ),
        Row(
          children: [
            Text(
              "${S.of(Get.context!).adsNum} : ",
              style: GoogleFonts.tajawal(
                  fontSize: 4.w,
                  fontWeight: FontWeight.bold,
                  color: LightMode.blackColor),
            ),
            Text(
              numOfAds ?? "",
              style: GoogleFonts.tajawal(
                  fontSize: 4.w,
                  fontWeight: FontWeight.bold,
                  color: LightMode.blueColor),
            ),
          ],
        ),
        SizedBox(
          height: 3.w,
        ),
        Row(
          children: [
            Text(
              "${S.of(Get.context!).valNum} : ",
              style: GoogleFonts.tajawal(
                  fontSize: 4.w,
                  fontWeight: FontWeight.bold,
                  color: LightMode.blackColor),
            ),
            Text(
              numOfVal ?? "",
              style: GoogleFonts.tajawal(
                  fontSize: 4.w,
                  fontWeight: FontWeight.bold,
                  color: LightMode.blueColor),
            ),
          ],
        ),
      ],
    ),
  );
}

Widget barCodeWidget(img) {
  return Container(
    margin: EdgeInsets.only(right: 6.w, left: 6.w, bottom: 4.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(Get.context!).licanse,
          style: GoogleFonts.tajawal(
              fontSize: 5.w,
              fontWeight: FontWeight.bold,
              color: LightMode.blackColor),
        ),
        SizedBox(
          height: 3.w,
        ),
        Text(
          S.of(Get.context!).scanBarCode,
          style: GoogleFonts.tajawal(
              fontSize: 4.w,
              fontWeight: FontWeight.bold,
              color: LightMode.yellowColor),
        ),
        Container(
          width: 30.w,
          height: 40.w,
          decoration: BoxDecoration(
              border: Border.all(color: LightMode.blackColor),
              borderRadius: BorderRadius.circular(4.w),
              image: DecorationImage(image: img, fit: BoxFit.fill)),
        )
      ],
    ),
  );
}

Widget mapWidget() {
  return Container(
    decoration: BoxDecoration(
        border: Border.all(
          color: LightMode.blackColor,
        ),
        image: const DecorationImage(
            image: AssetImage(
              ImagesLink.testMapImage,
            ),
            fit: BoxFit.fill),
        borderRadius: BorderRadius.circular(4.w)),
    margin: EdgeInsets.only(right: 6.w, left: 6.w, bottom: 6.w),
    width: 100.w,
    height: 25.h,
  );
}

Widget statusWidget(status) {
  return Container(
    width: 35.w,
    margin: EdgeInsets.only(right: 6.w, left: 6.w, bottom: 6.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          S.of(Get.context!).status,
          style: GoogleFonts.tajawal(
              fontSize: 4.w,
              fontWeight: FontWeight.bold,
              color: LightMode.blueColor),
        ),
        Text(
          status,
          style: GoogleFonts.tajawal(
              fontSize: 4.w,
              fontWeight: FontWeight.bold,
              color: LightMode.greenColor),
        ),
      ],
    ),
  );
}

Widget detailesAds(typeOfUnit, bathRoom, area, widthStreet, yearOfBuilt,
    direction, price, monthOrYear, onClickBtn) {
  return Container(
    margin: EdgeInsets.only(right: 6.w, left: 6.w, bottom: 4.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(Get.context!).unitDetails,
          style: GoogleFonts.tajawal(
              fontSize: 5.w,
              fontWeight: FontWeight.bold,
              color: LightMode.blackColor),
        ),
        SizedBox(
          height: 4.w,
        ),
        SizedBox(
          width: 55.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                S.of(Get.context!).unitType,
                style: GoogleFonts.tajawal(
                    fontSize: 4.w,
                    fontWeight: FontWeight.w600,
                    color: LightMode.blackColor.withOpacity(.5)),
              ),
              Text(
                S.of(Get.context!).bathroom,
                style: GoogleFonts.tajawal(
                    fontSize: 4.w,
                    fontWeight: FontWeight.w600,
                    color: LightMode.blackColor.withOpacity(.5)),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 3.w,
        ),
        SizedBox(
          width: 55.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                typeOfUnit.toString(),
                style: GoogleFonts.tajawal(
                    fontSize: 4.w,
                    fontWeight: FontWeight.w600,
                    color: LightMode.blackColor),
              ),
              Text(
                "${bathRoom}",
                style: GoogleFonts.tajawal(
                    fontSize: 4.w,
                    fontWeight: FontWeight.w600,
                    color: LightMode.blackColor),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 4.w,
        ),
        SizedBox(
          width: 55.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                S.of(Get.context!).areaNum,
                style: GoogleFonts.tajawal(
                    fontSize: 4.w,
                    fontWeight: FontWeight.w600,
                    color: LightMode.blackColor.withOpacity(.5)),
              ),
              Text(
                S.of(Get.context!).widthStreet,
                style: GoogleFonts.tajawal(
                    fontSize: 4.w,
                    fontWeight: FontWeight.w600,
                    color: LightMode.blackColor.withOpacity(.5)),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 3.w,
        ),
        SizedBox(
          width: 55.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                area,
                style: GoogleFonts.tajawal(
                    fontSize: 4.w,
                    fontWeight: FontWeight.w600,
                    color: LightMode.blackColor),
              ),
              Text(
                widthStreet,
                style: GoogleFonts.tajawal(
                    fontSize: 4.w,
                    fontWeight: FontWeight.w600,
                    color: LightMode.blackColor),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 4.w,
        ),
        SizedBox(
          width: 55.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                S.of(Get.context!).yearBuilt,
                style: GoogleFonts.tajawal(
                    fontSize: 4.w,
                    fontWeight: FontWeight.w600,
                    color: LightMode.blackColor.withOpacity(.5)),
              ),
              Text(
                S.of(Get.context!).face,
                style: GoogleFonts.tajawal(
                    fontSize: 4.w,
                    fontWeight: FontWeight.w600,
                    color: LightMode.blackColor.withOpacity(.5)),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 3.w,
        ),
        SizedBox(
          width: 55.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                yearOfBuilt.toString(),
                style: GoogleFonts.tajawal(
                    fontSize: 4.w,
                    fontWeight: FontWeight.w600,
                    color: LightMode.blackColor),
              ),
              Text(
                direction,
                style: GoogleFonts.tajawal(
                    fontSize: 4.w,
                    fontWeight: FontWeight.w600,
                    color: LightMode.blackColor),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  "${price} ريال",
                  style: GoogleFonts.tajawal(
                      fontSize: 4.w,
                      fontWeight: FontWeight.bold,
                      color: LightMode.blackColor),
                ),
                Text(
                  monthOrYear == "month"
                      ? S.of(Get.context!).monthly
                      : S.of(Get.context!).yearly,
                  style: GoogleFonts.tajawal(
                      fontSize: 4.w,
                      fontWeight: FontWeight.w800,
                      color: LightMode.blueColor),
                )
              ],
            ),
            if (sharedPreferences!.getString("typeOfUser") == "مستأجر")
              InkWell(
                onTap: onClickBtn,
                child: Container(
                  alignment: Alignment.center,
                  width: 30.w,
                  height: 7.h,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        LightMode.blueColor,
                        LightMode.blueColor.withOpacity(.8),
                      ]),
                      borderRadius: BorderRadius.circular(6.w),
                      color: LightMode.blueColor),
                  child: Text(
                    S.of(Get.context!).requestNow,
                    style: GoogleFonts.tajawal(
                        fontSize: 5.w,
                        fontWeight: FontWeight.w400,
                        color: LightMode.whiteColor),
                  ),
                ),
              )
          ],
        ),
      ],
    ),
  );
}

Widget discriptionAds(htmlData, images, listView) {
  return Container(
    margin: EdgeInsets.only(top: 5.w, bottom: 5.w, right: 6.w, left: 6.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(Get.context!).descripeUnite,
          style: GoogleFonts.tajawal(
              fontSize: 5.w,
              fontWeight: FontWeight.bold,
              color: LightMode.blackColor),
        ),
        SizedBox(
          height: 4.w,
        ),
        Html(
          data: htmlData,
          style: {
            "p": Style(
              fontSize: FontSize.large, // Customize font size
              textAlign: TextAlign.right, // Align text to right for Arabic
            ),
          },
        ),
        SizedBox(
          height: 5.w,
        ),
        images == true
            ? Text(
                S.of(Get.context!).images,
                style: GoogleFonts.tajawal(
                    fontSize: 5.w,
                    fontWeight: FontWeight.bold,
                    color: LightMode.blackColor),
              )
            : const SizedBox(),
        images == true
            ? SizedBox(
                height: 4.w,
              )
            : const SizedBox(),
        images == true ? listView : const SizedBox()
      ],
    ),
  );
}

Widget infoAds(title, address, price, monthOrYeear, width, bathRoom, bedRoom) {
  return Container(
      width: 100.w,
      //height: 13.h,
      margin: EdgeInsets.only(right: 6.w, left: 6.w, bottom: 6.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: GoogleFonts.tajawal(
                    fontSize: 5.w,
                    fontWeight: FontWeight.bold,
                    color: LightMode.blackColor),
              ),
              Text(
                "${price} ريال",
                style: TextStyle(
                    fontSize: 4.w,
                    fontWeight: FontWeight.w700,
                    color: LightMode.blackColor),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: LightMode.blackColor,
                    size: 5.w,
                  ),
                  SizedBox(
                    width: 3.w,
                  ),
                  Text(
                    address,
                    style: GoogleFonts.tajawal(
                        fontSize: 4.w,
                        fontWeight: FontWeight.bold,
                        color: LightMode.blackColor),
                  ),
                ],
              ),
              monthOrYeear == "month"
                  ? Container(
                      margin: EdgeInsets.only(left: 3.w, right: 3.w),
                      child: Text(
                        S.of(Get.context!).monthly,
                        style: GoogleFonts.tajawal(
                            fontSize: 4.w,
                            fontWeight: FontWeight.w700,
                            color: LightMode.blackColor),
                      ),
                    )
                  : Text(
                      S.of(Get.context!).yearly,
                      style: GoogleFonts.tajawal(
                          fontSize: 4.w,
                          fontWeight: FontWeight.w700,
                          color: LightMode.blackColor),
                    ),
            ],
          ),
          SizedBox(
            height: 5.w,
          ),
          Row(
            children: [
              btnClickProject(() {}, width, 25.w, Icons.business_sharp),
              SizedBox(
                width: 2.5.w,
              ),
              btnClickProject(() {}, bathRoom, 30.w, Icons.bathroom_outlined),
              SizedBox(
                width: 2.5.w,
              ),
              btnClickProject(() {}, bedRoom, 25.w, Icons.bed_sharp),
            ],
          ),
        ],
      ));
}

Widget btnClickProject(onPressBTN, text, width, icon) {
  return Container(
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

Widget imageWithIconFavO(onPressFav, img, isFav) {
  return Container(
    margin: EdgeInsets.only(right: 6.w, left: 6.w, top: 6.w, bottom: 2.w),
    width: 100.w,
    height: 18.h,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3.w),
        image: DecorationImage(image: img, fit: BoxFit.fill)),
    child: sharedPreferences!.getString("typeOfUser") == "مستأجر"
        ? Container(
            alignment: Alignment.center,
            margin:
                EdgeInsets.only(top: 10.h, bottom: 2.h, left: 5.w, right: 68.w),
            width: 9.w,
            height: 9.w,
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: LightMode.greycolor.withOpacity(.5)),
            child: IconButton(
              icon: Icon(
                isFav == "0" || isFav == null
                    ? Icons.favorite_border_outlined
                    : Icons.favorite,
                color: Colors.red,
                size: 7.w,
              ),
              onPressed: onPressFav,
            ),
          )
        : null,
  );
}

Widget appBarAdsInfo(onPressBack, text, onPressReport, onPressShare, context) {
  return Container(
    margin: EdgeInsets.only(top: 7.h, right: 7.w, left: 7.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            InkWell(
              onTap: onPressBack,
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
            Text(
              text,
              style: GoogleFonts.tajawal(
                  fontSize: 6.w,
                  fontWeight: FontWeight.bold,
                  color: LightMode.blackColor),
            ),
          ],
        ),
        Row(
          children: [
            IconButton(
                onPressed: onPressReport,
                icon: Icon(
                  Icons.report_gmailerrorred_outlined,
                  color: LightMode.blackColor,
                  size: 8.w,
                )),
            // IconButton(
            //     onPressed: onPressShare,
            //     icon: Icon(
            //       Icons.share,
            //       color: LightMode.blackColor,
            //       size: 6.w,
            //     )),
          ],
        )
      ],
    ),
  );
}
