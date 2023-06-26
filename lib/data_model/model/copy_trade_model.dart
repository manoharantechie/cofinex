import 'dart:convert';

CopyTradeModel copyTradeModelFromJson(String str) => CopyTradeModel.fromJson(json.decode(str));

String copyTradeModelToJson(CopyTradeModel data) => json.encode(data.toJson());

class CopyTradeModel {
  String? code;
  String? msg;
  int? requestTime;
  List<CopyTrade>? data;

  CopyTradeModel({
    this.code,
    this.msg,
    this.requestTime,
    this.data,
  });

  factory CopyTradeModel.fromJson(Map<String, dynamic> json) => CopyTradeModel(
    code: json["code"],
    msg: json["msg"],
    requestTime: json["requestTime"],
    data: List<CopyTrade>.from(json["data"].map((x) => CopyTrade.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "msg": msg,
    "requestTime": requestTime,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class CopyTrade {
  bool? canTrace;
  String? traderUid;
  String? traderNickName;
  String? maxFollowCount;
  String? followCount;
  bool? isMyTrader;
  String? profile;
  List<String>? tradingPairsAvailable;
  List<ColumnList>? columnList;
  String? totalFollowers;
  String? profitOrderCount;
  String? lossOrderCount;
  String? totalTradeCount;
  String? traderHeadPic;
  String? maxCallbackRate;
  String? averageWinRate;
  List<DailyProfitRate>? dailyProfitRate;
  List<DailyProfit>? dailyProfit;
  String? followerTotalProfit;
  List<DailyProfitRate>? profitRate24H;
  List<DailyProfit>? profit24H;

  CopyTrade({
    this.canTrace,
    this.traderUid,
    this.traderNickName,
    this.maxFollowCount,
    this.followCount,
    this.isMyTrader,
    this.profile,
    this.tradingPairsAvailable,
    this.columnList,
    this.totalFollowers,
    this.profitOrderCount,
    this.lossOrderCount,
    this.totalTradeCount,
    this.traderHeadPic,
    this.maxCallbackRate,
    this.averageWinRate,
    this.dailyProfitRate,
    this.dailyProfit,
    this.followerTotalProfit,
    this.profitRate24H,
    this.profit24H,
  });

  factory CopyTrade.fromJson(Map<String, dynamic> json) => CopyTrade(
    canTrace: json["canTrace"],
    traderUid: json["traderUid"],
    traderNickName: json["traderNickName"],
    maxFollowCount: json["maxFollowCount"],
    followCount: json["followCount"],
    isMyTrader: json["isMyTrader"],
    profile: json["profile"],
    tradingPairsAvailable: List<String>.from(json["tradingPairsAvailable"].map((x) => x)),
    columnList: List<ColumnList>.from(json["columnList"].map((x) => ColumnList.fromJson(x))),
    totalFollowers: json["totalFollowers"],
    profitOrderCount: json["profitOrderCount"],
    lossOrderCount: json["lossOrderCount"],
    totalTradeCount: json["totalTradeCount"],
    traderHeadPic: json["traderHeadPic"],
    maxCallbackRate: json["maxCallbackRate"],
    averageWinRate: json["averageWinRate"],
    dailyProfitRate: List<DailyProfitRate>.from(json["dailyProfitRate"].map((x) => DailyProfitRate.fromJson(x))),
    dailyProfit: List<DailyProfit>.from(json["dailyProfit"].map((x) => DailyProfit.fromJson(x))),
    followerTotalProfit: json["followerTotalProfit"],
    profitRate24H: List<DailyProfitRate>.from(json["profitRate24h"].map((x) => DailyProfitRate.fromJson(x))),
    profit24H: List<DailyProfit>.from(json["profit24h"].map((x) => DailyProfit.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "canTrace": canTrace,
    "traderUid": traderUid,
    "traderNickName": traderNickName,
    "maxFollowCount": maxFollowCount,
    "followCount": followCount,
    "isMyTrader": isMyTrader,
    "profile": profile,
    "tradingPairsAvailable": List<dynamic>.from(tradingPairsAvailable!.map((x) => x)),
    "columnList": List<dynamic>.from(columnList!.map((x) => x.toJson())),
    "totalFollowers": totalFollowers,
    "profitOrderCount": profitOrderCount,
    "lossOrderCount": lossOrderCount,
    "totalTradeCount": totalTradeCount,
    "traderHeadPic": traderHeadPic,
    "maxCallbackRate": maxCallbackRate,
    "averageWinRate": averageWinRate,
    "dailyProfitRate": List<dynamic>.from(dailyProfitRate!.map((x) => x.toJson())),
    "dailyProfit": List<dynamic>.from(dailyProfit!.map((x) => x.toJson())),
    "followerTotalProfit": followerTotalProfit,
    "profitRate24h": List<dynamic>.from(profitRate24H!.map((x) => x.toJson())),
    "profit24h": List<dynamic>.from(profit24H!.map((x) => x.toJson())),
  };
}

class ColumnList {
  dynamic describe;
  String? value;

  ColumnList({
    this.describe,
    this.value,
  });

  factory ColumnList.fromJson(Map<String, dynamic> json) => ColumnList(
    describe: json["describe"],
    value: json["value"],
  );

  Map<String, dynamic> toJson() => {
    "describe": describe,
    "value": value,
  };
}


class DailyProfit {
  String? amount;
  String? ctime;

  DailyProfit({
    this.amount,
    this.ctime,
  });

  factory DailyProfit.fromJson(Map<String, dynamic> json) => DailyProfit(
    amount: json["amount"],
    ctime: json["ctime"],
  );

  Map<String, dynamic> toJson() => {
    "amount": amount,
    "ctime": ctime,
  };
}

class DailyProfitRate {
  String? rate;
  String? ctime;

  DailyProfitRate({
    this.rate,
    this.ctime,
  });

  factory DailyProfitRate.fromJson(Map<String, dynamic> json) => DailyProfitRate(
    rate: json["rate"],
    ctime: json["ctime"],
  );

  Map<String, dynamic> toJson() => {
    "rate": rate,
    "ctime": ctime,
  };
}

