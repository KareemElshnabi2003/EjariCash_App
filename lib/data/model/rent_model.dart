// ignore_for_file: unnecessary_this

class RentModel {
  int? id;
  int? userId;
  String? modelName;
  int? modelId;
  String? projectName;
  int? yearlyRent;
  String? moveDate;
  String? notes;
  String? location;
  int? cityId;
  String? cityName;
  int? areaId;
  String? areaName;
  String? brokerWhatsappPhone;
  String? paymentPlan;
  String? status;
  String? createdAt;

  RentModel(
      {this.id,
      this.userId,
      this.modelName,
      this.modelId,
      this.projectName,
      this.yearlyRent,
      this.moveDate,
      this.notes,
      this.location,
      this.cityId,
      this.cityName,
      this.areaId,
      this.areaName,
      this.brokerWhatsappPhone,
      this.paymentPlan,
      this.status,
      this.createdAt});

  RentModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    modelName = json['model_name'];
    modelId = json['model_id'];
    projectName = json['project_name'];
    yearlyRent = json['yearly_rent'];
    moveDate = json['move_date'];
    notes = json['notes'];
    location = json['location'];
    cityId = json['city_id'];
    cityName = json['city_name'];
    areaId = json['area_id'];
    areaName = json['area_name'];
    brokerWhatsappPhone = json['broker_whatsapp_phone'];
    paymentPlan = json['payment_plan'];
    status = json['status'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['model_name'] = this.modelName;
    data['model_id'] = this.modelId;
    data['project_name'] = this.projectName;
    data['yearly_rent'] = this.yearlyRent;
    data['move_date'] = this.moveDate;
    data['notes'] = this.notes;
    data['location'] = this.location;
    data['city_id'] = this.cityId;
    data['city_name'] = this.cityName;
    data['area_id'] = this.areaId;
    data['area_name'] = this.areaName;
    data['broker_whatsapp_phone'] = this.brokerWhatsappPhone;
    data['payment_plan'] = this.paymentPlan;
    data['status'] = this.status;
    data['created_at'] = this.createdAt;
    return data;
  }
}
