import 'package:flutter/material.dart';

class TrendingBox extends StatelessWidget {
  const TrendingBox({
    super.key,
    required this.imgPath,
    required this.title,
    required this.text,
    required this.price,
    required this.percentage
  });

  final String imgPath;
  final String title;
  final String text;
  final double price;
  final double percentage;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: const Color.fromRGBO(35, 37, 35, 1),
      ),
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [

          Row(
            children: [
              CircleAvatar(
                radius: 15,
                child: Image(
                  image: AssetImage(imgPath)
                ),
              ),
              const SizedBox(width: 10,),
              Text(title, style: const TextStyle(
                color: Colors.white,
                fontSize: 18
              ),)
            ],
          ),

          Text(text, style: const TextStyle(
            color: Colors.white,
            fontSize: 20
          ),),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('$price USD', style: const TextStyle(
                color: Color.fromRGBO(111, 115, 111, 1),
                fontSize: 12
              ),),
              Row(
                children: [
                  const Icon(
                    Icons.arrow_drop_up,
                    color: Color.fromRGBO(167, 223, 138, 1),
                    size: 18,
                  ),
                  Text('$percentage%', style: const TextStyle(
                    color: Color.fromRGBO(167, 223, 138, 1),
                    fontSize: 12
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