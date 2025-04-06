import 'package:ejary_cash/core/class/api.dart';
import 'package:ejary_cash/core/constant/api_linkes.dart';
import 'package:ejary_cash/main.dart';

class MonthluEjarRemoteData {
  Api api;
  MonthluEjarRemoteData(this.api);
  monthlyEjar( token,familyNum,jopType,salary,nationality,marriage,age,monthlyObligations,education) async {
    var response = await api.postData(AppLinks.monthlyEjarLink, {
      "Accept": "application/json",
      "Lang":sharedPreferences!.getString("local")=="en"?"en":"ar",
      'authorization': 'Bearer $token',
       'Content-Type': 'application/json; charset=UTF-8'
    }, {

"no_individuals":familyNum,
"job_type":jopType,
"salary":salary,
"nationality":nationality,
"marriage":marriage,
"age":age,

"monthly_obligations":monthlyObligations,
"education":education




    });
    return response.fold((l) => l, (r) => r);
  }
}
