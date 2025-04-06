class PartenerModel {
  int? id;
  String? name;
  String? partnerImage;
  String? website;
  String? whatsappPhone;
  String? createdAt;

  PartenerModel(
      {this.id,
      this.name,
      this.partnerImage,
      this.website,
      this.whatsappPhone,
      this.createdAt});

  PartenerModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    partnerImage = json['partner_image'];
    website = json['website'];
    whatsappPhone = json['whatsapp_phone'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['partner_image'] = partnerImage;
    data['website'] = website;
    data['whatsapp_phone'] = whatsappPhone;
    data['created_at'] = createdAt;
    return data;
  }
}
