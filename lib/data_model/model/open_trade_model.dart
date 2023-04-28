

class OpenOrdersHistory {
  String? qty;
  String? price;
  DateTime? time;
  dynamic pair;
  String? side;
  String? transId;
  dynamic? system;

  OpenOrdersHistory({
    this.qty,
    this.price,
    this.time,
    this.pair,
    this.side,
    this.transId,
    this.system,
  });

  factory OpenOrdersHistory.fromJson(Map<String, dynamic> json) => OpenOrdersHistory(
    qty: json["qty"],
    price: json["price"],
    time: DateTime.parse(json["time"]),
    pair: json["pair"],
    side: json["side"],
    transId: json["trans_id"],
    system: json["system"],
  );

  Map<String, dynamic> toJson() => {
    "qty": qty,
    "price": price,
    "time": time!.toIso8601String(),
    "pair": pair,
    "side": side,
    "trans_id": transId,
    "system": system,
  };
}


