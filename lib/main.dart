// ignore_for_file: prefer_const_constructors

import 'dart:io';

import "package:flutter/material.dart";
import 'package:animate_do/animate_do.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'pages/bid.dart';

import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart' as http;

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

var todayDate = DateTime.now();
Future<Autogenerated> fetchAutogenerated() async {
  String M3O_API_TOKEN = 'Zjk2ZTM3M2ItNDBjZi00MTQ5LTk0OGQtMmJiODQxZTNiYjIx';

  var headers = {
    'Authorization': 'Bearer Zjk2ZTM3M2ItNDBjZi00MTQ5LTk0OGQtMmJiODQxZTNiYjIx',
  };

  // var data = {"order_by": "sale_date"};
  var uri = Uri.parse('https://api.m3o.com/v1/nft/Assets');
  var response = await http.get(uri, headers: headers);

  if (response.statusCode == 200) {
    print(response.body);
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return Autogenerated.fromJson(jsonDecode(response.body));
  } else {
    print("even data never load");
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load details');
  }
}

class Autogenerated {
  List<Assets>? assets;

  Autogenerated({this.assets});

  Autogenerated.fromJson(Map<String, dynamic> json) {
    if (json['assets'] != null) {
      assets = <Assets>[];
      json['assets'].forEach((v) {
        assets!.add(new Assets.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.assets != null) {
      data['assets'] = this.assets!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    data['slug'] = this.slug;
    data['image_url'] = this.imageUrl;
    data['created_at'] = this.createdAt;
    data['payout_address'] = this.payoutAddress;
    return data;
  }
}

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
    data['username'] = this.username;
    data['profile_url'] = this.profileUrl;
    data['address'] = this.address;
    return data;
  }
}

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
    data['asset_token_id'] = this.assetTokenId;
    data['asset_decimals'] = this.assetDecimals;
    data['event_type'] = this.eventType;
    data['event_timestamp'] = this.eventTimestamp;
    data['total_price'] = this.totalPrice;
    data['quantity'] = this.quantity;
    data['created_at'] = this.createdAt;
    data['transaction'] = this.transaction;
    data['payment_token'] = this.paymentToken;
    return data;
  }
}
// azka dev
// gibran alazka

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      systemNavigationBarColor: Colors.transparent, // navigation bar color
      statusBarIconBrightness: Brightness.dark, // status bar icons' color
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  HttpOverrides.global = MyHttpOverrides();

  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    ),
  );
}

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _ExpensesPageState createState() => _ExpensesPageState();
}

class _ExpensesPageState extends State<MainPage> {
  late Future<Autogenerated> futureAutogenerated;
  @override
  void initState() {
    super.initState();
    futureAutogenerated = fetchAutogenerated();
  }

