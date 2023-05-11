class WalletDetails {
  dynamic balance;
  dynamic createdBy;
  dynamic dateCreated;
  dynamic dateUpdated;
  String? token;
  dynamic type;
  dynamic updatedBy;

  WalletDetails({
    this.balance,
    this.createdBy,
    this.dateCreated,
    this.dateUpdated,
    this.token,
    this.type,
    this.updatedBy,
  });

  factory WalletDetails.fromJson(Map<String, dynamic> json) => WalletDetails(
    balance: json["balance"],
    createdBy: json["created_by"],
    dateCreated: json["date_created"],
    dateUpdated: json["date_updated"],
    token: json["token"],
    type: json["type"],
    updatedBy: json["updated_by"],
  );

  Map<String, dynamic> toJson() => {
    "balance": balance,
    "created_by": createdBy,
    "date_created": dateCreated,
    "date_updated": dateUpdated,
    "token": token,
    "type": type,
    "updated_by": updatedBy,
  };
}