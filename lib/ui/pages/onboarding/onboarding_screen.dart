import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../foundation/app_theme.dart';
import '../../foundation/crypto_texts.dart';
import '../home/home_page.dart';
import 'models/onboarding_data.dart';
import '../../widgets/page_button.dart';
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

  final data = OnboardingData.itemsList;

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
              IgnorePointer(
                ignoring: isFinalPage ? true : false,
                child: AnimatedOpacity(
                  opacity: isFinalPage ? 0 : 1,
                  duration: const Duration(milliseconds: 200),
                  child: SkipButton(
                    onPressed: () => redirectToHome(),
                  ),
                ),
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
                        itemCount: data.length,
                        itemBuilder: (context, index) => Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CryptoTexts.largeText(
                              data[index].title,
                              fontWeight: FontWeight.w600,
                              color: CryptoTheme.secondaryColor
                            ),
                            const SizedBox(height: 10),
                            CryptoTexts.mediumText(
                              data[index].text,
                              color: CryptoTheme.secondaryColor,
                            ),
                          ],
                        )
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        data.length,
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
                      color: CryptoTheme.secondaryColor,
                      textColor: Colors.white,
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