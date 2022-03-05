
class Contract {
  String? name;
  String? address;
  String? type;
  String? createdAt;
  int? owner;
  String? schema;
  String? symbol;
  String? description;
  String? payoutAddress;
  String? sellerFees;

  Contract(
      {this.name,
      this.address,
      this.type,
      this.createdAt,
      this.owner,
      this.schema,
      this.symbol,
      this.description,
      this.payoutAddress,
      this.sellerFees});

  Contract.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    address = json['address'];
    type = json['type'];
    createdAt = json['created_at'];
    owner = json['owner'];
    schema = json['schema'];
    symbol = json['symbol'];
    description = json['description'];
    payoutAddress = json['payout_address'];
    sellerFees = json['seller_fees'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['address'] = this.address;
    data['type'] = this.type;
    data['created_at'] = this.createdAt;
    data['owner'] = this.owner;
    data['schema'] = this.schema;
    data['symbol'] = this.symbol;
    data['description'] = this.description;
    data['payout_address'] = this.payoutAddress;
    data['seller_fees'] = this.sellerFees;
    return data;
  }
}
