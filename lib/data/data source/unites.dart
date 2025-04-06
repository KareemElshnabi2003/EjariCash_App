import 'dart:io';

import 'package:ejary_cash/core/class/api.dart';
import 'package:ejary_cash/core/constant/api_linkes.dart';
import 'package:ejary_cash/main.dart';

class AdsRemoteData {
  Api api;
  AdsRemoteData(this.api);
  getAllAds() async {
    var response = await api.getData(
      AppLinks.getAllUnitesLink,
      {"Accept": "application/json",  "Lang": sharedPreferences!.getString("local")=="en"?"en":"ar",},
    );
    return response.fold((l) => l, (r) => r);
  }

  getAllAdsOwner(token) async {
    var response = await api.getData(
      AppLinks.getAllUnitesOwnerLink,
      {
        "Accept": "application/json",
 "Lang": sharedPreferences!.getString("local")=="en"?"en":"ar",        'authorization': 'Bearer $token',
      },
    );
    return response.fold((l) => l, (r) => r);
  }

  getAdsHome(token) async {
    var response = await api.getData(
      AppLinks.getAdsHomeLink,
      {
        "Accept": "application/json",
 "Lang": sharedPreferences!.getString("local")=="en"?"en":"ar",      },
    );
    return response.fold((l) => l, (r) => r);
  }

  //report
  makeReport(String token, String id, String reson, String message) async {
    var response = await api.postData("${AppLinks.makeReportLink}/$id/report", {
      "Accept": "application/json",
 "Lang": sharedPreferences!.getString("local")=="en"?"en":"ar",      'authorization': 'Bearer $token',
      'Content-Type': 'application/json; charset=UTF-8'
    }, {
      "reason": reson,
      "message": message
    });
    return response.fold((l) => l, (r) => r);
  }

  //filter ads
  filterAds(String token, String priceType, String numRoom, fromPrice,
      toPrice) async {
    var response = await api.getData(
        numRoom == "0"
            ? "${AppLinks.getAllUnitesLink}?in_home=no&price_type=$priceType &from_price=$fromPrice&to_price=$toPrice"
            : "${AppLinks.getAllUnitesLink}?in_home=no&price_type=$priceType&$numRoom&from_price=$fromPrice&to_price=$toPrice",
        {
          "Accept": "application/json",
 "Lang": sharedPreferences!.getString("local")=="en"?"en":"ar",          // 'authorization': 'Bearer $token',
          'Content-Type': 'application/json; charset=UTF-8'
        });
    return response.fold((l) => l, (r) => r);
  }

  filterAdsOwner(String token, String priceType, String numRoom, fromPrice,
      toPrice) async {
    var response = await api.getData(
        numRoom == "0"
            ? "${AppLinks.getAllUnitesOwnerLink}?in_home=no&price_type=$priceType&from_price=$fromPrice&to_price=$toPrice"
            : "${AppLinks.getAllUnitesOwnerLink}?in_home=no&price_type=$priceType&$numRoom&from_price=$fromPrice&to_price=$toPrice",
        {
          "Accept": "application/json",
 "Lang": sharedPreferences!.getString("local")=="en"?"en":"ar",          'authorization': 'Bearer $token',
          'Content-Type': 'application/json; charset=UTF-8'
        });
    return response.fold((l) => l, (r) => r);
  }

  //add ads
  addAdsOwner(
      String token,
      String typeAds,
      String nameAds,
      deadNum,
      areaNum,
      description,
      buildingNum,
      zipCode,
      anotherNum,
      face,
      streatWidth,
      price,
      insuranceAmount,
      roomNum,
      liftsNum,
      parkingNum,
      bathroomNum,
      propertyAge,
      renterPrefere,
      additionPrivacy,
      List<String> facilites,
      File? image,
      List<File> document,
      loginWay,
      catId,
      cityId,
      areaId) async {
    var response = await api.postRequestwithfile(
        AppLinks.addAdsOwnerLink,
        {
          "type": typeAds,
          "name_ar": nameAds,
          "deed_number": deadNum,
          "area_name": areaNum,
          "description_ar": description,
          "building_no": buildingNum,
          "zip_code": zipCode,
          "another_number": anotherNum,
          "facade": face,
          "street_width": streatWidth,
          "price": price,
          "insurance_amount": insuranceAmount,
          "bedrooms_no": roomNum,
          "lifts_no": liftsNum,
          "parking_no": parkingNum,
          "bathrooms_no": bathroomNum,
          "property_age": propertyAge,
          "renter_preference": renterPrefere,
          "additional_conditions": additionPrivacy,
          "facilities[]": facilites,
          "login_by": loginWay,
          "category_id": catId,
          "city_id": cityId,
          "area_id": areaId
        },
        document,
        image,
        token);
    return response.fold((l) => l, (r) => r);
  }

  addAdsBroker(
      String token,
      String typeAds,
      String nameAds,
      adNum,
      areaNum,
      description,
      buildingNum,
      zipCode,
      anotherNum,
      face,
      streatWidth,
      price,
      valNum,
      roomNum,
      liftsNum,
      parkingNum,
      bathroomNum,
      propertyAge,
      renterPrefere,
      additionPrivacy,
      List<String> facilites,
      File? image,
      List<File> document,
      loginWay,
      idNum,
      brokerType,
      companyName,
      catId,
      areaId,
      cityId) async {
    var response = await api.postRequestwithfile(
        AppLinks.addAdsBrokerLink,
        {
          "type": typeAds,
          "name_ar": nameAds,
          "ad_number": adNum,
          "area_name": areaNum,
          "description_ar": description,
          "building_no": buildingNum,
          "zip_code": zipCode,
          "another_number": anotherNum,
          "facade": face,
          "street_width": streatWidth,
          "price": price,
          "val_license_number": valNum,
          "bedrooms_no": roomNum,
          "lifts_no": liftsNum,
          "parking_no": parkingNum,
          "bathrooms_no": bathroomNum,
          "property_age": propertyAge,
          "renter_preference": renterPrefere,
          "additional_conditions": additionPrivacy,
          "facilities[]": facilites.join(", "),
          "login_by": loginWay,
          "id_number": idNum,
          "broker_type": brokerType,
          "category_id": catId,
          "company_name": companyName,
          "city_id": cityId,
          "area_id": areaId
        },
        document,
        image,
        token);
    return response.fold((l) => l, (r) => r);
  }
}
