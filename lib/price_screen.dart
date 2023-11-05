import 'package:crypocurrencies/service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'crypto.dart';

class PriceScreen extends StatefulWidget {

  const PriceScreen({super.key});

  @override
  State<PriceScreen> createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {

   late List<Coin> list;

  @override
  Future<void> loadCoinData() async {
    final cryptoData = Provider.of<CryptoData>(context, listen: false);
    list = await cryptoData.getCoinData();
    setState(() {}); // Trigger a rebuild after data loading is complete.
  }

   void initState() {
     super.initState();
     loadCoinData();
   }

  @override
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading:Icon(Icons.account_balance_wallet),
          title: Text("TrakingCrypto"),
            actions: <Widget>[
        IconButton(
        icon: Icon(Icons.refresh),
        onPressed: () {
          loadCoinData();
        },
      ),
      ],

        ),
        body: Consumer<CryptoData>(
          builder: (context, cryptoData, child) {
            return ListView.builder(
              itemCount: cryptoData.list.length,
              itemBuilder: (context, index) {
                final crypto = cryptoData.list[index];
                return ListTile(
                  leading: Icon(Icons.currency_bitcoin),
                  title: Text(crypto.name ?? ''),
                  trailing: Text(crypto.price ?? ''),
                );
              },
            );
          },
        ),
      ),
    );
  }
  }
