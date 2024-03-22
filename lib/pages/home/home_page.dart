import 'package:crypto_ui/pages/home/widgets/home_trending.dart';
import 'package:flutter/material.dart';

import 'widgets/home_search_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color.fromRGBO(23, 23, 23, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(23, 23, 23, 1),
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
          margin: const EdgeInsets.symmetric(horizontal: 25),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HomeSearchBar(),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Trending',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30
                        ),
                      ),
                      Text(
                        'See more',
                        style: TextStyle(
                          color: Color.fromRGBO(167, 223, 138, 1),
                          fontSize: 15
                        ),
                      )
                    ],
                  ),
                ),
                GridView.count(
                  childAspectRatio: (1 / .9),
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  children: List.generate(
                    4,
                    (index) => const TrendingBox()
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  child: const Text('Discover', style: TextStyle(
                    color: Colors.white,
                    fontSize: 30
                  )),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 25),
                  height: 30,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: List.generate(
                      5,
                      (index) => Container(
                        margin: const EdgeInsets.only(right: 5),
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: const Color.fromRGBO(35, 37, 35, 1),
                            
                          )
                        ),
                        child: const Center(
                          child: Text(
                            'Popular',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15
                            ),
                          )
                        ),
                      )
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