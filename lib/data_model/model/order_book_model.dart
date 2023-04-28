import 'dart:convert';


class OrderBookData {
  String? amount;
  String? price;

  OrderBookData({
    this.amount,
    this.price,
  });

  factory OrderBookData.fromJson(Map<String, dynamic> json) => OrderBookData(
    amount: json["amount"],
    price: json["price"],
  );

  Map<String, dynamic> toJson() => {
    "amount": amount,
    "price": price,
  };
}
