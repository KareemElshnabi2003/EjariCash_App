class FAQModel {
  int? id;
  String? question;
  String? answer;
  String? createdAt;

  FAQModel({this.id, this.question, this.answer, this.createdAt});

  FAQModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    question = json['question'];
    answer = json['answer'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['question'] = question;
    data['answer'] = answer;
    data['created_at'] = createdAt;
    return data;
  }
}
