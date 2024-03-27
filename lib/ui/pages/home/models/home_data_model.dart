class HomeDataModel {

  HomeDataModel({
    required this.currencyName,
    required this.percentage,
    required this.imgPath,
    required this.price,
    this.middleText,
    this.symbol
  });

  final String currencyName;
  final String? middleText;
  final String? symbol;
  final double price;
  final String imgPath;
  final double percentage;
}