import 'package:ejary_cash/core/class/api.dart';
import 'package:ejary_cash/core/constant/api_linkes.dart';
import 'package:ejary_cash/main.dart';

class OnBoardingRemoteData {
  Api api;
  OnBoardingRemoteData(this.api);
  getInfo() async {
    var response = await api.getData(
      AppLinks.onBoardingInfo,
      {"Accept": "application/json",          "Lang":sharedPreferences!.getString("local")=="en"?"en":"ar",

},
    );
    return response.fold((l) => l, (r) => r);
  }
}
