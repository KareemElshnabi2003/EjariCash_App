import 'package:ejary_cash/controller/home/profile/privacy_controller.dart';
import 'package:ejary_cash/core/constant/colors.dart';
import 'package:ejary_cash/generated/l10n.dart';
import 'package:ejary_cash/view/screens/auth/register/sign_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class Privacy extends StatelessWidget {
  const Privacy({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PrivacyController());
    return Scaffold(
      backgroundColor: LightMode.whiteColor,
      body: GetBuilder<PrivacyController>(
        builder: (controller) => SingleChildScrollView(
          child: SingleChildScrollView(
            child: Column(
              children: [
                appBarSign(() {
                  Get.back();
                }, S.of(context).prrivacy),
                Container(
                  margin: EdgeInsets.only(
                      right: 7.w, left: 7.w, top: 7.w, bottom: 7.w),
                  child: Html(
                    data: controller.htmlData,
                    style: {
                      "p": Style(
                        fontSize: MediaQuery.sizeOf(context).shortestSide > 600
                            ? FontSize.xxLarge
                            : FontSize.large,
                        color: LightMode.blueColor, // Customize font size
                        textAlign:
                            TextAlign.right, // Align text to right for Arabic
                      ),
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
