class UserLoginModel {
  bool? success;
  Data? data;
  int? code;

  UserLoginModel({this.success, this.data, this.code});

  UserLoginModel.fromJson(Map<String, dynamic> json) {
    success = json["success"];
    data = json["data"] == null ? null : Data.fromJson(json["data"]);
    code = json["code"];
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
  User? user;
  String? accessToken;

  Data({this.user, this.accessToken});

  Data.fromJson(Map<String, dynamic> json) {
    user = json["user"] == null ? null : User.fromJson(json["user"]);
    accessToken = json["access_token"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (user != null) data["user"] = user?.toJson();
    data["access_token"] = accessToken;
    return data;
  }
}

class User {
  int? id;
  String? userId;
  dynamic name;
  String? phone;
  dynamic email;
  String? image;
  Country? country;
  dynamic gender;
  dynamic birthDate;
  dynamic profileStatus;

  User(
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

  User.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    userId = json["user_id"];
    name = json["name"];
    phone = json["phone"];
    email = json["email"];
    image = json["image"];
    country =
        json["country"] == null ? null : Country.fromJson(json["country"]);
    gender = json["gender"];
    birthDate = json["birth_date"];
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
    id = json["id"];
    name = json["name"];
    phonecode = json["phonecode"];
    flag = json["flag"];
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
