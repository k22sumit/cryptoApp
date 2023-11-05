import 'package:crypocurrencies/price_screen.dart';
import 'package:crypocurrencies/service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => CryptoData(), // Provide an instance of CryptoData
      child: MaterialApp(
        home: PriceScreen(),
      ),
    );
  }
}
