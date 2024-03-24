import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../home/home_page.dart';
import 'models/onboarding_item.dart';
import 'widgets/page_button.dart';
import 'widgets/page_indicator_widget.dart';
import 'widgets/skip_button.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  startTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? firstTime = prefs.getBool('first_time');

    const duration = Duration(seconds: 0);

    if (firstTime != null && !firstTime) {
      return Timer(duration, redirectToHome);
    } else {
      prefs.setBool('first_time', false);
      return Timer(duration, redirectToOnboarding);
    }
  }

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
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/bitcoin.jpeg')
          )
        ),
        child: SafeArea(
          bottom: false,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Visibility(
                visible: isFinalPage ? false : true,
                child: SkipButton(
                  onPressed: () => redirectToHome(),
                )
              ),
              Container(
                height: mq.height * 0.35,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)
                  )
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: mq.height * 0.10,
                      child: PageView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        onPageChanged: (index) {
                          changePage(index);
                          index == 2 ? isFinalPage = true : isFinalPage = false;
                        },
                        controller: controller,
                        itemCount: itemsList.length,
                        itemBuilder: (context, index) => Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              itemsList[index].title,
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                            Text(itemsList[index].text),
                          ],
                        )
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
                    PageButton(
                      buttonText: isFinalPage
                        ? 'Go'
                        : 'Next',
                      onPressed: ()
                        => isFinalPage
                        ? redirectToHome()
                        : animatePage(),
                      width: mq.width * 0.8,
                      height: mq.height * 0.08,
                    )
                  ],
                ),
              )
            ],
          ),
        )
      )
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

  void redirectToHome() => Navigator.pushReplacement(
    context,
    MaterialPageRoute(
      builder: (context) => HomePage()
    )
  );

  void redirectToOnboarding() => Navigator.push(
    context,
    MaterialPageRoute(
      builder: (controller) => const OnboardingScreen()
    )
  );

}