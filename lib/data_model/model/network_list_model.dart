import 'dart:convert';

NetworkListModel networkListModelFromJson(String str) => NetworkListModel.fromJson(json.decode(str));

String networkListModelToJson(NetworkListModel data) => json.encode(data.toJson());

class NetworkListModel {
  bool? status;
  List<NetworkList>? data;

  NetworkListModel({
    this.status,
    this.data,
  });

  factory NetworkListModel.fromJson(Map<String, dynamic> json) => NetworkListModel(
    status: json["status"],
    data: List<NetworkList>.from(json["data"].map((x) => NetworkList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class NetworkList {
  String? id;
  String? networkType;
  String? networkName;
  String? networkSymbol;
  dynamic copayStatus;
  dynamic status;
  dynamic chargeableNetwork;
  dynamic transactionFee;
  dynamic v;

  NetworkList({
    this.id,
    this.networkType,
    this.networkName,
    this.networkSymbol,
    this.copayStatus,
    this.status,
    this.chargeableNetwork,
    this.transactionFee,
    this.v,
  });

  factory NetworkList.fromJson(Map<String, dynamic> json) => NetworkList(
    id: json["_id"],
    networkType: json["networkType"],
    networkName: json["networkName"],
    networkSymbol: json["networkSymbol"],
    copayStatus: json["copay_status"],
    status: json["status"],
    chargeableNetwork: json["chargeable_network"],
    transactionFee: json["transaction_fee"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "networkType": networkType,
    "networkName": networkName,
    "networkSymbol": networkSymbol,
    "copay_status": copayStatus,
    "status": status,
    "chargeable_network":chargeableNetwork,
    "transaction_fee": transactionFee,
    "__v": v,
  };
}

enum ChargeableNetwork { EMPTY, COFINEX }

final chargeableNetworkValues = EnumValues({
  "Cofinex": ChargeableNetwork.COFINEX,
  "": ChargeableNetwork.EMPTY
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
