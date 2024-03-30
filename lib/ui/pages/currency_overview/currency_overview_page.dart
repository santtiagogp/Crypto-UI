import 'package:flutter/material.dart';

import '../../foundation/app_theme.dart';
import '../../widgets/crypto_chip.dart';
import '../../widgets/discover_card.dart';
import '../../widgets/page_button.dart';
import '../home/models/home_data_model.dart';
import 'widgets/home_chart.dart';

class CurrencyOverview extends StatelessWidget {
  
  const CurrencyOverview({
    super.key,
    required this.data
  });

  final HomeDataModel data;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios)
        ),
        actions: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: const Icon(Icons.more_vert, size: 25)
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Row(
              children: [
                const Icon(Icons.arrow_drop_up),
                Text('(${data.percentage}%)', style: const TextStyle(
                  fontSize: 15
                ),),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text('${data.symbol} 1 = \$${data.price}',
              style: const TextStyle(
                fontSize: 25,
                letterSpacing: -1,
                fontWeight: FontWeight.w500
            ),),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => const CryptoChip(text: 'Week'),
                separatorBuilder: (context, index) => const SizedBox(
                  width: 10,
                ),
                itemCount: 5
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.40,
            child: const HomeChart(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: DiscoverCard(
              title: data.currencyName,
              symbol: data.symbol.toString(),
              price: '\$${data.price.toString()}',
              image: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(data.imgPath)
              ),
              cardIndex: 2,
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Expanded(
                    child: PageButton(
                      onPressed: (){},
                      height: 65,
                      buttonText: 'Sell',
                      color: Colors.white,
                      textColor: Colors.black,
                    ),
                  ),
                  Expanded(
                    child: PageButton(
                      height: 65,
                      onPressed: (){},
                      buttonText: 'Buy',
                      textColor: Colors.black,
                      color: CryptoTheme.primaryColor,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}