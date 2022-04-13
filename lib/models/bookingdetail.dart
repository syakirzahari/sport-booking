class BookingDetail {
  bool? success;
  List<DataBookingDetail>? data;
  String? message;

  BookingDetail({this.success, this.data, this.message});

  BookingDetail.fromJson(Map<String, dynamic> json) {
    if (json["success"] is bool) success = json["success"];
    if (json["data"] is List) {
      data = json["data"] == null
          ? null
          : (json["data"] as List)
              .map((e) => DataBookingDetail.fromJson(e))
              .toList();
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

class DataBookingDetail {
  int? id;
  String? bookingNo;
  int? slotId;
  int? slotAvailabilityId;
  int? venueId;
  int? isDeposit;
  int? isFull;
  int? isRefund;
  String? paymentStatus;
  int? totalAmount;
  int? bookedBy;
  String? createdAt;
  String? updatedAt;
  Slot? slot;
  Venue? venue;
  SlotAvailability? slotAvailability;

  DataBookingDetail(
      {this.id,
      this.bookingNo,
      this.slotId,
      this.slotAvailabilityId,
      this.venueId,
      this.isDeposit,
      this.isFull,
      this.isRefund,
      this.paymentStatus,
      this.totalAmount,
      this.bookedBy,
      this.createdAt,
      this.updatedAt,
      this.slot,
      this.venue,
      this.slotAvailability});

  DataBookingDetail.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) id = json["id"];
    if (json["booking_no"] is String) bookingNo = json["booking_no"];
    if (json["slot_id"] is int) slotId = json["slot_id"];
    if (json["slot_availability_id"] is int) {
      slotAvailabilityId = json["slot_availability_id"];
    }
    if (json["venue_id"] is int) venueId = json["venue_id"];
    if (json["is_deposit"] is int) isDeposit = json["is_deposit"];
    if (json["is_full"] is int) isFull = json["is_full"];
    if (json["is_refund"] is int) isRefund = json["is_refund"];
    paymentStatus = json["payment_status"];
    if (json["total_amount"] is int) totalAmount = json["total_amount"];
    if (json["booked_by"] is int) bookedBy = json["booked_by"];
    if (json["created_at"] is String) createdAt = json["created_at"];
    if (json["updated_at"] is String) updatedAt = json["updated_at"];
    if (json["slot"] is Map) {
      slot = json["slot"] == null ? null : Slot.fromJson(json["slot"]);
    }
    if (json["venue"] is Map) {
      venue = json["venue"] == null ? null : Venue.fromJson(json["venue"]);
    }
    if (json["slot_availability"] is Map) {
      slotAvailability = json["slot_availability"] == null
          ? null
          : SlotAvailability.fromJson(json["slot_availability"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["booking_no"] = bookingNo;
    data["slot_id"] = slotId;
    data["slot_availability_id"] = slotAvailabilityId;
    data["venue_id"] = venueId;
    data["is_deposit"] = isDeposit;
    data["is_full"] = isFull;
    data["is_refund"] = isRefund;
    data["payment_status"] = paymentStatus;
    data["total_amount"] = totalAmount;
    data["booked_by"] = bookedBy;
    data["created_at"] = createdAt;
    data["updated_at"] = updatedAt;
    if (slot != null) data["slot"] = slot?.toJson();
    if (venue != null) data["venue"] = venue?.toJson();
    if (slotAvailability != null) {
      data["slot_availability"] = slotAvailability?.toJson();
    }
    return data;
  }
}

class SlotAvailability {
  int? id;
  String? date;
  String? timeFrom;
  String? timeTo;
  int? venueSlotId;
  int? isAvailable;
  int? rate;
  int? depositRate;
  String? createdAt;
  String? updatedAt;

  SlotAvailability(
      {this.id,
      this.date,
      this.timeFrom,
      this.timeTo,
      this.venueSlotId,
      this.isAvailable,
      this.rate,
      this.depositRate,
      this.createdAt,
      this.updatedAt});

  SlotAvailability.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) id = json["id"];
    if (json["date"] is String) date = json["date"];
    if (json["time_from"] is String) timeFrom = json["time_from"];
    if (json["time_to"] is String) timeTo = json["time_to"];
    if (json["venue_slot_id"] is int) venueSlotId = json["venue_slot_id"];
    if (json["is_available"] is int) isAvailable = json["is_available"];
    if (json["rate"] is int) rate = json["rate"];
    if (json["deposit_rate"] is int) depositRate = json["deposit_rate"];
    if (json["created_at"] is String) createdAt = json["created_at"];
    if (json["updated_at"] is String) updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["date"] = date;
    data["time_from"] = timeFrom;
    data["time_to"] = timeTo;
    data["venue_slot_id"] = venueSlotId;
    data["is_available"] = isAvailable;
    data["rate"] = rate;
    data["deposit_rate"] = depositRate;
    data["created_at"] = createdAt;
    data["updated_at"] = updatedAt;
    return data;
  }
}

class Venue {
  int? id;
  String? name;
  String? description;
  String? address;
  int? districtId;
  int? stateId;
  String? lat;
  String? lng;
  String? telephoneNumber;
  int? ownerId;
  String? createdAt;
  String? updatedAt;
  int? vendorId;

  Venue(
      {this.id,
      this.name,
      this.description,
      this.address,
      this.districtId,
      this.stateId,
      this.lat,
      this.lng,
      this.telephoneNumber,
      this.ownerId,
      this.createdAt,
      this.updatedAt,
      this.vendorId});

  Venue.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) id = json["id"];
    if (json["name"] is String) name = json["name"];
    if (json["description"] is String) description = json["description"];
    if (json["address"] is String) address = json["address"];
    if (json["district_id"] is int) districtId = json["district_id"];
    if (json["state_id"] is int) stateId = json["state_id"];
    if (json["lat"] is String) lat = json["lat"];
    if (json["lng"] is String) lng = json["lng"];
    if (json["telephone_number"] is String) {
      telephoneNumber = json["telephone_number"];
    }
    if (json["owner_id"] is int) ownerId = json["owner_id"];
    if (json["created_at"] is String) createdAt = json["created_at"];
    if (json["updated_at"] is String) updatedAt = json["updated_at"];
    if (json["vendor_id"] is int) vendorId = json["vendor_id"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["description"] = description;
    data["address"] = address;
    data["district_id"] = districtId;
    data["state_id"] = stateId;
    data["lat"] = lat;
    data["lng"] = lng;
    data["telephone_number"] = telephoneNumber;
    data["owner_id"] = ownerId;
    data["created_at"] = createdAt;
    data["updated_at"] = updatedAt;
    data["vendor_id"] = vendorId;
    return data;
  }
}

class Slot {
  int? id;
  int? sportId;
  int? venueId;
  String? courtName;
  String? createdAt;
  String? updatedAt;

  Slot({
    this.id,
    this.sportId,
    this.venueId,
    this.courtName,
    this.createdAt,
    this.updatedAt,
  });

  Slot.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) id = json["id"];
    if (json["sport_id"] is int) sportId = json["sport_id"];
    if (json["venue_id"] is int) venueId = json["venue_id"];
    if (json["court_name"] is String) courtName = json["court_name"];
    if (json["created_at"] is String) createdAt = json["created_at"];
    if (json["updated_at"] is String) updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["sport_id"] = sportId;
    data["venue_id"] = venueId;
    data["court_name"] = courtName;
    data["created_at"] = createdAt;
    data["updated_at"] = updatedAt;
    return data;
  }
}
