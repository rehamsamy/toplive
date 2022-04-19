class UserModel {
  bool? success;
  Data? data;
  int? code;

  UserModel({this.success, this.data, this.code});

  UserModel.fromJson(Map<String, dynamic> json) {
    if (json["success"] is bool) success = json["success"];
    if (json["data"] is Map) {
      data = json["data"] == null ? null : Data.fromJson(json["data"]);
    }
    if (json["code"] is int) code = json["code"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["success"] = success;
    if (this.data != null) data["data"] = this.data?.toJson();
    data["code"] = code;
    return data;
  }
}

class Data {
  int? id;
  String? userId;
  String? name;
  String? phone;
  String? email;
  String? image;
  Country? country;
  String? gender;
  String? birthDate;
  dynamic profileStatus;

  Data(
      {this.id,
      this.userId,
      this.name,
      this.phone,
      this.email,
      this.image,
      this.country,
      this.gender,
      this.birthDate,
      this.profileStatus});

  Data.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) id = json["id"];
    if (json["user_id"] is String) userId = json["user_id"];
    if (json["name"] is String) name = json["name"];
    if (json["phone"] is String) phone = json["phone"];
    if (json["email"] is String) email = json["email"];
    if (json["image"] is String) image = json["image"];
    if (json["country"] is Map) {
      country =
          json["country"] == null ? null : Country.fromJson(json["country"]);
    }
    if (json["gender"] is String) gender = json["gender"];
    if (json["birth_date"] is String) birthDate = json["birth_date"];
    profileStatus = json["profile_status"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["user_id"] = userId;
    data["name"] = name;
    data["phone"] = phone;
    data["email"] = email;
    data["image"] = image;
    if (country != null) data["country"] = country?.toJson();
    data["gender"] = gender;
    data["birth_date"] = birthDate;
    data["profile_status"] = profileStatus;
    return data;
  }
}

class Country {
  int? id;
  String? name;
  String? phonecode;
  String? flag;

  Country({this.id, this.name, this.phonecode, this.flag});

  Country.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) id = json["id"];
    if (json["name"] is String) name = json["name"];
    if (json["phonecode"] is String) phonecode = json["phonecode"];
    if (json["flag"] is String) flag = json["flag"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["phonecode"] = phonecode;
    data["flag"] = flag;
    return data;
  }
}
