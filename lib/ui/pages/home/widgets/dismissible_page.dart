import 'package:flutter/material.dart';

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
        child: const Column(
          children: [
            _Bar(),
            Text('Your account'),
            Placeholder()
          ],
        ),
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