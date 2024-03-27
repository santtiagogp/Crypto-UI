import 'widgets/discover_card.dart';

import 'package:flutter/material.dart';

import '../../foundation/app_theme.dart';
import '../../foundation/crypto_texts.dart';
import 'models/home_data.dart';
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
                  itemCount: data.gridData.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: (1 / .8),
                  ),
                  itemBuilder: (context, index) {
                    return TrendingBox(
                      imgPath: data.gridData[index].imgPath,
                      title: data.gridData[index].currencyName,
                      text: data.gridData[index].middleText.toString(),
                      price: data.gridData[index].price,
                      percentage: data.gridData[index].percentage,
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
                    itemBuilder: (context, index) => Chip(
                        label: Text(data.discoverPills[index],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15
                        ),),
                        backgroundColor: const Color.fromRGBO(35, 37, 35, 1),
                        shape: const StadiumBorder(),
                      ),
                  ),
                ),
                const SizedBox(height: 10,),
                SizedBox(
                  height: 250,
                  child: ListView.builder(
                    itemCount: data.discoverData.length,
                    itemBuilder: (context, index) {
                      return DiscoverCard(
                        title: data.discoverData[index].currencyName,
                        symbol: data.discoverData[index].symbol.toString(),
                        price: r'$'+data.discoverData[index].price.toString(),
                        imagePath: data.discoverData[index].imgPath
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