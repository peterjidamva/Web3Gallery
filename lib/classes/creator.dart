class Creator {
  String? username;
  String? profileUrl;
  String? address;

  Creator({this.username, this.profileUrl, this.address});

  Creator.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    profileUrl = json['profile_url'];
    address = json['address'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = username;
    data['profile_url'] = profileUrl;
    data['address'] = address;
    return data;
  }
}
