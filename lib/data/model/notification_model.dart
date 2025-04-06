class NotificationModel {
  String? type;
  String? id;
  Data? data;
  String? createdAt;

  NotificationModel({this.type, this.id, this.data, this.createdAt});

  NotificationModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    id = json['id'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['type'] = type;
    data['id'] = id;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['created_at'] = createdAt;
    return data;
  }
}

class Data {
  String? title;
  String? text;
  String? createdAt;
  Data? data;

  Data({this.title, this.text, this.createdAt, this.data});

  Data.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    text = json['text'];
    createdAt = json['created_at'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['text'] = text;
    data['created_at'] = createdAt;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class DataNotify {
  int? notificationType;
  int? requestId;

  DataNotify({this.notificationType, this.requestId});

  DataNotify.fromJson(Map<String, dynamic> json) {
    notificationType = json['notification_type'];
    requestId = json['request_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['notification_type'] = notificationType;
    data['request_id'] = requestId;
    return data;
  }
}
