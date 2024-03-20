import 'package:flutter/material.dart';

import 'widgets/home_search_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  //35 37 35 light grey

  //138 135 138 background

  //167 223 138 green

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(23, 23, 23, 1),
      appBar: AppBar(
        backgroundColor: const Color.fromRGBO(23, 23, 23, 1),
        leading: const Icon(
          Icons.menu,
          color: Color.fromRGBO(138, 135, 138, 1)
        ),
        actions: const [
          Icon(Icons.notifications, color: Color.fromRGBO(138, 135, 138, 1)),
          SizedBox(width: 10,)
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: SafeArea(
          bottom: true,
          top: true,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HomeSearchBar(),
          
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Trending', style: TextStyle(
                    color: Colors.white,
                    fontSize: 25
                  )),
                  Text('See more', style: TextStyle(
                    color: Color.fromRGBO(167, 223, 138, 1)
                  ))
                ],
              ),
          
              SizedBox(
                height: 300,
                child: GridView.count(
                  childAspectRatio: (1 / .75),
                  crossAxisCount: 2,
                  children: List.generate(
                    4, (index) => Container(
                      margin: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: const Color.fromRGBO(35, 37, 35, 1)
                      ),
                    )
                  ),
                ),
              ),
          
              const Text('Discover',
                style: TextStyle(color: Colors.white, fontSize: 25)),
          
              SizedBox(
                height: 30,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                    5,
                    (index) => Container(
                      width: 100,
                      margin: const EdgeInsets.only(right: 7),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white
                      ),
                      child: const Center(
                        child: Text('Recent', style: TextStyle(
                          fontSize: 15
                        ),),
                      ),
                    )
                  ),
                ),
              ),
          
              Container(
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color.fromRGBO(167, 223, 138, 1)
                ),
                child: const Row(
                  children: [
          
                  ],
                ),
              ),
          
              Container(
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color.fromRGBO(167, 223, 138, 1)
                ),
                child: const Row(
                  children: [
          
                  ],
                ),
              ),
          
            ],
          ),
        ),
      ),
    );
  }
}