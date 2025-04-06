import 'package:cached_network_image/cached_network_image.dart';
import 'package:ejary_cash/controller/home/home_controller.dart';
import 'package:ejary_cash/controller/home/home_page_controller.dart';
import 'package:ejary_cash/core/constant/images.dart';
import 'package:ejary_cash/data/model/ads_owner_model.dart';
import 'package:ejary_cash/generated/l10n.dart';
import 'package:ejary_cash/view/screens/home/addd_ads/why_ejary_cash.dart';
import 'package:ejary_cash/view/screens/home/ads/ads_info_owner.dart';
import 'package:ejary_cash/view/screens/home/chat/all_chats.dart';
import 'package:ejary_cash/view/screens/home/home_page.dart';
import 'package:ejary_cash/view/screens/home/notification/notification.dart';
import 'package:ejary_cash/view/widget/loading.dart';
import 'package:ejary_cash/view/widget/no_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class HomePageOwner extends StatelessWidget {
  const HomePageOwner({super.key});

  @override
  Widget build(BuildContext context) {
    HomePageController homePageController = Get.put(HomePageController());
    HomeController homeController = Get.put(HomeController());
    return Column(
      children: [
        appBarHome(S.of(context).ejariCash, () {
          Get.to(() => const AllChats(),
              transition: Transition.leftToRightWithFade,
              duration: const Duration(milliseconds: 800));
        }, () {
          Get.to(() => const NotificationPage(),
              transition: Transition.leftToRightWithFade,
              duration: const Duration(milliseconds: 800));
        }),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
                onTap: () {
                  Get.to(() => const WhyEjaryCash(),
                      transition: Transition.leftToRightWithFade,
                      duration: const Duration(milliseconds: 800));
                },
                child: cardOwnerHomePage()),
            divider(),
            partUnites(() {
              homeController.changePage(1);
            },
                SizedBox(
                    width: 100.w,
                    height: MediaQuery.sizeOf(context).shortestSide > 600
                        ? 25.h
                        : 19.h,
                    child: FutureBuilder<List<AdsOwnerModel>>(
                      future: homePageController.getAllAdsForOwner(context),
                      initialData: homePageController.allAdsOwner,
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
                            separatorBuilder: (context, index) => SizedBox(
                              width: 5.w,
                            ),
                            padding: EdgeInsets.only(right: 1.w, left: 1.w),
                            scrollDirection: Axis.horizontal,
                            itemCount: snapshot.data!.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) => cardOfUnit(
                                snapshot.data![index].productImage == ""
                                    ? const AssetImage(
                                        ImagesLink.splashLogoImage)
                                    : CachedNetworkImageProvider(
                                        snapshot.data![index].productImage!),
                                snapshot.data![index].name,
                                //  "منطقة الرياض , الرياض , نرجس",
                                "${snapshot.data![index].areaName ?? ""} , ${snapshot.data![index].cityName ?? ""}",
                                () {
                              Get.to(() => const AdsInfoOwner(),
                                  arguments: {
                                    "AdsInfo": snapshot.data![index].toJson()
                                  },
                                  transition: Transition.leftToRightWithFade,
                                  duration: const Duration(milliseconds: 800));
                            },
                                "${snapshot.data![index].price} ريال",
                                "${snapshot.data![index].bathroomsNo} ${S.of(context).bathroom}",
                                "${snapshot.data![index].width} ${S.of(context).m2}",
                                "${snapshot.data![index].bedroomsNo} ${S.of(context).room}"),
                          );
                        }
                      },
                    ))),
            // partOfProjecct(() {
            //   Get.to(() => const AllProjects(),
            //       arguments: {"AllProjects": controller.allProjects},
            //       transition: Transition.leftToRightWithFade,
            //       duration: const Duration(milliseconds: 800));
            // },
            //     controller.statuesRequest_2 == StatuesRequest.loading
            //         ? loading(25.h)
            //         : controller.allProjects.isEmpty
            //             ? SizedBox(
            //                 width: 100.w,
            //                 child: Center(child: noData(  S.of(context).noPartener)))
            //             : SizedBox(
            //                 height: 100.h,
            //                 width: 100.w,
            //                 child: GridView.builder(
            //                   shrinkWrap: true,
            //                   gridDelegate:
            //                       SliverGridDelegateWithFixedCrossAxisCount(
            //                           crossAxisCount: 2,
            //                           crossAxisSpacing: 10.w,
            //                           mainAxisSpacing: 10.w,
            //                           childAspectRatio: .68),
            //                   itemBuilder: (context, index) => cardOfProject(
            //                       CachedNetworkImageProvider(controller
            //                           .allProjects[index].partnerImage!),
            //                       controller.allProjects[index].name, () {
            //                     Get.to(() => const ProjectInfo(),
            //                         arguments: {
            //                           "id": controller.allProjects[index].id
            //                               .toString()
            //                         },
            //                         transition:
            //                             Transition.leftToRightWithFade,
            //                         duration:
            //                             const Duration(milliseconds: 800));
            //                   }),
            //                   itemCount: controller.allProjects.length > 4
            //                       ? 4
            //                       : controller.allProjects.length,
            //                   physics: const NeverScrollableScrollPhysics(),
            //                   padding: EdgeInsets.zero,
            //                 ),
            //               )),
          ],
        ),
      ],
    );
  }
}
