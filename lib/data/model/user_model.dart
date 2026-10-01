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

  UserModel({
    this.id,
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
    this.monthlyRent,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'] is int ? json['id'] : int.tryParse(json['id']?.toString() ?? '');
    name = json['name']?.toString();
    accountType = json['account_type']?.toString();
    email = json['email']?.toString();
    countryCode = json['country_code']?.toString();
    mobile = json['mobile']?.toString();
    status = json['status']?.toString();
    code = json['code']?.toString();
    emailVerifiedAt = json['email_verified_at']?.toString();
    birthdate = json['birthdate']?.toString();
    linkedinLink = json['linkedin_link']?.toString();
    bio = json['bio']?.toString();
    photoProfile = json['photo_profile']?.toString();
    createdAt = json['created_at']?.toString();
    token = json['token']?.toString();
    fcmId = json['fcm_id']?.toString();
    ownerAdsCount = json['owner_ads_count'] != null ? json['owner_ads_count'].toString() : "0";
    ownerFavAdsCount = json['owner_fav_ads_count'] != null ? json['owner_fav_ads_count'].toString() : "0";
    ownerViewsAdsCount = json['owner_views_ads_count'] != null ? json['owner_views_ads_count'].toString() : "0";
    monthlyRent = json['monthly_rent']?.toString();
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
