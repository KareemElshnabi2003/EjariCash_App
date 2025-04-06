class MonthlyEjarModel {
  String? userId;
  String? noIndividuals;
  String? jobType;
  String? salary;
  String? nationality;
  String? marriage;
  String? age;
  String? monthlyObligations;
  String? education;
  String? updatedAt;
  String? createdAt;
  int? id;
  double? expectedMonthlyRent;

  MonthlyEjarModel(
      {this.userId,
      this.noIndividuals,
      this.jobType,
      this.salary,
      this.nationality,
      this.marriage,
      this.age,
      this.monthlyObligations,
      this.education,
      this.updatedAt,
      this.createdAt,
      this.id,
      this.expectedMonthlyRent});

  MonthlyEjarModel.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'].toString();
    noIndividuals = json['no_individuals'];
    jobType = json['job_type'];
    salary = json['salary'];
    nationality = json['nationality'];
    marriage = json['marriage'];
    age = json['age'];
    monthlyObligations = json['monthly_obligations'];
    education = json['education'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
    expectedMonthlyRent = json['expected_monthly_rent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['no_individuals'] = noIndividuals;
    data['job_type'] = jobType;
    data['salary'] = salary;
    data['nationality'] = nationality;
    data['marriage'] = marriage;
    data['age'] = age;
    data['monthly_obligations'] = monthlyObligations;
    data['education'] = education;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    data['expected_monthly_rent'] = expectedMonthlyRent;
    return data;
  }
}
