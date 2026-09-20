import 'package:cached_network_image/cached_network_image.dart';
import 'package:ejary_cash/controller/home/project/project_info_controller.dart';
import 'package:ejary_cash/core/class/status_request.dart';
import 'package:ejary_cash/core/constant/colors.dart';
import 'package:ejary_cash/core/constant/images.dart';
import 'package:ejary_cash/generated/l10n.dart';
import 'package:ejary_cash/view/widget/loading.dart';
import 'package:ejary_cash/view/widget/no_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class ProjectInfo extends StatelessWidget {
  const ProjectInfo({super.key});

  @override
  Widget build(BuildContext context) {
    ProjectInfoController projectInfoController =
        Get.put(ProjectInfoController());
    return Scaffold(
      backgroundColor: LightMode.whiteColor,
      body: GetBuilder<ProjectInfoController>(
        builder: (controller) => SizedBox(
          width: 100.w,
          height: 100.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              appBarAdsInfo(() {
                Get.back();
              }, S.of(context).titleProjectInfo, context),
              projectInfoController.statuesRequest == StatuesRequest.loading
                  ? loading(75.h)
                  : projectInfoController.allProjectForPartener.isEmpty
                      ? Center(child: noData(S.of(context).noProjects))
                      : SizedBox(
                          height: 90.h,
                          width: 100.w,
                          child: ListView.builder(
                            itemCount: projectInfoController
                                .allProjectForPartener.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                imageProjectInfo(
                                    projectInfoController
                                                .allProjectForPartener[index]
                                                .projectImage ==
                                            ""
                                        ? const AssetImage(
                                            ImagesLink.noImageData)
                                        : CachedNetworkImageProvider(
                                            projectInfoController
                                                .allProjectForPartener[index]
                                                .projectImage!), () {
                                  Get.defaultDialog(
                                    title: "",
                                    titlePadding: EdgeInsets.zero,
                                    content: Container(
                                      width: 100.w,
                                      height: 60.h,
                                      margin: EdgeInsets.only(
                                          right: 5.w, left: 5.w),
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: CachedNetworkImageProvider(
                                                  projectInfoController
                                                      .allProjectForPartener[
                                                          index]
                                                      .projectImage!))),
                                    ),
                                  );
                                }),
                                infoAds(
                                    projectInfoController
                                        .allProjectForPartener[index].name,
                                    "${projectInfoController.allProjectForPartener[index].cityName} , ${projectInfoController.allProjectForPartener[index].areaName}"),
                                progectDiscription(
                                    projectInfoController
                                        .allProjectForPartener[index]
                                        .description,
                                    projectInfoController
                                        .allProjectForPartener[index]
                                        .projectCatalogue, () {
                                  projectInfoController
                                              .allProjectForPartener[index]
                                              .projectCatalogue ==
                                          ""
                                      ? null
                                      : controller.urlLuncher(
                                          projectInfoController
                                              .allProjectForPartener[index]
                                              .projectCatalogue!);
                                }),
                                btnProject(() {
                                  projectInfoController
                                              .allProjectForPartener[index]
                                              .projectLink ==
                                          ""
                                      ? null
                                      : controller.urlLuncher(
                                          projectInfoController
                                              .allProjectForPartener[index]
                                              .projectLink!);
                                })
                              ],
                            ),
                          ),
                        )
            ],
          ),
        ),
      ),
    );
  }
}

Widget btnProject(onPress) {
  return Container(
    decoration: BoxDecoration(
        color: LightMode.blueColor, borderRadius: BorderRadius.circular(2.w)),
    width: 100.w,
    height: 6.h,
    padding: EdgeInsets.only(right: 7.w, left: 7.w),
    margin: EdgeInsets.only(right: 6.w, left: 6.w),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Spacer(
          flex: 1,
        ),
        Expanded(
          flex: 2,
          child: Text(
            S.of(Get.context!).locateProject,
            style: GoogleFonts.tajawal(
                fontSize: 4.w,
                fontWeight: FontWeight.w500,
                color: LightMode.whiteColor),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            margin: EdgeInsets.only(right: 10.w),
            child: Icon(
              Icons.arrow_outward_outlined,
              color: LightMode.whiteColor,
              size: 5.w,
            ),
          ),
        )
      ],
    ),
  );
}

Widget progectDiscription(text, linkCatalog, onPressLink) {
  return Container(
    margin: EdgeInsets.only(right: 6.w, left: 6.w, bottom: 3.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          S.of(Get.context!).descripe,
          style: GoogleFonts.tajawal(
              fontSize: 5.w,
              fontWeight: FontWeight.bold,
              color: LightMode.blackColor),
        ),
        Text(
          text,
          style: GoogleFonts.tajawal(
              fontSize: 4.w,
              fontWeight: FontWeight.w600,
              color: LightMode.blueColor),
        ),
        SizedBox(
          height: 6.w,
        ),
        Text(
          S.of(Get.context!).catalogProject,
          style: GoogleFonts.tajawal(
              fontSize: 5.w,
              fontWeight: FontWeight.bold,
              color: LightMode.blackColor),
        ),
        SizedBox(
          height: 4.w,
        ),
        InkWell(
          onTap: onPressLink,
          child: Text(
            linkCatalog,
            style: GoogleFonts.tajawal(
                decoration: TextDecoration.underline,
                decorationColor: LightMode.blueColor,
                fontSize: 4.w,
                fontWeight: FontWeight.w600,
                color: LightMode.blueColor),
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
      ],
    ),
  );
}

Widget infoAds(title, address) {
  return Container(
      width: 100.w,
      //  height: 7.h,
      margin: EdgeInsets.only(right: 6.w, left: 6.w, bottom: 6.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: GoogleFonts.tajawal(
                fontSize: 5.w,
                fontWeight: FontWeight.bold,
                color: LightMode.blackColor),
          ),
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
                    fontWeight: FontWeight.w600,
                    color: LightMode.blackColor),
              ),
            ],
          ),
        ],
      ));
}

Widget imageProjectInfo(img, onTap) {
  return InkWell(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.only(right: 6.w, left: 6.w, top: 6.w, bottom: 2.w),
      width: 80.w,
      height: 18.h,
      decoration: BoxDecoration(
          border: Border.all(color: LightMode.blackColor),
          borderRadius: BorderRadius.circular(3.w),
          image: DecorationImage(
            image: img,
            fit: BoxFit.fill,
            onError: (exception, stackTrace) =>
                const AssetImage(ImagesLink.noImageData),
          )),
    ),
  );
}

Widget appBarAdsInfo(onPressBack, text, context) {
  return Container(
    margin: EdgeInsets.only(top: 5.h, right: 7.w, left: 7.w),
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
                    gradient: LinearGradient(colors: [
                      LightMode.blueColor,
                      LightMode.blueColor.withValues(alpha: .8),
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
            ),
          ],
        ),
      ],
    ),
  );
}
