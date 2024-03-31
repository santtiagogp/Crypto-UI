import 'home_data_model.dart';

class HomeData {

  List<HomeDataModel> cryptoData = [
    HomeDataModel(
      currencyName: 'Bitcoin',
      percentage: 12.44,
      imgPath: 'assets/btc.png',
      price: 7007,
      symbol: 'BTC',
      middleText: '1.41 Holders'
    ),
    HomeDataModel(
      currencyName: 'Ethereum',
      percentage: 7.16,
      imgPath: 'assets/ethereum.png',
      price: 3530,
      symbol: 'ETH',
      middleText: '0.87 Hash'
    ),
    HomeDataModel(
      currencyName: 'USDC',
      percentage: 0.00,
      imgPath: 'assets/usdc.png',
      price: 1.00,
      symbol: 'USDC',
      middleText: '2.18 Link'
    ),
    HomeDataModel(
      currencyName: 'DogeCoin',
      percentage: 11.28,
      imgPath: 'assets/dogecoin.png',
      price: 0.20,
      symbol: 'DOGE',
      middleText: '3.21 Sum'
    ),
    HomeDataModel(
      currencyName: 'LiteCoin',
      percentage: 1.52,
      imgPath: 'assets/litecoin.png',
      price: 102.07,
      symbol: 'LTC',
      middleText: ''
    ),
    HomeDataModel(
      currencyName: 'Stellar',
      percentage: 12.44,
      imgPath: 'assets/stellar.png',
      price: 540-89,
      symbol: 'XLM',
      middleText: ''
    ),
  ];

  List<String> discoverPills = [
    'Popular',
    'Recent',
    'Favorite',
    'New',
    'Increasing'
  ];

  List<String> chartPills = [
    '24h',
    'Week',
    'Month',
    '6 Months',
    'Year'
  ];


}