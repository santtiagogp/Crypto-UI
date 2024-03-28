import 'package:crypto_ui/ui/widgets/discover_card.dart';

import 'widgets/home_chart.dart';
import 'package:flutter/material.dart';

class CurrencyOverview extends StatelessWidget {
  const CurrencyOverview({super.key});

  @override
  Widget build(BuildContext context) {
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
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('20.23 (1.51%)'),
          Text(r'DEE 1 = $1,214.20'),
          SizedBox(
            height: 400,
            child: HomeChart(),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: DiscoverCard(
              title: 'Bitcoin',
              symbol: 'BTC',
              price: '2133',
              imagePath: 'assets/btc.png',
              cardIndex: 2,
            ),
          )
        ],
      ),
    );
  }
}