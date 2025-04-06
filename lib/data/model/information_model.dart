class InformationModel {
  int? id;
  String? title;
  String? text;
  String? featureImage;
  String? createdAt;

  InformationModel(
      {this.id, this.title, this.text, this.featureImage, this.createdAt});

  InformationModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    text = json['text'];
    featureImage = json['feature_image'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['text'] = text;
    data['feature_image'] = featureImage;
    data['created_at'] = createdAt;
    return data;
  }
}
