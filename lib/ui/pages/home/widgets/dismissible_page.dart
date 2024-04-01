import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../foundation/app_theme.dart';

class DismissiblePage extends StatelessWidget {
  const DismissiblePage({super.key});

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Dismissible(
      key: const Key('key'),
      direction: DismissDirection.vertical,
      onDismissed: (direction) => Navigator.pop(context),
      child: Container(
        decoration: BoxDecoration(
          color: CryptoTheme.secondaryColor,
          borderRadius: BorderRadius.circular(30)
        ),
        height: size.height * 0.7,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const _Bar(),
            const Text('Your account', style: TextStyle(
              fontSize: 18
            ),),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image(
                image: const AssetImage('assets/qr.png'),
                height: size.height * 0.4,
              ),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _DismissibleButton(
                  text: 'Copy',
                  icon: Icon(Icons.copy),
                ),
                SizedBox(width: 50),
                _DismissibleButton(
                  text: 'Share',
                  icon: Icon(Icons.ios_share),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _DismissibleButton extends StatelessWidget {
  const _DismissibleButton({
    required this.text,
    required this.icon
  });

  final String text;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 50),
      child: Column(
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color.fromRGBO(35, 37, 35, 1)
            ),
            child: icon
          ),
          const SizedBox(height: 10,),
          Text(text)
        ],
      ),
    );
  }
}

class _Bar extends StatelessWidget {
  const _Bar();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6,
      width: 100,
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(60)
      ),
    );
  }
}