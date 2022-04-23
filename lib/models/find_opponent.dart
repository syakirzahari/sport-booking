class FindOpponent {
  bool? success;
  List<DataOpponent>? data;
  String? message;

  FindOpponent({this.success, this.data, this.message});

  FindOpponent.fromJson(Map<String, dynamic> json) {
    if (json["success"] is bool) success = json["success"];
    if (json["data"] is List) {
      data = json["data"] == null
          ? null
          : (json["data"] as List)
              .map((e) => DataOpponent.fromJson(e))
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

class DataOpponent {
  int? id;
  String? bookingNo;
  int? slotId;
  int? slotAvailabilityId;
  int? venueId;
  int? isNoOpponent;
  String? teamName;
  int? isDeposit;
  int? isFull;
  int? isRefund;
  String? paymentStatus;
  int? totalAmount;
  OpponentBookedBy? bookedBy;
  String? collectedBy;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;
  int? lockedBy;
  String? opponentTeamName;
  OpponentSlot? slot;
  OpponentVenue? venue;
  OpponentSlotAvailability? slotAvailability;

  DataOpponent(
      {this.id,
      this.bookingNo,
      this.slotId,
      this.slotAvailabilityId,
      this.venueId,
      this.isNoOpponent,
      this.teamName,
      this.isDeposit,
      this.isFull,
      this.isRefund,
      this.paymentStatus,
      this.totalAmount,
      this.bookedBy,
      this.collectedBy,
      this.deletedAt,
      this.createdAt,
      this.updatedAt,
      this.lockedBy,
      this.opponentTeamName,
      this.slot,
      this.venue,
      this.slotAvailability});

  DataOpponent.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) id = json["id"];
    if (json["booking_no"] is String) bookingNo = json["booking_no"];
    if (json["slot_id"] is int) slotId = json["slot_id"];
    if (json["slot_availability_id"] is int) {
      slotAvailabilityId = json["slot_availability_id"];
    }
    if (json["venue_id"] is int) venueId = json["venue_id"];
    if (json["is_no_opponent"] is int) isNoOpponent = json["is_no_opponent"];
    teamName = json["team_name"] ?? '-';
    if (json["is_deposit"] is int) isDeposit = json["is_deposit"];
    if (json["is_full"] is int) isFull = json["is_full"];
    if (json["is_refund"] is int) isRefund = json["is_refund"];
    paymentStatus = json["payment_status"];
    if (json["total_amount"] is int) totalAmount = json["total_amount"];
    if (json["booked_by"] is Map) {
      bookedBy = json["booked_by"] == null
          ? null
          : OpponentBookedBy.fromJson(json["booked_by"]);
    }
    collectedBy = json["collected_by"];
    deletedAt = json["deleted_at"];
    if (json["created_at"] is String) createdAt = json["created_at"];
    if (json["updated_at"] is String) updatedAt = json["updated_at"];
    if (json["locked_by"] is int) lockedBy = json["locked_by"];
    opponentTeamName = json["opponent_team_name"];
    if (json["slot"] is Map) {
      slot = json["slot"] == null ? null : OpponentSlot.fromJson(json["slot"]);
    }
    if (json["venue"] is Map) {
      venue =
          json["venue"] == null ? null : OpponentVenue.fromJson(json["venue"]);
    }
    if (json["slot_availability"] is Map) {
      slotAvailability = json["slot_availability"] == null
          ? null
          : OpponentSlotAvailability.fromJson(json["slot_availability"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["booking_no"] = bookingNo;
    data["slot_id"] = slotId;
    data["slot_availability_id"] = slotAvailabilityId;
    data["venue_id"] = venueId;
    data["is_no_opponent"] = isNoOpponent;
    data["team_name"] = teamName;
    data["is_deposit"] = isDeposit;
    data["is_full"] = isFull;
    data["is_refund"] = isRefund;
    data["payment_status"] = paymentStatus;
    data["total_amount"] = totalAmount;
    if (bookedBy != null) data["booked_by"] = bookedBy?.toJson();
    data["collected_by"] = collectedBy;
    data["deleted_at"] = deletedAt;
    data["created_at"] = createdAt;
    data["updated_at"] = updatedAt;
    data["locked_by"] = lockedBy;
    data["opponent_team_name"] = opponentTeamName;
    if (slot != null) data["slot"] = slot?.toJson();
    if (venue != null) data["venue"] = venue?.toJson();
    if (slotAvailability != null) {
      data["slot_availability"] = slotAvailability?.toJson();
    }
    return data;
  }
}

class OpponentSlotAvailability {
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

  OpponentSlotAvailability(
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

  OpponentSlotAvailability.fromJson(Map<String, dynamic> json) {
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

class OpponentVenue {
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

  OpponentVenue(
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

  OpponentVenue.fromJson(Map<String, dynamic> json) {
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

class OpponentSlot {
  int? id;
  int? sportId;
  int? venueId;
  String? courtName;
  String? createdAt;
  String? updatedAt;

  OpponentSlot(
      {this.id,
      this.sportId,
      this.venueId,
      this.courtName,
      this.createdAt,
      this.updatedAt});

  OpponentSlot.fromJson(Map<String, dynamic> json) {
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

class OpponentBookedBy {
  int? id;
  String? name;
  String? email;
  String? emailVerifiedAt;
  String? telephoneNumber;
  String? teamName;
  String? districtId;
  String? stateId;
  String? vendorId;
  int? isPublic;
  String? createdAt;
  String? updatedAt;

  OpponentBookedBy(
      {this.id,
      this.name,
      this.email,
      this.emailVerifiedAt,
      this.telephoneNumber,
      this.teamName,
      this.districtId,
      this.stateId,
      this.vendorId,
      this.isPublic,
      this.createdAt,
      this.updatedAt});

  OpponentBookedBy.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) id = json["id"];
    if (json["name"] is String) name = json["name"];
    if (json["email"] is String) email = json["email"];
    emailVerifiedAt = json["email_verified_at"];
    telephoneNumber = json["telephone_number"] ?? '-';
    teamName = json["team_name"];
    districtId = json["district_id"];
    stateId = json["state_id"];
    vendorId = json["vendor_id"];
    if (json["is_public"] is int) isPublic = json["is_public"];
    if (json["created_at"] is String) createdAt = json["created_at"];
    if (json["updated_at"] is String) updatedAt = json["updated_at"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["name"] = name;
    data["email"] = email;
    data["email_verified_at"] = emailVerifiedAt;
    data["telephone_number"] = telephoneNumber;
    data["team_name"] = teamName;
    data["district_id"] = districtId;
    data["state_id"] = stateId;
    data["vendor_id"] = vendorId;
    data["is_public"] = isPublic;
    data["created_at"] = createdAt;
    data["updated_at"] = updatedAt;
    return data;
  }
}
