import 'dart:convert';

CurrencyListModel currencyListModelFromJson(String str) => CurrencyListModel.fromJson(json.decode(str));

String currencyListModelToJson(CurrencyListModel data) => json.encode(data.toJson());

class CurrencyListModel {
  bool? status;
  List<CurrencyList>? data;

  CurrencyListModel({
    this.status,
    this.data,
  });

  factory CurrencyListModel.fromJson(Map<String, dynamic> json) => CurrencyListModel(
    status: json["status"],
    data: List<CurrencyList>.from(json["data"].map((x) => CurrencyList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class CurrencyList {
  dynamic copayTopupStatus;
  String? id;
  String? name;
  String? symbol;
  String? apiCurid;
  String? image;
  dynamic type;
  dynamic cryptotype;
  String? networktype;
  dynamic markettype;
  dynamic status;
  dynamic minDeposit;
  dynamic maxDeposit;
  dynamic minWithdraw;
  dynamic maxWithdraw;
  dynamic minVoucher;
  dynamic maxVoucher;
  dynamic withdrawFee;
  dynamic depositFee;
  dynamic feeType;
  dynamic depositStatus;
  dynamic p2PStatus;
  dynamic withdrawStatus;
  dynamic voucherStatus;
  dynamic btcPrice;
  dynamic usdPrice;
  dynamic inrPrice;
  DateTime? updatedAt;
  dynamic balance;
  dynamic lenBal;
  dynamic hold;
  dynamic depositSum;
  dynamic withSum;
  dynamic totuserBal;
  String? contractAddress;
  dynamic decimal;
  dynamic extrakey;
  dynamic gasPrice;
  dynamic gasLimit;
  dynamic withdrawConfirm;
  dynamic topupLimit;
  dynamic copayStatus;
  dynamic tds;
  DateTime? createdAt;
  dynamic copayLockStatus;
  String? zoneType;
  dynamic v;

  CurrencyList({
    this.copayTopupStatus,
    this.id,
    this.name,
    this.symbol,
    this.apiCurid,
    this.image,
    this.type,
    this.cryptotype,
    this.networktype,
    this.markettype,
    this.status,
    this.minDeposit,
    this.maxDeposit,
    this.minWithdraw,
    this.maxWithdraw,
    this.minVoucher,
    this.maxVoucher,
    this.withdrawFee,
    this.depositFee,
    this.feeType,
    this.depositStatus,
    this.p2PStatus,
    this.withdrawStatus,
    this.voucherStatus,
    this.btcPrice,
    this.usdPrice,
    this.inrPrice,
    this.updatedAt,
    this.balance,
    this.lenBal,
    this.hold,
    this.depositSum,
    this.withSum,
    this.totuserBal,
    this.contractAddress,
    this.decimal,
    this.extrakey,
    this.gasPrice,
    this.gasLimit,
    this.withdrawConfirm,
    this.topupLimit,
    this.copayStatus,
    this.tds,
    this.createdAt,
    this.copayLockStatus,
    this.zoneType,
    this.v,
  });

  factory CurrencyList.fromJson(Map<String, dynamic> json) => CurrencyList(
    copayTopupStatus: json["copay_topup_status"],
    id: json["_id"],
    name: json["name"],
    symbol: json["symbol"],
    apiCurid: json["api_curid"],
    image: json["image"],
    type: json["type"],
    cryptotype: json["cryptotype"],
    networktype: json["networktype"],
    markettype: json["markettype"],
    status: json["status"],
    minDeposit: json["min_deposit"],
    maxDeposit: json["max_deposit"],
    minWithdraw: json["min_withdraw"].toDouble(),
    maxWithdraw: json["max_withdraw"],
    minVoucher: json["min_voucher"],
    maxVoucher: json["max_voucher"],
    withdrawFee: json["withdraw_fee"].toDouble(),
    depositFee: json["deposit_fee"].toDouble(),
    feeType: json["fee_type"],
    depositStatus: json["deposit_status"],
    p2PStatus: json["p2p_status"],
    withdrawStatus: json["withdraw_status"],
    voucherStatus: json["voucher_status"],
    btcPrice: json["btc_price"],
    usdPrice: json["usd_price"],
    inrPrice: json["inr_price"],
    updatedAt: DateTime.parse(json["updated_at"]),
    balance: json["balance"],
    lenBal: json["len_bal"],
    hold: json["hold"],
    depositSum: json["depositSum"],
    withSum: json["withSum"],
    totuserBal: json["totuserBal"],
    contractAddress: json["contract_address"],
    decimal: json["decimal"],
    extrakey: json["extrakey"],
    gasPrice: json["gasPrice"],
    gasLimit: json["gasLimit"],
    withdrawConfirm: json["withdraw_confirm"],
    topupLimit: json["topup_limit"],
    copayStatus: json["copay_status"],
    tds: json["tds"],
    createdAt: DateTime.parse(json["created_at"]),
    copayLockStatus: json["copay_lock_status"],
    zoneType: json["zoneType"],
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "copay_topup_status": copayTopupStatus,
    "_id": id,
    "name": name,
    "symbol": symbol,
    "api_curid": apiCurid,
    "image": image,
    "type": type,
    "cryptotype": cryptotype,
    "networktype": networktype,
    "markettype": markettype,
    "status": status,
    "min_deposit": minDeposit,
    "max_deposit": maxDeposit,
    "min_withdraw": minWithdraw,
    "max_withdraw": maxWithdraw,
    "min_voucher": minVoucher,
    "max_voucher": maxVoucher,
    "withdraw_fee": withdrawFee,
    "deposit_fee": depositFee,
    "fee_type": feeType,
    "deposit_status": depositStatus,
    "p2p_status": p2PStatus,
    "withdraw_status": withdrawStatus,
    "voucher_status": voucherStatus,
    "btc_price": btcPrice,
    "usd_price": usdPrice,
    "inr_price": inrPrice,
    "updated_at": updatedAt!.toIso8601String(),
    "balance": balance,
    "len_bal": lenBal,
    "hold": hold,
    "depositSum": depositSum,
    "withSum": withSum,
    "totuserBal": totuserBal,
    "contract_address": contractAddress,
    "decimal": decimal,
    "extrakey": extrakey,
    "gasPrice": gasPrice,
    "gasLimit": gasLimit,
    "withdraw_confirm": withdrawConfirm,
    "topup_limit": topupLimit,
    "copay_status": copayStatus,
    "tds": tds,
    "created_at": createdAt!.toIso8601String(),
    "copay_lock_status": copayLockStatus,
    "zoneType": zoneType,
    "__v": v,
  };
}

