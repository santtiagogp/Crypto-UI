import 'package:flutter/material.dart';

import '../../../foundation/app_theme.dart';

class DiscoverCard extends StatefulWidget {

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
  State<DiscoverCard> createState() => _DiscoverCardState();
}

class _DiscoverCardState extends State<DiscoverCard>
  with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation<Offset> slide;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    slide = Tween<Offset>(
      begin: const Offset(150.0, 0.0),
      end: const Offset(0.0, 0.0)
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.ease
    ));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    controller.forward();

    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Transform.translate(
          offset: slide.value,
          child: DiscoverCardUI(
            widget: widget
          ),
        );
      }
    );
  }
}

class DiscoverCardUI extends StatelessWidget {
  const DiscoverCardUI({
    super.key,
    required this.widget,
  });

  final DiscoverCard widget;

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
                backgroundImage: AssetImage(widget.imagePath)
              ),
              const SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.title, style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w600
                  )),
                  Text(widget.symbol, style: const TextStyle(color: Colors.black))
                ]
              )
            ]
          ),
      
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(widget.price, style: const TextStyle(
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