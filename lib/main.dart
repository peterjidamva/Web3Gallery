import 'dart:io';
import "package:flutter/material.dart";
import 'package:animate_do/animate_do.dart';
import 'package:flutter/services.dart';
import 'package:iconsax/iconsax.dart';
import 'package:web3_gallery/classes/assets.dart';
import 'package:web3_gallery/data/wallet.dart';
import 'package:web3_gallery/pairs/view_pairs.dart';
import 'pages/bid.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

//(ððnot good for production)this is is if you have troubles in fetching from api
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
  var headers = {'Authorization': 'Bearer MGI1NTNlNmEtYTdmYy00MGNkLWIxZTgtNGU3YmE2MDljMWE1'};

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
  var activePage;
  bool buttonClicked = false;
  late Future<Autogenerated> futureAutogenerated;
  @override
  void initState() {
    super.initState();
    futureAutogenerated = fetchAutogenerated();
  }

  var indexPage = 0;
  bool isSelected = false;
  List<dynamic> typeGenreNft = [
    {"name": "Punks", "selected": true},
    {"name": "BYC", "selected": false},
    {"name": "Drift Nft", "selected": false},
    {"name": "Axie Infinity", "selected": false},
    {"name": "MAYC", "selected": false},
    {"name": "Crypto girls", "selected": false},
    {"name": "Apes to Space", "selected": false},
    {"name": "MANA", "selected": false}
  ];
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final getHeight = mediaQuery.size.height * 0.5;
    final getWidht = mediaQuery.size.width * 0.7;
    final appbarHeight = mediaQuery.padding.top;
    final bottomPadding = mediaQuery.padding.bottom;
    return buttonClicked
        ? activePage
        : Scaffold(
            backgroundColor: const Color(0xffF0F8FF),
            body: SafeArea(
              minimum:
                  const EdgeInsets.only(top: 20.0, right: 10.0, left: 10.0),
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
                      padding:
                          const EdgeInsets.only(top: 5, bottom: 5, right: 5),
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
                                  right: 20.0,
                                  left: 20.0,
                                  top: 10.0,
                                  bottom: 10.0),
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
                            padding: const EdgeInsets.only(
                                top: 5, bottom: 5, right: 5),
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
                                          builder: (context) => BidPage(
                                            image: snapshot
                                                .data!.assets![i].imageUrl
                                                .toString(),
                                            category: snapshot
                                                .data!.assets![i].contract!.type
                                                .toString(),
                                            name: snapshot.data!.assets![i].name
                                                .toString(),
                                            desc: snapshot.data!.assets![i]
                                                .contract!.description
                                                .toString(),
                                            date: snapshot.data!.assets![i]
                                                .collection!.createdAt
                                                .toString(),
                                          ),
                                        ),
                                      );
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Stack(
                                        children: [
                                          FutureBuilder<Autogenerated>(
                                            future: futureAutogenerated,
                                            builder: (context, snapshot) {
                                              if (snapshot.hasData) {
                                                //this is the one that return all the data from API
                                                print(
                                                    snapshot.data!.toString());
                                                //but this return null
                                                return ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                  child: Image(
                                                    fit: BoxFit.fill,
                                                    width: getWidht,
                                                    height: getHeight,
                                                    image: NetworkImage(snapshot
                                                        .data!
                                                        .assets![i]
                                                        .imageUrl
                                                        .toString()),
                                                  ),
                                                );
                                              } else if (snapshot.hasError) {
                                                print(
                                                    snapshot.error.toString());
                                                return Center(
                                                  child: Text(
                                                    snapshot.error.toString(),
                                                    style: const TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 25,
                                                    ),
                                                  ),
                                                );
                                              } else {
                                                // By default, show a loading spinner.
                                                return const Center(
                                                  child:
                                                      CircularProgressIndicator(
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
                                                  constraints:
                                                      const BoxConstraints(
                                                    maxWidth: double.infinity,
                                                    maxHeight: double.infinity,
                                                  ),
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: Text(
                                                    snapshot.data!.assets![i]
                                                        .collection!.createdAt
                                                        .toString()
                                                        .substring(0, 4),
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w700,
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
                                                  constraints:
                                                      const BoxConstraints(
                                                    maxWidth: double.infinity,
                                                    maxHeight: double.infinity,
                                                  ),
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: Text(
                                                    snapshot.data!.assets![i]
                                                        .collection!.createdAt
                                                        .toString()
                                                        .substring(5, 7),
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w700,
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
                                                  constraints:
                                                      const BoxConstraints(
                                                    maxWidth: double.infinity,
                                                    maxHeight: double.infinity,
                                                  ),
                                                  padding:
                                                      const EdgeInsets.all(5.0),
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  child: Text(
                                                    snapshot.data!.assets![i]
                                                        .collection!.createdAt
                                                        .toString()
                                                        .substring(8, 10),
                                                    style: const TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.w700,
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
                                                  bottomLeft:
                                                      Radius.circular(10),
                                                  bottomRight:
                                                      Radius.circular(10),
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
                                                minimum:
                                                    const EdgeInsets.all(20.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      snapshot
                                                          .data!.assets![i].name
                                                          .toString(),
                                                      style: const TextStyle(
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.bold,
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
                                                              BorderRadius
                                                                  .circular(15),
                                                          child: Container(
                                                            width: 40,
                                                            height: 40,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Colors
                                                                  .grey[300],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15),
                                                            ),
                                                            child: const Icon(
                                                              Iconsax
                                                                  .profile_2user,
                                                              color:
                                                                  Colors.black,
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
                                                              const Text(
                                                                "owner",
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .grey,
                                                                  fontSize: 13,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                              ),
                                                              const SizedBox(
                                                                height: 5,
                                                              ),
                                                              Text(
                                                                snapshot
                                                                    .data!
                                                                    .assets![i]
                                                                    .contract!
                                                                    .owner
                                                                    .toString(),
                                                                style:
                                                                    const TextStyle(
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 13,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w700,
                                                                ),
                                                              )
                                                            ],
                                                          ),
                                                        ),
                                                        const Spacer(),
                                                        InkWell(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                          child: Container(
                                                            width: 40,
                                                            height: 40,
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Colors
                                                                  .grey[300],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          15),
                                                            ),
                                                            child: const Icon(
                                                              Iconsax.data,
                                                              color:
                                                                  Colors.black,
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
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ],
                            ),
                          );
                        } else if (snapshot.hasError) {
                          print("${snapshot.error}");
                          return const Center(
                            child: Text(
                              'no network',
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                          );
                        } else {
                          // By default, show a loading spinner.
                          return const Center(
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
                  icon: Icon(Icons.newspaper, color: Colors.grey),
                  label: "",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Iconsax.wallet, color: Colors.grey),
                  label: "connect",
                ),
              ],
              onTap: (int i) => {
                if (i == 1)
                  {
                    setState(() {
                      buttonClicked = true;
                      activePage = const ViewAvailableCryptoPairs();
                    })
                  },
               
              if (i == 3)
                  {
                    setState(() {
                      buttonClicked = true;
                      activePage = const WalletPage();
                    })
                  }
              },
            ),
          );
  }
}
