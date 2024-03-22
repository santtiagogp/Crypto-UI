import 'package:flutter/material.dart';

class TrendingBox extends StatelessWidget {
  const TrendingBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: const Color.fromRGBO(35, 37, 35, 1),
      ),
      padding: const EdgeInsets.all(15),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [

          Row(
            children: [
              CircleAvatar(
                radius: 15,
                child: Image(
                  image: AssetImage('assets/btc.png')
                ),
              ),
              SizedBox(width: 10,),
              Text('Bitcoin', style: TextStyle(
                color: Colors.white
              ),)
            ],
          ),

          Text('1.41 Holders', style: TextStyle(
            color: Colors.white,
            fontSize: 20
          ),),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('90.0 USD', style: TextStyle(
                color: Color.fromRGBO(111, 115, 111, 1)
              ),),
              Row(
                children: [
                  Icon(
                    Icons.arrow_drop_up,
                    color: Color.fromRGBO(167, 223, 138, 1),
                    size: 20,
                  ),
                  Text('12.44%', style: TextStyle(
                    color: Color.fromRGBO(167, 223, 138, 1)
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