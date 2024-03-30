import 'package:flutter/material.dart';

import '../../foundation/app_theme.dart';
import '../../foundation/crypto_texts.dart';
import '../../widgets/crypto_chip.dart';
import '../../widgets/discover_card.dart';
import '../currency_overview/currency_overview_page.dart';
import 'models/home_data.dart';
import 'models/home_data_model.dart';
import 'widgets/home_search_bar.dart';
import 'widgets/home_trending.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final HomeData data = HomeData();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: const Color.fromRGBO(23, 23, 23, 1),
      appBar: AppBar(
        leading: const Icon(Icons.menu, color: Colors.white),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: const Icon(Icons.notifications, color: Colors.white)
          )
        ]
      ),
      body: SafeArea(
        bottom: true,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeSearchBar(),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CryptoTexts.largeHeading(
                        'Trending',
                        fontWeight: FontWeight.w400
                      ),
                      CryptoTexts.mediumText(
                        'See more',
                        color: CryptoTheme.primaryColor
                      ),
                    ],
                  ),
                ),
                GridView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 4,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: (1 / .8),
                  ),
                  itemBuilder: (context, index) {
                    return TrendingBox(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CurrencyOverview(
                            data: data.cryptoData[index],
                          )
                        )
                      ),
                      image: AssetImage(data.cryptoData[index].imgPath),
                      title: data.cryptoData[index].currencyName,
                      text: data.cryptoData[index].middleText.toString(),
                      price: data.cryptoData[index].price,
                      percentage: data.cryptoData[index].percentage,
                    );
                  }
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  child: CryptoTexts.largeHeading(
                    'Discover',
                    fontWeight: FontWeight.w400
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 25),
                  height: 50,
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: data.discoverPills.length,
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 10,
                    ),
                    itemBuilder: (context, index) => CryptoChip(
                      text: data.discoverPills[index]
                    ),
                  ),
                ),
                const SizedBox(height: 10,),
                SizedBox(
                  height: 250,
                  child: ListView.builder(
                    itemCount: 2,
                    itemBuilder: (context, index) {

                      List<HomeDataModel> discoverList
                        = List.from(data.cryptoData.skip(4));

                      return DiscoverCard(
                        onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CurrencyOverview(
                              data: discoverList[index]
                            )
                          )
                        ),
                        cardIndex: index,
                        title: discoverList[index].currencyName,
                        symbol: discoverList[index].symbol.toString(),
                        price: r'$'+discoverList[index].price.toString(),
                        image: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset(
                            discoverList[index].imgPath,
                          ),
                        ),
                      );
                    }
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}