import 'package:ejary_cash/data/model/ads_model.dart';
import 'package:ejary_cash/data/model/ads_owner_model.dart';
import 'package:ejary_cash/main.dart';
import 'package:get/get.dart';

class AdsInfoController extends GetxController {
  bool isFav = false;
  AdsModel? adsModel;
  AdsOwnerModel? adsOwnerModel;
  Map<String, dynamic> ads = {};

  String htmlData = "";

  Future<void> fetchHetState() async {
    htmlData = adsModel?.description ?? "";
    update();
  }

  void setFav() {
    isFav = !isFav;
    update();
  }

  @override
  void onInit() {
    if (Get.arguments is Map && Get.arguments["AdsInfo"] != null) {
      final rawAds = Get.arguments["AdsInfo"];
      if (rawAds is Map<String, dynamic>) {
        ads = rawAds;
      } else if (rawAds is Map) {
        ads = Map<String, dynamic>.from(rawAds);
      }
    }

    final userType = sharedPreferences?.getString("typeOfUser");
    final bool isTenant = userType == "tenant" || userType == "مستأجر";

    if (ads.isNotEmpty) {
      if (isTenant) {
        adsModel = AdsModel.fromJson(ads);
        fetchHetState();
      } else {
        adsOwnerModel = AdsOwnerModel.fromJson(ads);
      }
    }

    super.onInit();
  }
}
