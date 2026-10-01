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
