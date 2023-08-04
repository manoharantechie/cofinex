import 'dart:convert';

List<LeaderHistoryList> leaderHistoryListFromJson(String str) => List<LeaderHistoryList>.from(json.decode(str).map((x) => LeaderHistoryList.fromJson(x)));

String leaderHistoryListToJson(List<LeaderHistoryList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LeaderHistoryList {
  String? trackingNo;
  dynamic holdMode;
  String? leverage;
  dynamic holdSide;
  dynamic symbol;
  String? openPrice;
  String? openTime;
  String? closePrice;
  String? closeTime;
  String? closeAmount;
  String? marginAmount;
  String? followerNum;

  LeaderHistoryList({
    this.trackingNo,
    this.holdMode,
    this.leverage,
    this.holdSide,
    this.symbol,
    this.openPrice,
    this.openTime,
    this.closePrice,
    this.closeTime,
    this.closeAmount,
    this.marginAmount,
    this.followerNum,
  });

  factory LeaderHistoryList.fromJson(Map<String, dynamic> json) => LeaderHistoryList(
    trackingNo: json["trackingNo"],
    holdMode: json["holdMode"],
    leverage: json["leverage"],
    holdSide:json["holdSide"],
    symbol: json["symbol"],
    openPrice: json["openPrice"],
    openTime: json["openTime"],
    closePrice: json["closePrice"],
    closeTime: json["closeTime"],
    closeAmount: json["closeAmount"],
    marginAmount: json["marginAmount"],
    followerNum: json["followerNum"],
  );

  Map<String, dynamic> toJson() => {
    "trackingNo": trackingNo,
    "holdMode": holdMode,
    "leverage": leverage,
    "holdSide": holdSide,
    "symbol": symbol,
    "openPrice": openPrice,
    "openTime": openTime,
    "closePrice": closePrice,
    "closeTime": closeTime,
    "closeAmount": closeAmount,
    "marginAmount": marginAmount,
    "followerNum": followerNum,
  };
}


