import 'dart:convert';

SpotSocketListModel spotSocketListModelFromJson(String str) => SpotSocketListModel.fromJson(json.decode(str));

String spotSocketListModelToJson(SpotSocketListModel data) => json.encode(data.toJson());

class SpotSocketListModel {
  List<List<String>>? asks;
  List<List<String>>? bids;


  SpotSocketListModel({
    this.asks,
    this.bids,

  });

  factory SpotSocketListModel.fromJson(Map<String, dynamic> json) => SpotSocketListModel(
    asks: List<List<String>>.from(json["asks"].map((x) => List<String>.from(x.map((x) => x)))),
    bids: List<List<String>>.from(json["bids"].map((x) => List<String>.from(x.map((x) => x)))),

  );

  Map<String, dynamic> toJson() => {
    "asks": List<dynamic>.from(asks!.map((x) => List<dynamic>.from(x.map((x) => x)))),
    "bids": List<dynamic>.from(bids!.map((x) => List<dynamic>.from(x.map((x) => x)))),

  };
}
