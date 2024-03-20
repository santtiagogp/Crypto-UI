import 'package:flutter/material.dart';

import 'widgets/home_search_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  //35 37 35

  //138 135 138

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
      body: const Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: HomeSearchBar(),
          ),
          Row(
            children: [
              Text('Trending'),
              Text('See more')
            ],
          )
        ],
      ),
    );
  }
}