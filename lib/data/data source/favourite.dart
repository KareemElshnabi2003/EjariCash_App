import 'package:ejary_cash/core/class/api.dart';
import 'package:ejary_cash/core/constant/api_linkes.dart';
import 'package:ejary_cash/main.dart';

class FavouriteRemoteData {
  Api api;
  FavouriteRemoteData(this.api);
  addAndDeleteFav(adsId, token) async {
    var response = await api.postData("${AppLinks.addAndDeleteFav}$adsId", {
      "Accept": "application/json",
      "Lang": sharedPreferences!.getString("local") == "en" ? "en" : "ar",
      'authorization': 'Bearer $token',
      'Content-Type': 'application/json; charset=UTF-8'
    }, {});
    return response.fold((l) => l, (r) => r);
  }

  getFavouriteItems(token) async {
    var response = await api.getData(
      AppLinks.getFavouriteItems,
      {
        "Accept": "application/json",
        "Lang": sharedPreferences!.getString("local") == "en" ? "en" : "ar",
        'authorization': 'Bearer $token'
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}
