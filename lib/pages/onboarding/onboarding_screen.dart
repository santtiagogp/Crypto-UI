import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  List<OnboardingItem> itemsList = [
    OnboardingItem(
      title: 'Simplify your life with BTCash',
      text: 'Spend, earn and track financial activity'
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
                    physics: const NeverScrollableScrollPhysics(),
                    controller: controller,
                    itemCount: itemsList.length,
                    onPageChanged: (page) => changePage(page),
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Text(
                            itemsList[index].title,
                            style: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(itemsList[index].text),
                        ],
                      );
                    },
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
                ),
                TextButton(
                  onPressed: () => controller!.animateToPage(
                    controller!.page!.toInt() + 1,
                    duration: const Duration(milliseconds: 150),
                    curve: Curves.ease
                  ),
                  style: ButtonStyle(
                    splashFactory: NoSplash.splashFactory,
                    overlayColor: MaterialStateProperty.all(Colors.transparent)
                  ),
                  child: Container(
                    margin: const EdgeInsets.only(top: 20),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 160,
                      vertical: 20
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(25)
                    ),
                    child: const Text('Next',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                      ),
                    ),
                  )
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
      curve: Curves.ease,
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 3),
      width: isCurrentItem ? 40 : 8,
      height: 8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: isCurrentItem ? Colors.black : Colors.grey[300],
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