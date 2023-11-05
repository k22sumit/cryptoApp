import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'crypto.dart';

const apikey = "600F1531-F414-408D-9982-B40213BD6BB1";
const coinAPIURL = 'https://rest.coinapi.io/v1/exchangerate/';

const List<String> currenciesList = [
  'AUD', 'BRL', 'CAD', 'CNY', 'EUR', 'GBP', 'HKD', 'IDR', 'ILS', 'INR',
  'JPY', 'MXN', 'NOK', 'NZD', 'PLN', 'RON', 'RUB', 'SEK', 'SGD', 'USD', 'ZAR'
];

class CryptoData with ChangeNotifier {
  List<Coin> list = [];
  List<String> cryptoList = [
    "BTC", "ETH", "XRP", "LTC", "ADA", "DOGE", "LINK", "DOT", "BCH", "XLM"
  ]; // Fixed typo in variable name

  Future<List<Coin>> getCoinData() async {
    list = [];
    Map<String, String> cryptoPrices = {};

    for (String str in cryptoList) { // Fixed typo in variable name
      String url = 'https://rest.coinapi.io/v1/exchangerate/$str/INR?apikey=600F1531-F414-408D-9982-B40213BD6BB1';
      http.Response response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        double rate = data['rate'];
        cryptoPrices[str] = rate.toStringAsFixed(10);
        print(response.statusCode);
        list.add(Coin(price: cryptoPrices[str], name: str));
      } else {
        print(response.statusCode);
        throw ("There is an error");
      }
    }
    return list;
  }
}
