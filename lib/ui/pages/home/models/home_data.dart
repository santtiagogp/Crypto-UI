import 'package:crypto_ui/ui/pages/home/models/home_data_model.dart';

class HomeData {

  List<HomeDataModel> gridData = [
    HomeDataModel(
      currencyName: 'Bitcoin',
      percentage: 12.44,
      imgPath: 'assets/btc.png',
      price: 120.00,
      middleText: '1.41 Holders'
    ),
    HomeDataModel(
      currencyName: 'Ethereum',
      percentage: 7.16,
      imgPath: 'assets/ethereum.png',
      price: 90.00,
      middleText: '0.87 Hash'
    ),
    HomeDataModel(
      currencyName: 'USDC',
      percentage: 9.57,
      imgPath: 'assets/usdc.png',
      price: 1.00,
      middleText: '2.18 Link'
    ),
    HomeDataModel(
      currencyName: 'DogeCoin',
      percentage: 11.28,
      imgPath: 'assets/dogecoin.png',
      price: 110.00,
      middleText: '3.21 Sum'
    )
  ];

}