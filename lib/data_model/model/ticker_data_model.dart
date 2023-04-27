import 'dart:convert';


class AllTicker {
  String? high24Hr;
  String? low24Hr;
  String? marketPrice;
  String? pair;
  String? priceChangePercent24Hr;
  dynamic quickTradePrice;
  String? topBuy;
  String? topSell;
  dynamic volumeQt24Hr;
  String? volumeTotal24Hr;
  String? volumeTraded24Hr;
  dynamic system;

  AllTicker({
    this.high24Hr,
    this.low24Hr,
    this.marketPrice,
    this.pair,
    this.priceChangePercent24Hr,
    this.quickTradePrice,
    this.topBuy,
    this.topSell,
    this.volumeQt24Hr,
    this.volumeTotal24Hr,
    this.volumeTraded24Hr,
    this.system,
  });

  factory AllTicker.fromJson(Map<String, dynamic> json) => AllTicker(
    high24Hr: json["high24hr"],
    low24Hr: json["low24hr"],
    marketPrice: json["marketPrice"],
    pair: json["pair"],
    priceChangePercent24Hr: json["priceChangePercent24hr"],
    quickTradePrice: json["quickTradePrice"],
    topBuy: json["topBuy"],
    topSell: json["topSell"],
    volumeQt24Hr: json["volumeQt24hr"],
    volumeTotal24Hr: json["volumeTotal24hr"],
    volumeTraded24Hr: json["volumeTraded24hr"],
    system: json["system"],
  );

  Map<String, dynamic> toJson() => {
    "high24hr": high24Hr,
    "low24hr": low24Hr,
    "marketPrice": marketPrice,
    "pair": pair,
    "priceChangePercent24hr": priceChangePercent24Hr,
    "quickTradePrice": quickTradePrice,
    "topBuy": topBuy,
    "topSell": topSell,
    "volumeQt24hr": volumeQt24Hr,
    "volumeTotal24hr": volumeTotal24Hr,
    "volumeTraded24hr": volumeTraded24Hr,
    "system": system,
  };
}
