import 'package:ejary_cash/core/class/api.dart';
import 'package:ejary_cash/core/constant/api_linkes.dart';
import 'package:ejary_cash/main.dart';

class WhyEjaryRemoteData {
  Api api;
  WhyEjaryRemoteData(this.api);
  Future<dynamic> getInformation() async {
    var response = await api.getData(AppLinks.whyEjaryLink, {
      "Accept": "application/json",
      "Lang": sharedPreferences!.getString("local")=="en"?"en":"ar",
    });
    return response.fold((l) => l, (r) => r);
  }
}
