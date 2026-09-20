import 'package:ejary_cash/core/class/api.dart';
import 'package:ejary_cash/core/constant/api_linkes.dart';
import 'package:ejary_cash/main.dart';

class SettingRemoteData {
  Api api;
  SettingRemoteData(this.api);
  Future<dynamic> getSetting() async {
    var response = await api.getData(
      AppLinks.getSettingLink,
      {"Accept": "application/json", "Lang":sharedPreferences!.getString("local")=="en"?"en":"ar"},
    );
    return response.fold((l) => l, (r) => r);
  }

  Future<dynamic> getFAQ() async {
    var response = await api.getData(
      AppLinks.getFAQLink,
      {"Accept": "application/json", "Lang": sharedPreferences!.getString("local")=="en"?"en":"ar"},
    );
    return response.fold((l) => l, (r) => r);
  }

  Future<dynamic> getCities(int cityId) async {
    var response = await api.getData(
      "${AppLinks.getCitiesLink}?city_id=$cityId",
      {"Accept": "application/json",  "Lang": sharedPreferences!.getString("local")=="en"?"en":"ar",},
    );
    return response.fold((l) => l, (r) => r);
  }
  
  Future<dynamic> getDistricts(int cityId) async {
    var response = await api.getData(
      "${AppLinks.getCitiesLink}?district_id=$cityId",
      {"Accept": "application/json",  "Lang": sharedPreferences!.getString("local")=="en"?"en":"ar",},
    );
    return response.fold((l) => l, (r) => r);
  }

  Future<dynamic> getAreas() async {
    var response = await api.getData(
      AppLinks.getAreasLink,
      {"Accept": "application/json", "Lang": sharedPreferences!.getString("local")=="en"?"en":"ar",},
    );
    return response.fold((l) => l, (r) => r);
  }

   Future<dynamic> getCategories() async {
    var response = await api.getData(
      AppLinks.getCategoriesLink,
      {"Accept": "application/json", "Lang": sharedPreferences!.getString("local")=="en"?"en":"ar",},
    );
    return response.fold((l) => l, (r) => r);
  }
}
