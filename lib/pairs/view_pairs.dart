import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
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
Future<CryptoPairs> fetchCryptoPairs() async {
  var headers = {'Authorization': 'Bearer '};
  
  var uri = Uri.parse('https://api.m3o.com/v1/nft/Assets');
  var response = await http.get(uri, headers: headers);

  if (response.statusCode == 200) {
    print(response.body);
    // If the server did return a 200 OK response,
    // then parse the JSON.
    return CryptoPairs.fromJson(jsonDecode(response.body));
  } else {
    print("even data never load");
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load details');
  }
}

class CryptoPairs {
  List<Symbols>? symbols;

  CryptoPairs({this.symbols});

  CryptoPairs.fromJson(Map<String, dynamic> json) {
    if (json['symbols'] != null) {
      symbols = <Symbols>[];
      json['symbols'].forEach((v) {
        symbols!.add(new Symbols.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.symbols != null) {
      data['symbols'] = this.symbols!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Symbols {
  String? symbol;
  String? name;

  Symbols({this.symbol, this.name});

  Symbols.fromJson(Map<String, dynamic> json) {
    symbol = json['symbol'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['symbol'] = this.symbol;
    data['name'] = this.name;
    return data;
  }
}

class ViewAvailableCryptoPairs extends StatefulWidget {
  const ViewAvailableCryptoPairs({Key? key}) : super(key: key);

  @override
  State<ViewAvailableCryptoPairs> createState() =>
      _ViewAvailableCryptoPairsState();
}

class _ViewAvailableCryptoPairsState extends State<ViewAvailableCryptoPairs> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}