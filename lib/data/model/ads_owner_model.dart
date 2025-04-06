import 'package:ejary_cash/data/model/ads_model.dart';

class AdsOwnerModel {
  int? id;
  String? name;
  String? description;
  int? categoryId;
  String? categoryName;
  String? facade;
  String? yearBuilt;
  String? streetWidth;
  int? bathroomsNo;
  int? bedroomsNo;
  String? location;
  String? isInHome;
  String? width;
  int? price;
  String? priceType;
  String? barcode;
  int? cityId;
  String? cityName;
  int? areaId;
  String? areaName;
  String? status;
  String? productImage;
  List<Imgaes>? imgaes;
  String? createdAt;
  ProductSpecificationData? productSpecificationData;

  AdsOwnerModel(
      {this.id,
      this.name,
      this.description,
      this.categoryId,
      this.categoryName,
      this.facade,
      this.yearBuilt,
      this.streetWidth,
      this.bathroomsNo,
      this.bedroomsNo,
      this.location,
      this.isInHome,
      this.width,
      this.price,
      this.priceType,
      this.barcode,
      this.cityId,
      this.cityName,
      this.areaId,
      this.areaName,
      this.status,
      this.productImage,
      this.imgaes,
      this.createdAt,
      this.productSpecificationData});

  AdsOwnerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    facade = json['facade'];
    yearBuilt = json['year_built'];
    streetWidth = json['street_width'];
    bathroomsNo = json['bathrooms_no'];
    bedroomsNo = json['bedrooms_no'];
    location = json['location'];
    isInHome = json['is_in_home'];
    width = json['width'];
    price = json['price'];
    priceType = json['price_type'];
    barcode = json['barcode'];
    cityId = json['city_id'];
    cityName = json['city_name'];
    areaId = json['area_id'];
    areaName = json['area_name'];
    status = json['status'];
    productImage = json['product_image'];
    if (json['imgaes'] != null) {
      imgaes = <Imgaes>[];
      json['imgaes'].forEach((v) {
        imgaes!.add(Imgaes.fromJson(v));
      });
    }
    createdAt = json['created_at'];
    productSpecificationData = json['product_specification_data'] != null
        ? ProductSpecificationData.fromJson(json['product_specification_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['category_id'] = categoryId;
    data['category_name'] = categoryName;
    data['facade'] = facade;
    data['year_built'] = yearBuilt;
    data['street_width'] = streetWidth;
    data['bathrooms_no'] = bathroomsNo;
    data['bedrooms_no'] = bedroomsNo;
    data['location'] = location;
    data['is_in_home'] = isInHome;
    data['width'] = width;
    data['price'] = price;
    data['price_type'] = priceType;
    data['barcode'] = barcode;
    data['city_id'] = cityId;
    data['city_name'] = cityName;
    data['area_id'] = areaId;
    data['area_name'] = areaName;
    data['status'] = status;
    data['product_image'] = productImage;
    if (imgaes != null) {
      data['imgaes'] = imgaes!.map((v) => v.toJson()).toList();
    }
    data['created_at'] = createdAt;
    if (productSpecificationData != null) {
      data['product_specification_data'] = productSpecificationData!.toJson();
    }
    return data;
  }
}

class ProductSpecificationData {
  int? id;
  int? addedBy;
  String? addedByName;
  int? addedByMobile;
  String? userType;
  String? type;
  String? buildingNo;
  String? anotherNumber;
  String? zipCode;
  String? insuranceAmount;
  String? renterPreference;
  String? deedNumber;
  String? loginBy;
  String? additionalConditions;
  String? propertyAge;
  String? facilities;
  String? brokerType;
  String? companyName;
  String? idNumber;
  String? adNumber;
  String? valLicenseNumber;
  String? createdAt;

  ProductSpecificationData(
      {this.id,
      this.addedBy,
      this.addedByName,
      this.addedByMobile,
      this.userType,
      this.type,
      this.buildingNo,
      this.anotherNumber,
      this.zipCode,
      this.insuranceAmount,
      this.renterPreference,
      this.deedNumber,
      this.loginBy,
      this.additionalConditions,
      this.propertyAge,
      this.facilities,
      this.brokerType,
      this.companyName,
      this.idNumber,
      this.adNumber,
      this.valLicenseNumber,
      this.createdAt});

  ProductSpecificationData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    addedBy = json['added_by'];
    addedByName = json['added_by_name'];
    addedByMobile = json['added_by_mobile'];
    userType = json['user_type'];
    type = json['type'];
    buildingNo = json['building_no'];
    anotherNumber = json['another_number'];
    zipCode = json['zip_code'].toString();
    insuranceAmount = json['insurance_amount'];
    renterPreference = json['renter_preference'];
    deedNumber = json['deed_number'];
    loginBy = json['login_by'];
    additionalConditions = json['additional_conditions'];
    propertyAge = json['property_age'];
    facilities = json['facilities'];
    brokerType = json['broker_type'];
    companyName = json['company_name'];
    idNumber = json['id_number'];
    adNumber = json['ad_number'];
    valLicenseNumber = json['val_license_number'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['added_by'] = addedBy;
    data['added_by_name'] = addedByName;
    data['added_by_mobile'] = addedByMobile;
    data['user_type'] = userType;
    data['type'] = type;
    data['building_no'] = buildingNo;
    data['another_number'] = anotherNumber;
    data['zip_code'] = zipCode;
    data['insurance_amount'] = insuranceAmount;
    data['renter_preference'] = renterPreference;
    data['deed_number'] = deedNumber;
    data['login_by'] = loginBy;
    data['additional_conditions'] = additionalConditions;
    data['property_age'] = propertyAge;
    data['facilities'] = facilities;
    data['broker_type'] = brokerType;
    data['company_name'] = companyName;
    data['id_number'] = idNumber;
    data['ad_number'] = adNumber;
    data['val_license_number'] = valLicenseNumber;
    data['created_at'] = createdAt;
    return data;
  }
}
