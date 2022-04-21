class MyRoomModel {
  bool? success;
  Data? data;
  int? code;

  MyRoomModel({this.success, this.data, this.code});

  MyRoomModel.fromJson(Map<String, dynamic> json) {
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
  User? user;
  String? roomName;
  String? roomImage;
  RoomCountry? roomCountry;
  String? description;
  String? roomStatus;
  String? category;
  int? microphones;
  List<JoinedUsers>? joinedUsers;
  bool? joined;

  Data(
      {this.id,
      this.user,
      this.roomName,
      this.roomImage,
      this.roomCountry,
      this.description,
      this.roomStatus,
      this.category,
      this.microphones,
      this.joinedUsers,
      this.joined});

  Data.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) id = json["id"];
    if (json["user"] is Map) {
      user = json["user"] == null ? null : User.fromJson(json["user"]);
    }
    if (json["room_name"] is String) roomName = json["room_name"];
    if (json["room_image"] is String) roomImage = json["room_image"];
    if (json["room_country"] is Map) {
      roomCountry = json["room_country"] == null
          ? null
          : RoomCountry.fromJson(json["room_country"]);
    }
    if (json["description"] is String) description = json["description"];
    if (json["room_status"] is String) roomStatus = json["room_status"];
    if (json["category"] is String) category = json["category"];
    if (json["microphones"] is int) microphones = json["microphones"];
    if (json["joined_users"] is List) {
      joinedUsers = json["joined_users"] == null
          ? null
          : (json["joined_users"] as List)
              .map((e) => JoinedUsers.fromJson(e))
              .toList();
    }
    if (json["joined"] is bool) joined = json["joined"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    if (user != null) data["user"] = user?.toJson();
    data["room_name"] = roomName;
    data["room_image"] = roomImage;
    if (roomCountry != null) {
      data["room_country"] = roomCountry?.toJson();
    }
    data["description"] = description;
    data["room_status"] = roomStatus;
    data["category"] = category;
    data["microphones"] = microphones;
    if (joinedUsers != null) {
      data["joined_users"] = joinedUsers?.map((e) => e.toJson()).toList();
    }
    data["joined"] = joined;
    return data;
  }
}

class JoinedUsers {
  int? id;
  String? userId;
  String? name;
  String? phone;
  String? email;
  String? image;
  Country1? country;
  String? gender;
  String? birthDate;
  String? profileStatus;

  JoinedUsers(
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

  JoinedUsers.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) id = json["id"];
    if (json["user_id"] is String) userId = json["user_id"];
    if (json["name"] is String) name = json["name"];
    if (json["phone"] is String) phone = json["phone"];
    if (json["email"] is String) email = json["email"];
    if (json["image"] is String) image = json["image"];
    if (json["country"] is Map) {
      country =
          json["country"] == null ? null : Country1.fromJson(json["country"]);
    }
    if (json["gender"] is String) gender = json["gender"];
    if (json["birth_date"] is String) birthDate = json["birth_date"];
    if (json["profile_status"] is String) {
      profileStatus = json["profile_status"];
    }
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

class Country1 {
  int? id;
  String? name;
  String? phonecode;
  String? flag;

  Country1({this.id, this.name, this.phonecode, this.flag});

  Country1.fromJson(Map<String, dynamic> json) {
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

class RoomCountry {
  int? id;
  String? name;
  String? phonecode;
  String? flag;

  RoomCountry({this.id, this.name, this.phonecode, this.flag});

  RoomCountry.fromJson(Map<String, dynamic> json) {
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

class User {
  int? id;
  String? userId;
  String? name;
  String? phone;
  String? email;
  String? image;
  Country? country;
  String? gender;
  String? birthDate;
  String? profileStatus;

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
    if (json["profile_status"] is String) {
      profileStatus = json["profile_status"];
    }
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
