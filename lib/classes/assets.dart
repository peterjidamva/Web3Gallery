import 'package:web3_gallery/classes/collection.dart';
import 'package:web3_gallery/classes/contract.dart';
import 'package:web3_gallery/classes/creator.dart';
import 'package:web3_gallery/classes/lastsale.dart';

import '';

class Assets {
  int? id;
  String? tokenId;
  String? name;
  String? description;
  String? imageUrl;
  int? sales;
  String? permalink;
  Contract? contract;
  Collection? collection;
  Creator? creator;
  Creator? owner;
  bool? presale;
  LastSale? lastSale;
  String? listingDate;

  Assets(
      {this.id,
      this.tokenId,
      this.name,
      this.description,
      this.imageUrl,
      this.sales,
      this.permalink,
      this.contract,
      this.collection,
      this.creator,
      this.owner,
      this.presale,
      this.lastSale,
      this.listingDate});

  Assets.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    tokenId = json['token_id'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['image_url'];
    sales = json['sales'];
    permalink = json['permalink'];
    contract = json['contract'] != null
        ? new Contract.fromJson(json['contract'])
        : null;
    collection = json['collection'] != null
        ? new Collection.fromJson(json['collection'])
        : null;
    creator =
        json['creator'] != null ? new Creator.fromJson(json['creator']) : null;
    owner = json['owner'] != null ? new Creator.fromJson(json['owner']) : null;
    presale = json['presale'];
    lastSale = json['last_sale'] != null
        ? new LastSale.fromJson(json['last_sale'])
        : null;
    listingDate = json['listing_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['token_id'] = this.tokenId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image_url'] = this.imageUrl;
    data['sales'] = this.sales;
    data['permalink'] = this.permalink;
    if (this.contract != null) {
      data['contract'] = this.contract!.toJson();
    }
    if (this.collection != null) {
      data['collection'] = this.collection!.toJson();
    }
    if (this.creator != null) {
      data['creator'] = this.creator!.toJson();
    }
    if (this.owner != null) {
      data['owner'] = this.owner!.toJson();
    }
    data['presale'] = this.presale;
    if (this.lastSale != null) {
      data['last_sale'] = this.lastSale!.toJson();
    }
    data['listing_date'] = this.listingDate;
    return data;
  }
}
