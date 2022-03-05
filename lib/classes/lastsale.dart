class LastSale {
  String? assetTokenId;
  int? assetDecimals;
  String? eventType;
  String? eventTimestamp;
  String? totalPrice;
  String? quantity;
  String? createdAt;
  Null? transaction;
  Null? paymentToken;

  LastSale(
      {this.assetTokenId,
      this.assetDecimals,
      this.eventType,
      this.eventTimestamp,
      this.totalPrice,
      this.quantity,
      this.createdAt,
      this.transaction,
      this.paymentToken});

  LastSale.fromJson(Map<String, dynamic> json) {
    assetTokenId = json['asset_token_id'];
    assetDecimals = json['asset_decimals'];
    eventType = json['event_type'];
    eventTimestamp = json['event_timestamp'];
    totalPrice = json['total_price'];
    quantity = json['quantity'];
    createdAt = json['created_at'];
    transaction = json['transaction'];
    paymentToken = json['payment_token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['asset_token_id'] = assetTokenId;
    data['asset_decimals'] = assetDecimals;
    data['event_type'] = eventType;
    data['event_timestamp'] = eventTimestamp;
    data['total_price'] = totalPrice;
    data['quantity'] = quantity;
    data['created_at'] = createdAt;
    data['transaction'] = transaction;
    data['payment_token'] = paymentToken;
    return data;
  }
}