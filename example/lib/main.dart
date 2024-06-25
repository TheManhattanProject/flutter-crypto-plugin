import 'package:flutter/material.dart';
import 'package:flutter_app_manager/flutter_app_manager.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Map<String, String>> _installedApps = [];

  @override
  void initState() {
    super.initState();
    _loadInstalledApps();
  }

  List<String> packagesList = [
    "com.binance.dev", // Binance
    "com.coinbase.android", // Coinbase
    "com.kucoin.android", // KuCoin
    "com.kraken.trade", // Kraken
    "com.ftxmobile.flutter", // FTX
    "com.bitfinex.mobileapp", // Bitfinex
    "com.gemini.android.app", // Gemini
    "com.blockfolio.blockfolio", // FTX (formerly Blockfolio)
    "com.coinmarketcap.android", // CoinMarketCap
    "com.robinhood.android", // Robinhood
    "com.etoro.openbook", // eToro
    "com.bitpanda.bitpanda", // Bitpanda
    "piuk.blockchain.android", // Blockchain Wallet
    "com.celsius.networkapp", // Celsius Network
    "io.nexo", // Nexo
    "com.crypterium", // Crypterium
    "com.mycelium.wallet", // Mycelium Bitcoin Wallet
    "com.bitcoin.mwallet", // Bitcoin Wallet
    "com.coinomi.wallet", // Coinomi
    "com.ledger.live", // Ledger Live
    'com.bitkeep.wallet', //Bitkeep
    'co.mona.android',
    'com.wallet.crypto.trustapp', //Trust App
    'com.bitpay.wallet', //Bitpay
    'exodusmovement.exodus', //Exodus
    'com.kubi.kucoin', //Kucoin
    'com.bittrex.bittrex', //Bitrex
    'com.okinc.okex', //Okex
    'io.metamask', //Metamask
    'com.coindcx.btc', //CoinDCX,
    'com.bitforex.bitforex' //Bitforex
  ];

  Future<void> _loadInstalledApps() async {
    final apps = await FlutterAppManager.getInstalledApps();
    for (int i = 0; i < apps.length; i++) {
      if (packagesList.contains(apps[i]['packageName'])) {
        _installedApps.add(apps[i]);
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Installed Apps'),
        ),
        body: ListView.builder(
          itemCount: _installedApps.length,
          itemBuilder: (context, index) {
            final app = _installedApps[index];
            return ListTile(
              title: Text(app['name'] ?? ''),
              subtitle: Text(app['packageName'] ?? ''),
              onTap: () => FlutterAppManager.openApp(app['packageName'] ?? ''),
            );
          },
        ),
      ),
    );
  }
}
