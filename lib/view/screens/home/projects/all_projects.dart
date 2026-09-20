import 'package:cached_network_image/cached_network_image.dart';
import 'package:ejary_cash/controller/home/project/all_projects_controller.dart';
import 'package:ejary_cash/core/constant/colors.dart';
import 'package:ejary_cash/generated/l10n.dart';
import 'package:ejary_cash/view/screens/home/projects/project_info.dart';
import 'package:ejary_cash/view/widget/no_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

import '../home_page.dart';

class AllProjects extends StatelessWidget {
  const AllProjects({super.key});

  @override
  Widget build(BuildContext context) {
    AllProjectsController allProjectsController =
        Get.put(AllProjectsController());
    return Scaffold(
      backgroundColor: LightMode.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            appBarAllProjectPage(() {
              Get.back();
            }, S.of(context).projects),
            Container(
              margin: EdgeInsets.only(
                  top: 5.w, left: 5.w, right: 5.w, bottom: 10.w),
              height: 100.h,
              width: 100.w,
              child: allProjectsController.allProgects.isEmpty
                  ? noData(S.of(context).noProjects)
                  : GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 10.w,
                          mainAxisSpacing: 10.w,
                          childAspectRatio: .68),
                      itemBuilder: (context, index) => cardOfProject(
                          CachedNetworkImageProvider(allProjectsController
                              .allProgects[index].partnerImage!),
                          allProjectsController.allProgects[index].name, () {
                        Get.to(() => const ProjectInfo(),
                            arguments: {
                              "id": allProjectsController.allProgects[index].id
                                  .toString()
                            },
                            transition: Transition.leftToRightWithFade,
                            duration: const Duration(milliseconds: 800));
                      }),
                      itemCount: allProjectsController.allProgects.length,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.zero,
                    ),
            )
          ],
        ),
      ),
    );
  }
}

Widget appBarAllProjectPage(onPressBack, text) {
  return Container(
    margin: EdgeInsets.only(top: 5.h, right: 7.w, left: 7.w, bottom: 3.h),
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
        )
      ],
    ),
  );
}
