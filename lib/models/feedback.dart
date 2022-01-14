class Feedback {
  bool? success;
  DataFeedback? data;
  String? message;

  Feedback({this.success, this.data, this.message});

  Feedback.fromJson(Map<String, dynamic> json) {
    if (json["success"] is bool) success = json["success"];
    if (json["data"] is Map) {
      data = json["data"] == null ? null : DataFeedback.fromJson(json["data"]);
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

class DataFeedback {
  int? id;
  String? content;
  int? articleTypeId;
  String? createdAt;
  String? updatedAt;
  int? createdBy;

  DataFeedback(
      {this.id,
      this.content,
      this.articleTypeId,
      this.createdAt,
      this.updatedAt,
      this.createdBy});

  DataFeedback.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) id = json["id"];
    if (json["content"] is String) content = json["content"];
    if (json["article_type_id"] is int) articleTypeId = json["article_type_id"];
    if (json["created_at"] is String) createdAt = json["created_at"];
    if (json["updated_at"] is String) updatedAt = json["updated_at"];
    if (json["created_by"] is int) createdBy = json["created_by"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["content"] = content;
    data["article_type_id"] = articleTypeId;
    data["created_at"] = createdAt;
    data["updated_at"] = updatedAt;
    data["created_by"] = createdBy;
    return data;
  }
}
