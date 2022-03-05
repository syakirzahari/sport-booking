class SportVenue {
  bool? success;
  List<DataSport>? data;
  String? message;

  SportVenue({this.success, this.data, this.message});

  SportVenue.fromJson(Map<String, dynamic> json) {
    if (json["success"] is bool) success = json["success"];
    if (json["data"] is List) {
      data = json["data"] == null
          ? null
          : (json["data"] as List).map((e) => DataSport.fromJson(e)).toList();
    }
    if (json["message"] is String) message = json["message"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["success"] = success;
    if (this.data != null) {
      data["data"] = this.data?.map((e) => e.toJson()).toList();
    }
    data["message"] = message;
    return data;
  }
}

class DataSport {
  int? id;
  String? name;
  String? description;
  String? address;
  String? district;
  int? districtId;
  String? state;
  int? stateId;
  String? latitude;
  String? longitude;
  String? telNo;
  String? vendor;
  List<Media>? media;

  DataSport(
      {this.id,
      this.name,
      this.description,
      this.address,
      this.district,
      this.districtId,
      this.state,
      this.stateId,
      this.latitude,
      this.longitude,
      this.telNo,
      this.vendor,
      this.media});

  DataSport.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) id = json["id"];
    if (json["name"] is String) name = json["name"];
    if (json["description"] is String) description = json["description"];
    if (json["address"] is String) address = json["address"];
    if (json["district"] is String) district = json["district"];
    if (json["district_id"] is int) districtId = json["district_id"];
    if (json["state"] is String) state = json["state"];
    if (json["state_id"] is int) stateId = json["state_id"];
    if (json["latitude"] is String) latitude = json["latitude"];
    if (json["longitude"] is String) longitude = json["longitude"];
    if (json["tel_no"] is String) telNo = json["tel_no"];
    if (json["vendor"] is String) vendor = json["vendor"];
    if (json["media"] is List) {
      media = json["media"] == null
          ? null
          : (json["media"] as List).map((e) => Media.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["description"] = description;
    data["address"] = address;
    data["district"] = district;
    data["district_id"] = districtId;
    data["state"] = state;
    data["state_id"] = stateId;
    data["latitude"] = latitude;
    data["longitude"] = longitude;
    data["tel_no"] = telNo;
    data["vendor"] = vendor;
    if (media != null) {
      data["media"] = media?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class Media {
  String? name;
  String? type;
  String? path;

  Media({this.name, this.type, this.path});

  Media.fromJson(Map<String, dynamic> json) {
    if (json["name"] is String) name = json["name"];
    if (json["type"] is String) type = json["type"];
    if (json["path"] is String) path = json["path"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["name"] = name;
    data["type"] = type;
    data["path"] = path;
    return data;
  }
}
