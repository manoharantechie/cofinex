import 'dart:convert';

UserDetailsModel userDetailsModelFromJson(String str) => UserDetailsModel.fromJson(json.decode(str));

String userDetailsModelToJson(UserDetailsModel data) => json.encode(data.toJson());

class UserDetailsModel {
  bool? status;
  UserDetails? data;

  UserDetailsModel({
    this.status,
    this.data,
  });

  factory UserDetailsModel.fromJson(Map<String, dynamic> json) => UserDetailsModel(
    status: json["status"],
    data: UserDetails.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data!.toJson(),
  };
}

class UserDetails {
  String? kycStatus;
  String? sub;
  String? country;
  String? kycProfileId;
  bool? emailVerified;
  Address? address;
  String? kycReferenceId;
  String? preferredUsername;
  String? givenName;
  String? dialcode;
  String? referralCode;
  String? name;
  String? phoneNumber;
  String? promoCode;
  String? kycCaptureLink;
  String? familyName;
  String? email;
  String? ipAddress;
  int? lastLoginTime;

  UserDetails({
    this.kycStatus,
    this.sub,
    this.country,
    this.kycProfileId,
    this.emailVerified,
    this.address,
    this.kycReferenceId,
    this.preferredUsername,
    this.givenName,
    this.dialcode,
    this.referralCode,
    this.name,
    this.phoneNumber,
    this.promoCode,
    this.kycCaptureLink,
    this.familyName,
    this.email,
    this.ipAddress,
    this.lastLoginTime,
  });

  factory UserDetails.fromJson(Map<String, dynamic> json) => UserDetails(
    kycStatus: json["kyc_status"],
    sub: json["sub"],
    country: json["country"],
    kycProfileId: json["kyc_profile_id"],
    emailVerified: json["email_verified"],
    address: Address.fromJson(json["address"]),
    kycReferenceId: json["kyc_reference_id"],
    preferredUsername: json["preferred_username"],
    givenName: json["given_name"],
    dialcode: json["dialcode"],
    referralCode: json["referralCode"],
    name: json["name"],
    phoneNumber: json["phone_number"],
    promoCode: json["promoCode"],
    kycCaptureLink: json["kyc_capture_link"],
    familyName: json["family_name"],
    email: json["email"],
    ipAddress: json["ipAddress"],
    lastLoginTime: json["lastLoginTime"],
  );

  Map<String, dynamic> toJson() => {
    "kyc_status": kycStatus,
    "sub": sub,
    "country": country,
    "kyc_profile_id": kycProfileId,
    "email_verified": emailVerified,
    "address": address!.toJson(),
    "kyc_reference_id": kycReferenceId,
    "preferred_username": preferredUsername,
    "given_name": givenName,
    "dialcode": dialcode,
    "referralCode": referralCode,
    "name": name,
    "phone_number": phoneNumber,
    "promoCode": promoCode,
    "kyc_capture_link": kycCaptureLink,
    "family_name": familyName,
    "email": email,
    "ipAddress": ipAddress,
    "lastLoginTime": lastLoginTime,
  };
}

class Address {
  String? country;

  Address({
    this.country,
  });

  factory Address.fromJson(Map<String, dynamic> json) => Address(
    country: json["country"],
  );

  Map<String, dynamic> toJson() => {
    "country": country,
  };
}
