import 'package:ejary_cash/controller/home/notification/notify_controller.dart';
import 'package:ejary_cash/core/class/status_request.dart';
import 'package:ejary_cash/core/constant/colors.dart';
import 'package:ejary_cash/generated/l10n.dart';
import 'package:ejary_cash/view/screens/auth/register/sign_up.dart';
import 'package:ejary_cash/view/widget/loading.dart';
import 'package:ejary_cash/view/widget/no_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_go/extensions/responsive_nums.dart';
import 'package:timeago/timeago.dart' as timeago;

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotifyController());
    String formatDateToRelativeTime(DateTime date) {
      timeago.setLocaleMessages('ar', timeago.ArMessages());

      return timeago.format(date, locale: 'ar');
    }

    return Scaffold(
      backgroundColor: LightMode.whiteColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            appBarSign(() {
              // sharedPreferences!.clear();
              Get.back();
            }, S.of(context).notify),
            GetBuilder<NotifyController>(
                builder: (controller) => controller.statuesRequest ==
                        StatuesRequest.loading
                    ? loading(80.h)
                    : controller.notifycationsList.isEmpty
                        ? noData(S.of(context).noNotify)
                        : Container(
                            margin: EdgeInsets.only(
                                right: 5.w, left: 5.w, top: 5.w, bottom: 20.w),
                            width: 100.w,
                            height: 76.h,
                            child: ListView.separated(
                              separatorBuilder: (context, index) => SizedBox(
                                height: 2.w,
                              ),
                              itemCount: controller.notifycationsList.length,
                              itemBuilder: (context, index) => ListTile(
                                tileColor: LightMode.whiteBlueColor,
                                contentPadding: EdgeInsets.all(1.w),
                                title: Text(
                                    controller
                                        .notifycationsList[index].data!.title!,
                                    style: GoogleFonts.tajawal(
                                        fontSize: 4.w,
                                        fontWeight: FontWeight.bold,
                                        color: LightMode.blackColor)),
                                subtitle: Text(
                                    controller
                                        .notifycationsList[index].data!.text!,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    style: GoogleFonts.tajawal(
                                        fontSize: 3.w,
                                        fontWeight: FontWeight.w600,
                                        color: LightMode.blackColor
                                            .withValues(alpha: .8))),
                                trailing: Text(
                                    formatDateToRelativeTime(DateTime.parse(
                                        controller.notifycationsList[index]
                                            .createdAt!)),
                                    style: GoogleFonts.tajawal(
                                        fontSize: 2.5.w,
                                        fontWeight: FontWeight.w500,
                                        color: LightMode.blackColor
                                            .withValues(alpha: .8))),
                                onTap: () {},
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(3.w),
                                  ),
                                ),
                              ),
                            ),
                          )),
          ],
        ),
      ),
    );
  }
}
