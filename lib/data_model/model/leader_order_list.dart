import 'dart:convert';

List<LeaderOrderList> leaderOrderListFromJson(String str) => List<LeaderOrderList>.from(json.decode(str).map((x) => LeaderOrderList.fromJson(x)));

String leaderOrderListToJson(List<LeaderOrderList> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class LeaderOrderList {
  String? trackingNo;
  String? holdMode;
  String? leverage;
  String? holdSide;
  String? symbol;
  String? openPrice;
  String? openTime;
  String? openAmount;
  String? followerNum;
  String? takeProfitPrice;
  String? stopLossPrice;
  String? marginAmount;

  LeaderOrderList({
    this.trackingNo,
    this.holdMode,
    this.leverage,
    this.holdSide,
    this.symbol,
    this.openPrice,
    this.openTime,
    this.openAmount,
    this.followerNum,
    this.takeProfitPrice,
    this.stopLossPrice,
    this.marginAmount,
  });

  factory LeaderOrderList.fromJson(Map<String, dynamic> json) => LeaderOrderList(
    trackingNo: json["trackingNo"],
    holdMode: json["holdMode"],
    leverage: json["leverage"],
    holdSide: json["holdSide"],
    symbol: json["symbol"],
    openPrice: json["openPrice"],
    openTime: json["openTime"],
    openAmount: json["openAmount"],
    followerNum: json["followerNum"],
    takeProfitPrice: json["takeProfitPrice"],
    stopLossPrice: json["stopLossPrice"],
    marginAmount: json["marginAmount"],
  );

  Map<String, dynamic> toJson() => {
    "trackingNo": trackingNo,
    "holdMode": holdMode,
    "leverage": leverage,
    "holdSide": holdSide,
    "symbol": symbol,
    "openPrice": openPrice,
    "openTime": openTime,
    "openAmount": openAmount,
    "followerNum": followerNum,
    "takeProfitPrice": takeProfitPrice,
    "stopLossPrice": stopLossPrice,
    "marginAmount": marginAmount,
  };
}
