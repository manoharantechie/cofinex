import 'dart:convert';

GetOtpModel getOtpModelFromJson(String str) => GetOtpModel.fromJson(json.decode(str));

String getOtpModelToJson(GetOtpModel data) => json.encode(data.toJson());

class GetOtpModel {
  GetOtpModel({
    this.status,
    this.data,
  });

  bool? status;
  List<OTPModel>? data;

  factory GetOtpModel.fromJson(Map<String, dynamic> json) => GetOtpModel(
    status: json["status"],
    data: List<OTPModel>.from(json["data"].map((x) => OTPModel.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class OTPModel {
  OTPModel({
    this.action,
    this.expiresAt,
    this.generatedAt,
    this.otp,
  });

  String? action;
  String? expiresAt;
  DateTime? generatedAt;
  String? otp;

  factory OTPModel.fromJson(Map<String, dynamic> json) => OTPModel(
    action: json["action"],
    expiresAt: json["expiresAt"],
    generatedAt: DateTime.parse(json["generatedAt"]),
    otp: json["otp"],
  );

  Map<String, dynamic> toJson() => {
    "action": action,
    "expiresAt": expiresAt,
    "generatedAt": generatedAt!.toIso8601String(),
    "otp": otp,
  };
}
