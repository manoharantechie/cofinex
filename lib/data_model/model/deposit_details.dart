import 'dart:convert';

DepositAddress depositAddressFromJson(String str) => DepositAddress.fromJson(json.decode(str));

String depositAddressToJson(DepositAddress data) => json.encode(data.toJson());

class DepositAddress {
  bool? status;
  String? address;
  String? qrcode;

  DepositAddress({
    this.status,
    this.address,
    this.qrcode,
  });

  factory DepositAddress.fromJson(Map<String, dynamic> json) => DepositAddress(
    status: json["status"],
    address: json["address"],
    qrcode: json["Qrcode"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "address": address,
    "Qrcode": qrcode,
  };
}
