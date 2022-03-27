class BookingStatus {
  bool? success;
  DataBookingStatus? data;
  String? message;

  BookingStatus({this.success, this.data, this.message});

  BookingStatus.fromJson(Map<String, dynamic> json) {
    if (json["success"] is bool) success = json["success"];
    if (json["data"] is Map) {
      data = json["data"] == null
          ? null
          : DataBookingStatus.fromJson(json["data"]);
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

class DataBookingStatus {
  int? slotId;
  int? venueId;
  int? isDeposit;
  int? totalAmount;
  String? bookingNo;
  int? bookedBy;
  String? updatedAt;
  String? createdAt;
  int? id;

  DataBookingStatus(
      {this.slotId,
      this.venueId,
      this.isDeposit,
      this.totalAmount,
      this.bookingNo,
      this.bookedBy,
      this.updatedAt,
      this.createdAt,
      this.id});

  DataBookingStatus.fromJson(Map<String, dynamic> json) {
    if (json["slot_id"] is int) slotId = json["slot_id"];
    if (json["venue_id"] is int) venueId = json["venue_id"];
    if (json["is_deposit"] is int) isDeposit = json["is_deposit"];
    if (json["total_amount"] is int) totalAmount = json["total_amount"];
    if (json["booking_no"] is String) bookingNo = json["booking_no"];
    if (json["booked_by"] is int) bookedBy = json["booked_by"];
    if (json["updated_at"] is String) updatedAt = json["updated_at"];
    if (json["created_at"] is String) createdAt = json["created_at"];
    if (json["id"] is int) id = json["id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["slot_id"] = slotId;
    data["venue_id"] = venueId;
    data["is_deposit"] = isDeposit;
    data["total_amount"] = totalAmount;
    data["booking_no"] = bookingNo;
    data["booked_by"] = bookedBy;
    data["updated_at"] = updatedAt;
    data["created_at"] = createdAt;
    data["id"] = id;
    return data;
  }
}
