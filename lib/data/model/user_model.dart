class UserModel {
  int? id;
  String? name;
  String? accountType;
  String? email;
  String? countryCode;
  String? mobile;
  String? status;
  String? code;
  String? emailVerifiedAt;
  String? birthdate;
  String? linkedinLink;
  String? bio;
  String? photoProfile;
  String? createdAt;
  String? token;
  String? fcmId;
  String? ownerAdsCount;
  String? ownerFavAdsCount;
  String? ownerViewsAdsCount;
  String? monthlyRent;

  UserModel(
      {this.id,
      this.name,
      this.accountType,
      this.email,
      this.countryCode,
      this.mobile,
      this.status,
      this.code,
      this.emailVerifiedAt,
      this.birthdate,
      this.linkedinLink,
      this.bio,
      this.photoProfile,
      this.createdAt,
      this.token,
      this.fcmId,
      this.ownerAdsCount,
      this.ownerFavAdsCount,
      this.ownerViewsAdsCount,
      this.monthlyRent});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    accountType = json['account_type'];
    email = json['email'];
    countryCode = json['country_code'];
    mobile = json['mobile'];
    status = json['status'];
    code = json['code'].toString();
    emailVerifiedAt = json['email_verified_at'];
    birthdate = json['birthdate'];
    linkedinLink = json['linkedin_link'];
    bio = json['bio'];
    photoProfile = json['photo_profile'];
    createdAt = json['created_at'];
    token = json['token'];
    fcmId = json['fcm_id'];
    ownerAdsCount = json['owner_ads_count'].toString();
    ownerFavAdsCount = json['owner_fav_ads_count'].toString();
    ownerViewsAdsCount = json['owner_views_ads_count'].toString();
    monthlyRent = json['monthly_rent'].toString();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['account_type'] = accountType;
    data['email'] = email;
    data['country_code'] = countryCode;
    data['mobile'] = mobile;
    data['status'] = status;
    data['code'] = code;
    data['email_verified_at'] = emailVerifiedAt;
    data['birthdate'] = birthdate;
    data['linkedin_link'] = linkedinLink;
    data['bio'] = bio;
    data['photo_profile'] = photoProfile;
    data['created_at'] = createdAt;
    data['token'] = token;
    data['fcm_id'] = fcmId;
    data['owner_ads_count'] = ownerAdsCount;
    data['owner_fav_ads_count'] = ownerFavAdsCount;
    data['owner_views_ads_count'] = ownerViewsAdsCount;
    data['monthly_rent'] = monthlyRent;
    return data;
  }
}
