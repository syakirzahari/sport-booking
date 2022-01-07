class User {
  String? token;
  DataUser? user;

  User({this.token, this.user});

  User.fromJson(Map<String, dynamic> json) {
    if (json["token"] is String) token = json["token"];
    if (json["user"] is Map) {
      user = json["user"] == null ? null : DataUser.fromJson(json["user"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["token"] = token;
    if (user != null) data["user"] = user?.toJson();
    return data;
  }
}

class DataUser {
  int? id;
  String? name;
  String? email;
  String? telephoneNumber;
  String? teamName;
  int? isPublic;
  String? createdAt;
  String? updatedAt;

  DataUser(
      {this.id,
      this.name,
      this.email,
      this.telephoneNumber,
      this.teamName,
      this.isPublic,
      this.createdAt,
      this.updatedAt});

  DataUser.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) id = json["id"];
    if (json["name"] is String) name = json["name"];
    if (json["email"] is String) email = json["email"];
    telephoneNumber = json["telephone_number"];
    teamName = json["team_name"];
    if (json["is_public"] is int) isPublic = json["is_public"];
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
    data["is_public"] = isPublic;
    data["created_at"] = createdAt;
    data["updated_at"] = updatedAt;
    return data;
  }
}
