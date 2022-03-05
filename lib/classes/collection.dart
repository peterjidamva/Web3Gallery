class Collection {
  String? name;
  String? description;
  String? slug;
  String? imageUrl;
  String? createdAt;
  String? payoutAddress;

  Collection(
      {this.name,
      this.description,
      this.slug,
      this.imageUrl,
      this.createdAt,
      this.payoutAddress});

  Collection.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
    slug = json['slug'];
    imageUrl = json['image_url'];
    createdAt = json['created_at'];
    payoutAddress = json['payout_address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['description'] = description;
    data['slug'] = slug;
    data['image_url'] = imageUrl;
    data['created_at'] = createdAt;
    data['payout_address'] = payoutAddress;
    return data;
  }
}
