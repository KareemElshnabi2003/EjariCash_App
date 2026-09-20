import 'package:ejary_cash/controller/add_ads/add_ads_controller.dart';
import 'package:ejary_cash/core/class/status_request.dart';
import 'package:ejary_cash/core/constant/colors.dart';
import 'package:ejary_cash/generated/l10n.dart';
import 'package:ejary_cash/view/screens/auth/register/sign_up.dart';
import 'package:ejary_cash/view/screens/home/addd_ads/ads_info_owner/ads_info_owner_1.dart';
import 'package:ejary_cash/view/widget/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class AddAdsInfo4 extends StatelessWidget {
  const AddAdsInfo4({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddAdsController());
    return Scaffold(
      backgroundColor: LightMode.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            appBarSign(() {
              Get.back();
            }, S.of(context).addUnitDetails),
            appBarProgress(0.w, 4),
            GetBuilder<AddAdsController>(
              builder: (controller) => SingleChildScrollView(
                child: controller.statuesRequest == StatuesRequest.loading
                    ? loading(80.h)
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 5.w, left: 5.w),
                            child: Text(
                              S.of(context).images,
                              style: TextStyle(
                                  fontSize: 6.w,
                                  color: LightMode.blackColor,
                                  fontWeight: FontWeight.w800),
                            ),
                          ),
                          SizedBox(
                            height: 5.w,
                          ),
                          GetBuilder<AddAdsController>(
                              builder: (controller) => addImage(
                                  () {
                                    controller.getImageFromGallery();
                                  },
                                  controller.image,
                                  () {
                                    controller.deletImage();
                                  })),
                          SizedBox(
                            height: 2.h,
                          ),
                          GetBuilder<AddAdsController>(
                            builder: (controller) => controller.image == null
                                ? const SizedBox()
                                : addMoreImages(
                                    SizedBox(
                                      height: controller.imagesFiles.isEmpty
                                          ? 0.h
                                          : controller.imagesFiles.length == 1
                                              ? 20.h
                                              : controller.imagesFiles.length ==
                                                      2
                                                  ? 40.h
                                                  : controller.imagesFiles
                                                              .length ==
                                                          3
                                                      ? 60.h
                                                      : 80.h,
                                      width: 100.w,
                                      child: ListView.separated(
                                          physics: controller
                                                      .imagesFiles.length <
                                                  4
                                              ? const NeverScrollableScrollPhysics()
                                              : null,
                                          padding: EdgeInsets.zero,
                                          itemBuilder: (context, index) => Row(
                                                children: [
                                                  Image.file(
                                                    controller
                                                        .imagesFiles[index],
                                                    fit: BoxFit.fill,
                                                    width: 70.w,
                                                    height: 20.h,
                                                  ),
                                                  Container(
                                                      width: 20.w,
                                                      alignment:
                                                          Alignment.center,
                                                      height: 20.h,
                                                      child: IconButton(
                                                          onPressed: () {
                                                            controller
                                                                .deletMultyImage(
                                                                    index);
                                                          },
                                                          icon: Icon(
                                                              Icons.delete,
                                                              color: Colors.red,
                                                              size: 6.w))),
                                                ],
                                              ),
                                          separatorBuilder: (context, index) =>
                                              SizedBox(
                                                height: 5.w,
                                              ),
                                          itemCount: controller.images.length),
                                    ), () {
                                    controller.getMultyImageFromGallery();
                                  }),
                          ),
                          SizedBox(
                            height: 10.w,
                          ),
                          btnClick(S.of(context).addUnit, () {
                            print(controller.typeUser);
                            controller.image == null ||
                                    controller.images.isEmpty
                                ? controller.messageHandleException(
                                    S.of(context).enterImage, context)
                                : controller.typeUser == "owner"
                                    ? controller.addAdsOwner(context)
                                    : controller.addAdsBroker(context);
                          }, LightMode.whiteColor, LightMode.blueColor,
                              LightMode.blueColor),
                          SizedBox(
                            height: 10.w,
                          ),
                        ],
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget btnClick(title, onPress, colorText, colorBorder, colorBackGround) {
  return InkWell(
    onTap: onPress,
    child: Container(
      margin: EdgeInsets.only(right: 5.w, left: 5.w),
      width: 100.w,
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
              fontSize: 5.w, fontWeight: FontWeight.bold, color: colorText),
        ),
      ),
    ),
  );
}

Widget addImage(onPress, image, onDelete) {
  return Row(
    children: [
      image == null
          ? const SizedBox()
          : Container(
              width: 20.w,
              height: 20.h,
              alignment: Alignment.center,
              child: IconButton(
                  onPressed: onDelete,
                  icon: Icon(
                    Icons.delete,
                    color: Colors.red,
                    size: 6.w,
                  ))),
      InkWell(
        onTap: onPress,
        child: Container(
          margin: EdgeInsets.only(right: 5.w, left: 5.w),
          width: image == null ? 90.w : 70.w,
          height: image == null ? 10.h : 20.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            image: image == null
                ? null
                : DecorationImage(image: FileImage(image), fit: BoxFit.fill),
            borderRadius: BorderRadius.circular(4.w),
            border: Border.all(color: LightMode.greenColor, width: 2),
          ),
          child: image == null
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.camera_alt_outlined,
                      color: LightMode.blackColor,
                      size: 8.w,
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    Text(
                      S.of(Get.context!).addImage,
                      style: GoogleFonts.tajawal(
                          fontSize: 6.w,
                          color: LightMode.blackColor,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                )
              : null,
        ),
      ),
    ],
  );
}

Widget addMoreImages(listView, onPress) {
  return Container(
    margin: EdgeInsets.only(right: 5.w, left: 5.w),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(Get.context!).moreImage,
          style: GoogleFonts.tajawal(
              fontSize: 6.w,
              color: LightMode.blackColor,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 5.w,
        ),
        listView,
        Container(
          margin: EdgeInsets.only(top: 5.w),
          width: 100.w,
          alignment: Alignment.center,
          child: InkWell(
            onTap: onPress,
            child: Container(
              width: 70.w,
              height: 20.h,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.w),
                border: Border.all(color: LightMode.blueColor, width: 2),
              ),
              child: Text(
                S.of(Get.context!).addImage,
                style: GoogleFonts.tajawal(
                    fontSize: 6.w,
                    color: LightMode.blackColor,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
