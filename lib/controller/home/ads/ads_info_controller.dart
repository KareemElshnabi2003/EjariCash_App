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
    htmlData = adsModel!.description ?? "";
    update();
  }

  setFav() {
    if (isFav == false) {
      isFav = true;
      update();
    } else {
      isFav = false;
      update();
    }
  }

  @override
  void onInit() {
    ads = Get.arguments["AdsInfo"];

    sharedPreferences!.getString("typeOfUser") == "مستأجر"
        ? adsModel = AdsModel.fromJson(ads)
        : adsOwnerModel = AdsOwnerModel.fromJson(ads);
    sharedPreferences!.getString("typeOfUser") == "مستأجر"
        ? fetchHetState()
        : null;
    super.onInit();
  }
}
