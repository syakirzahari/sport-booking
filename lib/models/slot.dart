class Slot {
  bool? success;
  List<DataSlot>? data;
  String? message;

  Slot({this.success, this.data, this.message});

  Slot.fromJson(Map<String, dynamic> json) {
    if (json["success"] is bool) success = json["success"];
    if (json["data"] is List) {
      data = json["data"] == null
          ? null
          : (json["data"] as List).map((e) => DataSlot.fromJson(e)).toList();
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

class DataSlot {
  int? id;
  String? date;
  String? timeFrom;
  String? timeTo;
  int? venueSlotId;
  int? isAvailable;
  int? rate;
  int? depositRate;
  String? createdAt;
  VenueSlot? venueSlot;

  DataSlot(
      {this.id,
      this.date,
      this.timeFrom,
      this.timeTo,
      this.venueSlotId,
      this.isAvailable,
      this.rate,
      this.depositRate,
      this.createdAt,
      this.venueSlot});

  DataSlot.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) id = json["id"];
    if (json["date"] is String) date = json["date"];
    if (json["time_from"] is String) timeFrom = json["time_from"];
    if (json["time_to"] is String) timeTo = json["time_to"];
    if (json["venue_slot_id"] is int) venueSlotId = json["venue_slot_id"];
    if (json["is_available"] is int) isAvailable = json["is_available"];
    rate = json["rate"];
    depositRate = json["deposit_rate"];
    if (json["created_at"] is String) createdAt = json["created_at"];
    if (json["venue_slot"] is Map) {
      venueSlot = json["venue_slot"] == null
          ? null
          : VenueSlot.fromJson(json["venue_slot"]);
    }
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
    data["created_at"] = createdAt;
    if (venueSlot != null) data["venue_slot"] = venueSlot?.toJson();
    return data;
  }
}

class VenueSlot {
  int? id;
  int? sportId;
  int? venueId;
  String? courtName;
  String? createdAt;
  Venue? venue;

  VenueSlot(
      {this.id,
      this.sportId,
      this.venueId,
      this.courtName,
      this.createdAt,
      this.venue});

  VenueSlot.fromJson(Map<String, dynamic> json) {
    if (json["id"] is int) id = json["id"];
    if (json["sport_id"] is int) sportId = json["sport_id"];
    if (json["venue_id"] is int) venueId = json["venue_id"];
    if (json["court_name"] is String) courtName = json["court_name"];
    if (json["created_at"] is String) createdAt = json["created_at"];
    if (json["venue"] is Map) {
      venue = json["venue"] == null ? null : Venue.fromJson(json["venue"]);
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["sport_id"] = sportId;
    data["venue_id"] = venueId;
    data["court_name"] = courtName;
    data["created_at"] = createdAt;
    return data;
  }
}

class Venue {
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

  Venue(
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
      this.vendor});

  Venue.fromJson(Map<String, dynamic> json) {
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

    return data;
  }
}
