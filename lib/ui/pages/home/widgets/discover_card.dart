import 'package:flutter/material.dart';

import '../../../foundation/app_theme.dart';

class DiscoverCard extends StatelessWidget {

  const DiscoverCard({
    super.key,
    required this.title,
    required this.symbol,
    required this.price,
    required this.imagePath
  });

  final String title;
  final String symbol;
  final String imagePath;
  final String price;

  @override
  Widget build(BuildContext context) {

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: CryptoTheme.primaryColor,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Row(
        children: [
      
          Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(imagePath)
              ),
              const SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600
                  )),
                  Text(symbol, style: const TextStyle(color: Colors.black))
                ]
              )
            ]
          ),
      
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(price, style: const TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w600
                )),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.arrow_drop_up_outlined, color: Colors.black),
                    Text('75.73 (1.52%)', style: TextStyle(
                      color: Colors.black
                    ))
                  ]
                )
              ],
            ),
          )
      
        ],
      ),
    );
  }
}