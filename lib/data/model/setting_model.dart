class SettingModel {
  String? email;
  String? phone;
  String? whatsappPhone;
  String? whatsappBusiness;
  String? dayWork;
  String? timeWork;
  String? privacy;
  String? address;
  String? logo;
  String? aboutus;

  SettingModel(
      {this.email,
      this.phone,
      this.whatsappPhone,
      this.whatsappBusiness,
      this.dayWork,
      this.timeWork,
      this.privacy,
      this.address,
      this.logo,
      this.aboutus});

  SettingModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    phone = json['phone'];
    whatsappPhone = json['whatsapp_phone'];
    whatsappBusiness = json['whatsapp_business'];
    dayWork = json['day_work'];
    timeWork = json['time_work'];
    privacy = json['privacy'];
    address = json['address'];
    logo = json['logo'];
    aboutus = json['aboutus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['email'] = email;
    data['phone'] = phone;
    data['whatsapp_phone'] = whatsappPhone;
    data['whatsapp_business'] = whatsappBusiness;
    data['day_work'] = dayWork;
    data['time_work'] = timeWork;
    data['privacy'] = privacy;
    data['address'] = address;
    data['logo'] = logo;
    data['aboutus'] = aboutus;
    return data;
  }
}
