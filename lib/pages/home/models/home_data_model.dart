class HomeDataModel {

  HomeDataModel({
    required this.currencyName,
    required this.percentage,
    required this.imgPath,
    required this.price,
    required this.middleText
  });

  final String currencyName;
  final String middleText;
  final double price;
  final String imgPath;
  final double percentage;
}