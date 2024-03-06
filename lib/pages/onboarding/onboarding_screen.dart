import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  List<OnboardingItem> itemsList = [
    OnboardingItem(
      title: 'title 1',
      text: 'text 1'
    ),
    OnboardingItem(
      title: 'title 2',
      text: 'text 2'
    ),
    OnboardingItem(
      title: 'title 3',
      text: 'text 3'
    ),
    OnboardingItem(
      title: 'title 4',
      text: 'text 4'
    ),
  ];

  int currentPageValue = 0;
  PageController? controller;

  @override
  void initState() {
    super.initState();
    controller = PageController(initialPage: currentPageValue);
  }

  @override
  Widget build(BuildContext context) {

    final mq = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          SizedBox(
            width: mq.width,
            child: const Image(
              image: AssetImage('assets/bitcoin.jpg'),
              fit: BoxFit.fill,
            ),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: (){},
                child: const Text('Skip', style: TextStyle(color: Colors.black),)
              ),
            ),
          ),
          Container(
            height: mq.height * 0.40,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(45)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: mq.height * 0.10,
                  child: PageView.builder(
                    controller: controller,
                    itemCount: itemsList.length,
                    onPageChanged: (page) => changePage(page),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Text(itemsList[index].title),
                          Text(itemsList[index].text),
                        ],
                      );
                    },
                    physics: const ClampingScrollPhysics(),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    itemsList.length,
                    (index) {
                      if( index == currentPageValue) {
                        return const PageIndicator(isCurrentItem: true);
                      } else {
                        return const PageIndicator(isCurrentItem: false);
                      }
                    }
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  void changePage(int page) => setState(() => currentPageValue = page);

}

class PageIndicator extends StatelessWidget {
  const PageIndicator({
    super.key,
    required this.isCurrentItem
  });

  final bool isCurrentItem;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: isCurrentItem ? 50 : 10,
      height: 10,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: isCurrentItem ? Colors.green : Colors.green[200],
      ),
    );
  }
}

class OnboardingItem {

  OnboardingItem({
    required this.title,
    required this.text
  });
  
  final String title;
  final String text;
}