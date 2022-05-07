class FriendRequestsModel {
  bool? success;
  Data? data;
  int? code;

  FriendRequestsModel({this.success, this.data, this.code});

  FriendRequestsModel.fromJson(Map<String, dynamic> json) {
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
  List<SentRequests>? sentRequests;
  List<ReceivedRequests>? receivedRequests;

  Data({this.sentRequests, this.receivedRequests});

  Data.fromJson(Map<String, dynamic> json) {
    sentRequests = json["sent_requests"] == null
        ? null
        : (json["sent_requests"] as List)
            .map((e) => SentRequests.fromJson(e))
            .toList();
    receivedRequests = json["received_requests"] == null
        ? null
        : (json["received_requests"] as List)
            .map((e) => ReceivedRequests.fromJson(e))
            .toList();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (sentRequests != null) {
      data["sent_requests"] = sentRequests?.map((e) => e.toJson()).toList();
    }
    if (receivedRequests != null) {
      data["received_requests"] =
          receivedRequests?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class ReceivedRequests {
  int? id;
  String? date;
  User1? user;

  ReceivedRequests({this.id, this.date, this.user});

  ReceivedRequests.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    date = json["date"];
    user = json["user"] == null ? null : User1.fromJson(json["user"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["date"] = date;
    if (user != null) data["user"] = user?.toJson();
    return data;
  }
}

class User1 {
  int? id;
  String? userId;
  String? name;
  String? phone;
  dynamic email;
  String? image;
  Country1? country;
  String? gender;
  String? birthDate;
  String? profileStatus;

  User1(
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

  User1.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    userId = json["user_id"];
    name = json["name"];
    phone = json["phone"];
    email = json["email"];
    image = json["image"];
    country =
        json["country"] == null ? null : Country1.fromJson(json["country"]);
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

class Country1 {
  int? id;
  String? name;
  String? phonecode;
  String? flag;

  Country1({this.id, this.name, this.phonecode, this.flag});

  Country1.fromJson(Map<String, dynamic> json) {
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

class SentRequests {
  int? id;
  String? date;
  User? user;

  SentRequests({this.id, this.date, this.user});

  SentRequests.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    date = json["date"];
    user = json["user"] == null ? null : User.fromJson(json["user"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["date"] = date;
    if (user != null) data["user"] = user?.toJson();
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