  var indexPage = 0;
  List<dynamic> typeGenreNft = [
    {"name": "Cryptopunks", "selected": true},
    {"name": "BYC", "selected": false},
    {"name": "Drift Nft", "selected": false},
    {"name": "Axie Infinity", "selected": false},
    {"name": "Mutant Ape", "selected": false},
    {"name": "Apes to Space", "selected": false},
    {"name": "MANA", "selected": false}
  ];
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final getHeight = mediaQuery.size.height;
    final getWidht = mediaQuery.size.width;
    final appbarHeight = mediaQuery.padding.top;
    final bottomPadding = mediaQuery.padding.bottom;
    return Scaffold(
      backgroundColor: const Color(0xffF0F8FF),
      body: SafeArea(
        minimum: const EdgeInsets.only(top: 20.0, right: 10.0, left: 10.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: FadeInUp(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Icon(
                        Iconsax.menu,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                    onTap: () {
                      // ignore: avoid_print
                      print("tap pp");
                    },
                  ),
                  const Spacer(),
                  InkWell(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Icon(
                        Iconsax.search_normal,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                    onTap: () {
                      // ignore: avoid_print
                      print("tap pp");
                    },
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  InkWell(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: const Icon(
                        Iconsax.notification,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                    onTap: () {
                      // ignore: avoid_print
                      print("tap pp");
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 25.0,
              ),
              const Text(
                "NFT Shop\nWeb 3.0 Gallery",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              const SizedBox(
                height: 25.0,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(top: 5, bottom: 5, right: 5),
                child: Row(
                  children: [
                    for (var i = 0; i < typeGenreNft.length; i++) ...[
                      const SizedBox(
                        width: 10.0,
                      ),
                      Container(
                        constraints: const BoxConstraints(
                          maxWidth: double.infinity,
                          maxHeight: double.infinity,
                        ),
                        padding: const EdgeInsets.only(
                            right: 20.0, left: 20.0, top: 10.0, bottom: 10.0),
                        decoration: BoxDecoration(
                          color: typeGenreNft[i]["selected"]
                              ? Colors.grey
                              : Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              spreadRadius: 1,
                              blurRadius: 1,
                            ),
                          ],
                        ),
                        child: Text(
                          typeGenreNft[i]["name"],
                          style: TextStyle(
                            color: typeGenreNft[i]["selected"]
                                ? Colors.white
                                : Colors.grey,
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
              const SizedBox(
                height: 30.0,
              ),
              FutureBuilder<Autogenerated>(
                future: futureAutogenerated,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    //this is the one that return all the data from API
                    print(snapshot.data!.toJson());
                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding:
                          const EdgeInsets.only(top: 5, bottom: 5, right: 5),
                      child: Row(
                        children: [
                          for (int i = 1;
                              i < snapshot.data!.assets!.length;
                              i++) ...[
                            InkWell(
                              borderRadius: BorderRadius.circular(15),
                              onTap: () {
                                print(snapshot.data!.assets!.length);
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const BidPage(),
                                  ),
                                );
                              },
                              child: Stack(
                                children: [
                                  FutureBuilder<Autogenerated>(
                                    future: futureAutogenerated,
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        //this is the one that return all the data from API
                                        print(snapshot.data!.toString());
                                        //but this return null
                                        return ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: Image(
                                            fit: BoxFit.fill,
                                            width: getWidht,
                                            height: 400,
                                            image: NetworkImage(snapshot
                                                .data!.assets![i].imageUrl
                                                .toString()),
                                          ),
                                        );
                                      } else if (snapshot.hasError) {
                                        print(snapshot.error.toString());
                                        return Center(
                                          child: Text(
                                            snapshot.error.toString(),
                                            style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 25,
                                            ),
                                          ),
                                        );
                                      } else {
                                        // By default, show a loading spinner.
                                        return Center(
                                          child: CircularProgressIndicator(
                                            color: Colors.blue,
                                          ),
                                        );
                                      }
                                    },
                                  ),
                                  Positioned(
                                    top: 15,
                                    right: 15,
                                    child: Row(
                                      children: [
                                        const SizedBox(width: 10.0),
                                        Container(
                                          constraints: const BoxConstraints(
                                            maxWidth: double.infinity,
                                            maxHeight: double.infinity,
                                          ),
                                          padding: const EdgeInsets.all(5.0),
                                          decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: const Text(
                                            "08",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 5.0),
                                        const Text(
                                          ":",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15,
                                          ),
                                        ),
                                        const SizedBox(width: 5.0),
                                        Container(
                                          constraints: const BoxConstraints(
                                            maxWidth: double.infinity,
                                            maxHeight: double.infinity,
                                          ),
                                          padding: const EdgeInsets.all(5.0),
                                          decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: const Text(
                                            "43",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(width: 5.0),
                                        const Text(
                                          ":",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15,
                                          ),
                                        ),
                                        const SizedBox(width: 5.0),
                                        Container(
                                          constraints: const BoxConstraints(
                                            maxWidth: double.infinity,
                                            maxHeight: double.infinity,
                                          ),
                                          padding: const EdgeInsets.all(5.0),
                                          decoration: BoxDecoration(
                                            color: Colors.grey,
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          child: const Text(
                                            "26",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w700,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    left: 0,
                                    child: Container(
                                      constraints: const BoxConstraints(
                                        maxWidth: double.infinity,
                                        maxHeight: double.infinity,
                                      ),
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(10),
                                          bottomRight: Radius.circular(10),
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.black12,
                                            spreadRadius: 5,
                                            blurRadius: 10,
                                          ),
                                        ],
                                      ),
                                      child: SafeArea(
                                        minimum: const EdgeInsets.all(20.0),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              snapshot.data!.assets![i].name
                                                  .toString(),
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 10.0,
                                            ),
                                            Row(
                                              children: [
                                                InkWell(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  child: Container(
                                                    width: 40,
                                                    height: 40,
                                                    decoration: BoxDecoration(
                                                      color: Colors.grey[300],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                    ),
                                                    child: const Icon(
                                                      Iconsax.profile_2user,
                                                      color: Colors.black,
                                                      size: 20,
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    // ignore: avoid_print
                                                    print("tap pp");
                                                  },
                                                ),
                                                const SizedBox(
                                                  width: 10.0,
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        "Owner",
                                                        style: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        snapshot.data!
                                                            .assets![i].owner
                                                            .toString(),
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                const Spacer(),
                                                InkWell(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  child: Container(
                                                    width: 40,
                                                    height: 40,
                                                    decoration: BoxDecoration(
                                                      color: Colors.grey[300],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                    ),
                                                    child: const Icon(
                                                      Iconsax.data,
                                                      color: Colors.black,
                                                      size: 20,
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    // ignore: avoid_print
                                                    print("tap pp");
                                                  },
                                                ),
                                                const SizedBox(
                                                  width: 10.0,
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        "Bid",
                                                        style: TextStyle(
                                                          color: Colors.grey,
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 5,
                                                      ),
                                                      Text(
                                                        snapshot.data!
                                                            .assets![i].lastSale
                                                            .toString(),
                                                        style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 13,
                                                          fontWeight:
                                                              FontWeight.w700,
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ],
                      ),
                    );
                  } else if (snapshot.hasError) {
                    print("${snapshot.error}");
                    return Center(
                      child: Text(
                        'no network',
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    );
                  } else {
                    // By default, show a loading spinner.
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.blue,
                      ),
                    );
                  }
                },
              ),
            ],
          )),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xffF0F8FF),
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Iconsax.home, color: Colors.black),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.lovely, color: Colors.black),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.chart, color: Colors.grey),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Iconsax.user, color: Colors.grey),
            label: "",
          ),
        ],
      ),
    );
  }
}
