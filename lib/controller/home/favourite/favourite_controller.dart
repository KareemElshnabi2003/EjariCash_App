import 'package:ejary_cash/core/class/api.dart';
import 'package:ejary_cash/core/class/status_request.dart';
import 'package:ejary_cash/core/constant/colors.dart';
import 'package:ejary_cash/core/function/handling_data.dart';
import 'package:ejary_cash/data/data%20source/favourite.dart';
import 'package:ejary_cash/data/model/ads_model.dart';
import 'package:ejary_cash/generated/l10n.dart';
import 'package:ejary_cash/main.dart';
import 'package:ejary_cash/view/screens/auth/register/main_register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:screen_go/extensions/responsive_nums.dart';

class FavouriteController extends GetxController {
  List<AdsModel> favouriteItems = [];
  Set<int> favoriteIds = {};
  Set<int> processingIds = {};
  StatuesRequest statuesRequest = StatuesRequest.none;
  FavouriteRemoteData settingRemoteData =
      FavouriteRemoteData(Get.find<Api>());
  Map isFav = {};

  void setFavourite(String id, String val) {
    isFav[id] = val;
    update();
  }

  bool isItemFavorite(int? id) {
    if (id == null) return false;
    return favoriteIds.contains(id) || isFav[id.toString()] == "1";
  }

  void messageHandleException(message, context) {
    Get.defaultDialog(
        title: S.of(context).error,
        content: Column(
          children: [
            Text(
              message,
              style: GoogleFonts.tajawal(
                  fontSize: 3.5.w,
                  color: LightMode.blackColor,
                  fontWeight: FontWeight.w500),
            ),
            InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                decoration: BoxDecoration(
                  color: LightMode.yellowColor,
                  borderRadius: BorderRadius.circular(3.w),
                ),
                width: 30.w,
                height: 5.h,
                child: Center(
                  child: Text(
                    S.of(context).tryAgain,
                    style: GoogleFonts.tajawal(
                        fontSize: 4.w,
                        color: LightMode.whiteColor,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  void messageHandleExceptionVisitor(message, context) {
    Get.defaultDialog(
        title: S.of(context).error,
        content: Column(
          children: [
            Text(
              message,
              style: GoogleFonts.tajawal(
                  fontSize: 3.5.w,
                  color: LightMode.blackColor,
                  fontWeight: FontWeight.w500),
            ),
            InkWell(
              onTap: () {
                Get.offAll(() => const MainAuth());
              },
              child: Container(
                decoration: BoxDecoration(
                  color: LightMode.yellowColor,
                  borderRadius: BorderRadius.circular(3.w),
                ),
                width: 30.w,
                height: 5.h,
                child: Center(
                  child: Text(
                    S.of(context).login,
                    style: GoogleFonts.tajawal(
                        fontSize: 4.w,
                        color: LightMode.whiteColor,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ),
          ],
        ));
  }

  Future<void> getFavouriteItems(context) async {
    final token = sharedPreferences?.getString("token");
    if (token == null) return;

    statuesRequest = StatuesRequest.loading;
    update();

    var response = await settingRemoteData.getFavouriteItems(token);
    statuesRequest = handlingData(response);

    if (statuesRequest == StatuesRequest.success) {
      List responseBody = response['data'] ?? [];
      favouriteItems =
          responseBody.map((e) => AdsModel.fromJson(e)).toList();
      favoriteIds = favouriteItems
          .where((e) => e.id != null)
          .map((e) => e.id!)
          .toSet();
      for (var item in favouriteItems) {
        if (item.id != null) {
          isFav[item.id.toString()] = "1";
        }
      }
    } else if (statuesRequest == StatuesRequest.socketException) {
      messageHandleException(S.of(context).noInternetApi, context);
    } else if (statuesRequest == StatuesRequest.serverException) {
      messageHandleException(S.of(context).serverException, context);
    } else if (statuesRequest == StatuesRequest.unExpectedException) {
      messageHandleException(S.of(context).unExcepectedException, context);
    } else if (statuesRequest == StatuesRequest.defaultException) {
      messageHandleException(S.of(context).errorPhoneUseBeforeApi, context);
    } else if (statuesRequest == StatuesRequest.serverError) {
      messageHandleException(S.of(context).error, context);
    } else if (statuesRequest == StatuesRequest.timeoutException) {
      messageHandleException(S.of(context).timeOutException, context);
    } else if (statuesRequest == StatuesRequest.unauthorizedException) {
      messageHandleExceptionVisitor(S.of(context).errorUnAuthorized, context);
    }
    update();
  }

  Future<void> toggleFavourite(context, dynamic adsId) async {
    final int? id = adsId is int ? adsId : int.tryParse(adsId.toString());
    if (id == null || processingIds.contains(id)) return;

    final token = sharedPreferences?.getString("token");
    if (token == null) return;

    processingIds.add(id);

    // Optimistic UI update
    final wasFav = favoriteIds.contains(id);
    if (wasFav) {
      favoriteIds.remove(id);
      isFav[id.toString()] = "0";
      favouriteItems.removeWhere((item) => item.id == id);
    } else {
      favoriteIds.add(id);
      isFav[id.toString()] = "1";
    }
    update();

    var response = await settingRemoteData.addAndDeleteFav(adsId, token);
    final status = handlingData(response);

    if (status != StatuesRequest.success) {
      // Rollback on failure
      if (wasFav) {
        favoriteIds.add(id);
        isFav[id.toString()] = "1";
      } else {
        favoriteIds.remove(id);
        isFav[id.toString()] = "0";
      }
      messageHandleException(S.of(context).tryAgain, context);
    }

    processingIds.remove(id);
    update();
  }

  Future<void> addFavouriteItems(context, adsId) async {
    await toggleFavourite(context, adsId);
  }

  Future<void> removeFavouriteItems(context, adsId) async {
    await toggleFavourite(context, adsId);
  }

  @override
  void onInit() {
    final isVisit = sharedPreferences?.getBool("visit") ?? false;
    if (!isVisit) {
      getFavouriteItems(Get.context);
    }
    super.onInit();
  }
}
