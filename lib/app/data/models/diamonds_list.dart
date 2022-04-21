class DiamondsListModel {
  bool? success;
  int? code;
  List<Data>? data;

  DiamondsListModel({this.success, this.code, this.data});

  DiamondsListModel.fromJson(Map<String, dynamic> json) {
    if (json["success"] is bool) success = json["success"];
    if (json["code"] is int) code = json["code"];
    if (json["data"] is List) {
      data = json["data"] == null
          ? null
          : (json["data"] as List).map((e) => Data.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["success"] = success;
    data["code"] = code;
    if (this.data != null) {
      data["data"] = this.data?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  int? diamond;
  int? dollar;
  String? image;

  Data({this.id, this.diamond, this.dollar, this.image});

  Data.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) id = json["id"];
    if (json["diamond"] is int) diamond = json["diamond"];
    if (json["dollar"] is int) dollar = json["dollar"];
    if (json["image"] is String) image = json["image"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["diamond"] = diamond;
    data["dollar"] = dollar;
    data["image"] = image;
    return data;
  }
}
