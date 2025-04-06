class ProjectModel {
  int? id;
  String? name;
  String? description;
  String? projectLink;
  int? partnerId;
  String? partnerName;
  int? cityId;
  String? cityName;
  int? areaId;
  String? areaName;
  String? projectImage;
  String? projectCatalogue;
  String? createdAt;

  ProjectModel(
      {this.id,
      this.name,
      this.description,
      this.projectLink,
      this.partnerId,
      this.partnerName,
      this.cityId,
      this.cityName,
      this.areaId,
      this.areaName,
      this.projectImage,
      this.projectCatalogue,
      this.createdAt});

  ProjectModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    projectLink = json['project_link'];
    partnerId = json['partner_id'];
    partnerName = json['partner_name'];
    cityId = json['city_id'];
    cityName = json['city_name'];
    areaId = json['area_id'];
    areaName = json['area_name'];
    projectImage = json['project_image'];
    projectCatalogue = json['project_catalogue'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['description'] = description;
    data['project_link'] = projectLink;
    data['partner_id'] = partnerId;
    data['partner_name'] = partnerName;
    data['city_id'] = cityId;
    data['city_name'] = cityName;
    data['area_id'] = areaId;
    data['area_name'] = areaName;
    data['project_image'] = projectImage;
    data['project_catalogue'] = projectCatalogue;
    data['created_at'] = createdAt;
    return data;
  }
}
