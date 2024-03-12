import 'package:flutter/material.dart';

import 'models/onboarding_item.dart';
import 'widgets/page_indicator_widget.dart';

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
      title: 'Invest with confidence',
      text: 'No losses at all, we got your back'
    ),
    OnboardingItem(
      title: 'Easily purchase cryptocurrencies',
      text: 'Use your debit, credit card or bank account'
    ),
  ];

  int currentPageValue = 0;
  late PageController controller;
  bool isFinalPage = false;

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
              image: AssetImage('assets/bitcoin.jpeg'),
              fit: BoxFit.cover,
            ),
          ),
          SafeArea(
            child: Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: (){},
                child: const Text('Skip', style: TextStyle(color: Colors.white),)
              ),
            ),
          ),
          Container(
            height: mq.height * 0.35,
            decoration: BoxDecoration(
              color: Colors.grey[100],
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
                    onPageChanged: (page) {
                      changePage(page);
                      page == 2 ? isFinalPage = true : isFinalPage = false;
                    },
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
                          const SizedBox(height: 10),
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
                  onPressed: () => isFinalPage ? redirectToHome() : animatePage(),
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
                    child: Text(
                      isFinalPage ? 'Go' : 'Next',
                      style: const TextStyle(
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

  void animatePage() {
    controller.animateToPage(
      controller.page!.toInt() + 1,
      duration: const Duration(milliseconds: 185),
      curve: Curves.ease
    );
  }

  void redirectToHome() {
    print('Time to go home!');
  }

}