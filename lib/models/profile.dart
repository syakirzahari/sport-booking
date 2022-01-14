class Profile {
  bool? success;
  DataProfile? data;
  String? message;

  Profile({this.success, this.data, this.message});

  Profile.fromJson(Map<String, dynamic> json) {
    if (json["success"] is bool) success = json["success"];
    if (json["data"] is Map) {
      data = json["data"] == null ? null : DataProfile.fromJson(json["data"]);
    }
    if (json["message"] is String) message = json["message"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["success"] = success;
    if (this.data != null) data["data"] = this.data?.toJson();
    data["message"] = message;
    return data;
  }
}

class DataProfile {
  int? id;
  String? name;
  String? email;
  String? telephoneNumber;
  String? teamName;
  String? createdAt;
  String? updatedAt;

  DataProfile(
      {this.id,
      this.name,
      this.email,
      this.telephoneNumber,
      this.teamName,
      this.createdAt,
      this.updatedAt});

  DataProfile.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) id = json["id"];
    if (json["name"] is String) name = json["name"];
    if (json["email"] is String) email = json["email"];
    telephoneNumber = json["telephone_number"] ?? '-';
    teamName = json["team_name"] ?? '-';
    if (json["created_at"] is String) createdAt = json["created_at"];
    if (json["updated_at"] is String) updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["email"] = email;
    data["telephone_number"] = telephoneNumber;
    data["team_name"] = teamName;
    data["created_at"] = createdAt;
    data["updated_at"] = updatedAt;
    return data;
  }
}
