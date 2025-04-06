class OnBoardingModel {
  int? id;
  String? title;
  String? bannerImage;
  String? createdAt;

  OnBoardingModel({this.id, this.title, this.bannerImage, this.createdAt});

  OnBoardingModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    bannerImage = json['banner_image'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['banner_image'] = bannerImage;
    data['created_at'] = createdAt;
    return data;
  }
}
