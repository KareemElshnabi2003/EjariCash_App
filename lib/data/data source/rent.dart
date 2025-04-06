import 'package:ejary_cash/core/class/api.dart';
import 'package:ejary_cash/core/constant/api_linkes.dart';
import 'package:ejary_cash/main.dart';

class RentRemoteData {
  Api api;
  RentRemoteData(this.api);
  rentPartener(token, partenerId, yearPrice, notes, date, location) async {
    var response = await api.postData(AppLinks.rentLink, {
      "Accept": "application/json",
      "Lang": sharedPreferences!.getString("local") == "en" ? "en" : "ar",
      'authorization': 'Bearer $token',
      'Content-Type': 'application/json; charset=UTF-8'
    }, {
      "model_id": partenerId,
      "yearly_rent": yearPrice,
      "notes": notes,
      "type": "partner_project",
      "move_date": date,
      "location": location
    });
    return response.fold((l) => l, (r) => r);
  }

  //personal
  rentPersonal(token, cityrId, yearPrice, areaId, phone, notes, location,
      paymentPlan, name, brokerName, agree) async {
    var response = await api.postData(AppLinks.rentLink, {
      "Accept": "application/json",
      "Lang": sharedPreferences!.getString("local") == "en" ? "en" : "ar",
      'authorization': 'Bearer $token',
      'Content-Type': 'application/json; charset=UTF-8'
    }, {
      "city_id": cityrId,
      "yearly_rent": yearPrice,
      "notes": notes,
      "type": "personal_project",
      "broker_whatsapp_phone": phone,
      "location": location,
      "area_id": areaId,
      "payment_plan": paymentPlan,
      "name": name,
      "broker_name": brokerName,
      "broker_agree": agree
    });
    return response.fold((l) => l, (r) => r);
  }

  //own ads
  rentOwnAds(token, date, name, email, mobile, adsId,yearlyRent) async {
    var response = await api.postData(AppLinks.rentLink, {
      "Accept": "application/json",
      "Lang": sharedPreferences!.getString("local") == "en" ? "en" : "ar",
      'authorization': 'Bearer $token',
      'Content-Type': 'application/json; charset=UTF-8'
    }, {
      "payment_plan": "1",
      "yearly_rent": yearlyRent,
      "type": "owner_ads",
      "model_id": adsId,
      "move_date": date,
      "name": name,
      "email": email,
      "mobile": mobile,
    });
    return response.fold((l) => l, (r) => r);
  }

  getMyRents(
    token,
  ) async {
    var response = await api.getData(
      AppLinks.myRentsLink,
      {
        "Accept": "application/json",
        "Lang": sharedPreferences!.getString("local") == "en" ? "en" : "ar",
        'authorization': 'Bearer $token',
      },
    );
    return response.fold((l) => l, (r) => r);
  }
}
