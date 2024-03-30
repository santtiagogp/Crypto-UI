import 'package:flutter/material.dart';

class TrendingBox extends StatefulWidget {
  const TrendingBox({
    super.key,
    required this.image,
    required this.title,
    required this.text,
    required this.price,
    required this.percentage,
    this.onTap
  });

  final ImageProvider<Object> image;
  final String title;
  final String text;
  final double price;
  final double percentage;
  final VoidCallback? onTap;

  @override
  State<TrendingBox> createState() => _TrendingBoxState();
}

class _TrendingBoxState extends State<TrendingBox>
  with SingleTickerProviderStateMixin{

  late AnimationController controller;
  late Animation<Offset> slide;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600)
    );
    slide = Tween(
      begin: const Offset(0.0, -70),
      end: const Offset(0.0, 0.0)
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Curves.easeInOutQuart
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
          child: GestureDetector(
            onTap: widget.onTap,
            child: TrendingCardUI(
              widget: widget,
            ),
          ),
        );
      }
    );

  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

class TrendingCardUI extends StatelessWidget {
  const TrendingCardUI({
    super.key,
    required this.widget,
  });

  final TrendingBox widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: const Color.fromRGBO(35, 37, 35, 1),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
    
          Row(
            children: [
              CircleAvatar(
                radius: 15,
                child: Image(
                  image: widget.image
                ),
              ),
              const SizedBox(width: 10,),
              Text(widget.title, style: const TextStyle(
                color: Colors.white,
                fontSize: 18
              ),)
            ],
          ),
    
          Text(widget.text, style: const TextStyle(
            color: Colors.white,
            fontSize: 20
          ),),
    
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\$${widget.price} USD', style: const TextStyle(
                color: Color.fromRGBO(111, 115, 111, 1),
                fontSize: 12,
              ),),
              Row(
                children: [
                  const Icon(
                    Icons.arrow_drop_up,
                    color: Color.fromRGBO(167, 223, 138, 1),
                    size: 13,
                  ),
                  Text('${widget.percentage}%', style: const TextStyle(
                    color: Color.fromRGBO(167, 223, 138, 1),
                    fontSize: 10,
                  ),),
                ],
              )
            ],
          )
    
        ],
      ),
    );
  }
}