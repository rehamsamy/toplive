class FriendsListModel {
  bool? success;
  List<Data>? data;
  int? code;

  FriendsListModel({this.success, this.data, this.code});

  FriendsListModel.fromJson(Map<String, dynamic> json) {
    success = json["success"];
    data = json["data"] == null
        ? null
        : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
    code = json["code"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["success"] = success;
    if (this.data != null) {
      data["data"] = this.data?.map((e) => e.toJson()).toList();
    }
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
