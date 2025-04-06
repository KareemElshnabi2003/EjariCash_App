class OrderInfoModel {
  int? id;
  int? userId;
  String? modelName;
  int? modelId;
  String? projectName;
  int? yearlyRent;
  String? moveDate;
  String? notes;
  String? location;
  int? areaId;
  String? areaName;
  int? cityId;
  String? cityName;
  int? districtId;
  String? districtName;
  String? brokerAgree;
  String? brokerName;
  String? brokerWhatsappPhone;
  String? paymentPlan;
  String? status;
  String? mobile;
  String? name;
  String? email;
  String? createdAt;

  OrderInfoModel(
      {this.id,
      this.userId,
      this.modelName,
      this.modelId,
      this.projectName,
      this.yearlyRent,
      this.moveDate,
      this.notes,
      this.location,
      this.areaId,
      this.areaName,
      this.cityId,
      this.cityName,
      this.districtId,
      this.districtName,
      this.brokerAgree,
      this.brokerName,
      this.brokerWhatsappPhone,
      this.paymentPlan,
      this.status,
      this.mobile,
      this.name,
      this.email,
      this.createdAt});

  OrderInfoModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    modelName = json['model_name'];
    modelId = json['model_id'];
    projectName = json['project_name'];
    yearlyRent = json['yearly_rent'];
    moveDate = json['move_date'];
    notes = json['notes'];
    location = json['location'];
    areaId = json['area_id'];
    areaName = json['area_name'];
    cityId = json['city_id'];
    cityName = json['city_name'];
    districtId = json['district_id'];
    districtName = json['district_name'];
    brokerAgree = json['broker_agree'];
    brokerName = json['broker_name'];
    brokerWhatsappPhone = json['broker_whatsapp_phone'];
    paymentPlan = json['payment_plan'];
    status = json['status'];
    mobile = json['mobile'];
    name = json['name'];
    email = json['email'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['model_name'] = modelName;
    data['model_id'] = modelId;
    data['project_name'] = projectName;
    data['yearly_rent'] = yearlyRent;
    data['move_date'] = moveDate;
    data['notes'] = notes;
    data['location'] = location;
    data['area_id'] = areaId;
    data['area_name'] = areaName;
    data['city_id'] = cityId;
    data['city_name'] = cityName;
    data['district_id'] = districtId;
    data['district_name'] = districtName;
    data['broker_agree'] = brokerAgree;
    data['broker_name'] = brokerName;
    data['broker_whatsapp_phone'] = brokerWhatsappPhone;
    data['payment_plan'] = paymentPlan;
    data['status'] = status;
    data['mobile'] = mobile;
    data['name'] = name;
    data['email'] = email;
    data['created_at'] = createdAt;
    return data;
  }
}
