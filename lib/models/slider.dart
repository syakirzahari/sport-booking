// ignore_for_file: unnecessary_new

class Slider {
  bool? success;
  List<DataSlider>? data;
  String? message;

  Slider({this.success, this.data, this.message});

  Slider.fromJson(Map<String, dynamic> json) {
    if (json["success"] is bool) success = json["success"];
    if (json["data"] is List) {
      data = json["data"] == null
          ? null
          : (json["data"] as List).map((e) => DataSlider.fromJson(e)).toList();
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

class DataSlider {
  int? id;
  List<SMedia>? media;

  DataSlider({this.id, this.media});

  DataSlider.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) id = json["id"];
    if (json["media"] is List) {
      media = json["media"] == null
          ? null
          : (json["media"] as List).map((e) => SMedia.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    if (media != null) data["media"] = media?.map((e) => e.toJson()).toList();
    return data;
  }
}

class SMedia {
  String? name;
  String? type;
  String? path;

  SMedia({this.name, this.type, this.path});

  SMedia.fromJson(Map<String, dynamic> json) {
    name = json["name"];
    type = json["type"];
    path = json["path"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["name"] = name;
    data["type"] = type;
    data["path"] = path;
    return data;
  }
}
