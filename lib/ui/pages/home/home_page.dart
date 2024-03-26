import 'package:crypto_ui/ui/foundation/crypto_texts.dart';
import 'package:flutter/material.dart';

import 'models/home_data.dart';
import 'widgets/home_search_bar.dart';
import 'widgets/home_trending.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final HomeData data = HomeData();

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    final theme = Theme.of(context);

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
                      const Text(
                        'See more',
                        style: TextStyle(
                          color: Color.fromRGBO(167, 223, 138, 1),
                          fontSize: 15
                        ),
                      )
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
                      text: data.gridData[index].middleText,
                      price: data.gridData[index].price,
                      percentage: data.gridData[index].percentage,
                    );
                  }
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
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
                    itemCount: 5,
                    separatorBuilder: (context, index) => const SizedBox(
                      width: 10,
                    ),
                    itemBuilder: (context, index) => const Chip(
                        label: Text('Popular', style: TextStyle(
                          color: Colors.white
                        ),),
                        backgroundColor: Color.fromRGBO(35, 37, 35, 1),
                        shape: StadiumBorder(),
                      ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  height: size.height * 0.1,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(167, 223, 138, 1),
                    borderRadius: BorderRadius.circular(25)
                  ),
                ),
                Container(
                  height: size.height * 0.1,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(35, 37, 35, 1),
                    borderRadius: BorderRadius.circular(25)
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