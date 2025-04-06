import 'package:ejary_cash/core/class/api.dart';
import 'package:ejary_cash/core/constant/api_linkes.dart';
import 'package:ejary_cash/main.dart';

class SettingRemoteData {
  Api api;
  SettingRemoteData(this.api);
  getSetting() async {
    var response = await api.getData(
      AppLinks.getSettingLink,
      {"Accept": "application/json", "Lang":sharedPreferences!.getString("local")=="en"?"en":"ar"},
    );
    return response.fold((l) => l, (r) => r);
  }

  getFAQ() async {
    var response = await api.getData(
      AppLinks.getFAQLink,
      {"Accept": "application/json", "Lang": sharedPreferences!.getString("local")=="en"?"en":"ar"},
    );
    return response.fold((l) => l, (r) => r);
  }

  getCities(int cityId) async {
    var response = await api.getData(
      "${AppLinks.getCitiesLink}?city_id=$cityId",
      {"Accept": "application/json",  "Lang": sharedPreferences!.getString("local")=="en"?"en":"ar",},
    );
    return response.fold((l) => l, (r) => r);
  }
  
  getDistricts(int cityId) async {
    var response = await api.getData(
      "${AppLinks.getCitiesLink}?district_id=$cityId",
      {"Accept": "application/json",  "Lang": sharedPreferences!.getString("local")=="en"?"en":"ar",},
    );
    return response.fold((l) => l, (r) => r);
  }

  getAreas() async {
    var response = await api.getData(
      AppLinks.getAreasLink,
      {"Accept": "application/json", "Lang": sharedPreferences!.getString("local")=="en"?"en":"ar",},
    );
    return response.fold((l) => l, (r) => r);
  }

   getCategories() async {
    var response = await api.getData(
      AppLinks.getCategoriesLink,
      {"Accept": "application/json", "Lang": sharedPreferences!.getString("local")=="en"?"en":"ar",},
    );
    return response.fold((l) => l, (r) => r);
  }
}
