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
     "com.binance.dev", // Binance (not avalable in play store) checked
    "com.coinbase.android", // Coinbase //checked
    "com.kucoin.android", // KuCoin checked
    "com.kraken.trade", // Kraken checked
    // "com.ftxmobile.flutter", // FTX no longer available
    // "com.bitfinex.mobileapp", // Bitfinex app is not avalable in play store
    "com.google.android.apps.bard", // Gemini checked
    "com.blockfolio.blockfolio", // FTX (formerly Blockfolio) noo longer available
    "com.coinmarketcap.android", // CoinMarketCap checked
    "com.robinhood.gateway", // Robinhood checked
    "com.etoro.openbook", // eToro checked
    // "com.bitpanda.bitpanda", // Bitpanda app isn't avalable in india
    "piuk.blockchain.android", // Blockchain Wallet checked
    // "com.celsius.networkapp", // Celsius Network not avalable in play store
    "com.nexowallet", // Nexo checked
    "com.crypterium", // Crypterium(app name: choise.com) checked
    "com.mycelium.wallet", // Mycelium Bitcoin Wallet checked
    "de.schildbach.wallet", // Bitcoin Wallet checked
    "com.coinomi.wallet", // Coinomi not avaleble for latest android version
    "com.ledger.live", // Ledger Live checked
    'com.bitkeep.wallet', //Bitkeep checked
    'co.mona.android', //crypto.com checked 
    'com.wallet.crypto.trustapp', //Trust App checked
    'com.bitpay.wallet', //Bitpay checked
    'exodusmovement.exodus', //Exodus checked
    'com.kubi.kucoin', //Kucoin checked
    // 'com.bittrex.bittrex', //Bitrex not avalable
    'com.okinc.okex.gp', //Okex not avalable in play store
    'io.metamask', //Metamask checked
    'com.coindcx.btc', //CoinDCX, checked
    'com.bitforex.bitforex' //Bitforex checked
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
