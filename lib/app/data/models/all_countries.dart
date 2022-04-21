class AllCountriesModel {
  bool? success;
  int? code;
  List<Data>? data;

  AllCountriesModel({this.success, this.code, this.data});

  AllCountriesModel.fromJson(Map<String, dynamic> json) {
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
  String? name;
  String? phonecode;
  String? flag;

  Data({this.id, this.name, this.phonecode, this.flag});

  Data.fromJson(Map<String, dynamic> json) {
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
