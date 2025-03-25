import "dart:ui";

import "package:flutter/material.dart";
import "package:flutter_svg/flutter_svg.dart";
import "package:musicslly_app/core/configs/assets/app_vectors.dart";
import "package:musicslly_app/core/configs/theme/app_theme.dart";
import "package:musicslly_app/core/configs/theme/custom_container.dart";
import "package:musicslly_app/presentation/intro/pages/Into_Screens/intro_page1.dart";
import "package:musicslly_app/presentation/intro/pages/Into_Screens/intro_page2.dart";
import "package:musicslly_app/presentation/intro/pages/Into_Screens/intro_page3.dart";
import "package:musicslly_app/presentation/intro/pages/get_started.dart";
import "package:smooth_page_indicator/smooth_page_indicator.dart";

class OnBoardingScreens extends StatefulWidget {
  const OnBoardingScreens({Key? key}) : super(key: key);

  @override
  _OnBoardingScreensState createState() => _OnBoardingScreensState();
}

class _OnBoardingScreensState extends State<OnBoardingScreens> {
  PageController _controller = PageController();
  bool lastPage = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final pageIndicatorTheme = theme.extension<PageIndicatorTheme>()!;

    return Scaffold(
        //backgroundColor: Colors.black.withOpacity(0.9),
        body: Stack(
      children: [
        CustomContainer(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
        ),
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5), // Apply blur effect
          child: Container(),
        ),
        Container(
          color: Colors.black.withOpacity(0.05),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 20,
          ),
          child: Align(
            alignment: Alignment.topCenter,
            child: SvgPicture.asset(
              AppVectors.logo,
              height: 200,
            ),
          ),
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(
            //horizontal: 5,
            vertical: 20,
          ),
          child: PageView(
            controller: _controller,
            onPageChanged: (int page) {
              setState(() {
                if (page == 2) {
                  lastPage = true;
                } else {
                  lastPage = false;
                }
              });
            },
            children: [
              IntroPage1(),
              IntroPage2(),
              IntroPage3(),
            ],
          ),
        ),
        Container(
          alignment: Alignment(0, 0.85),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  _controller.animateToPage(2,
                      duration: Duration(milliseconds: 400),
                      curve: Curves.linear);
                },
                child: Container(
                  child: Text(
                    "Skip",
                    style: lastPage
                        ? theme.textTheme.bodyLarge?.copyWith(
                            color: Colors.transparent,
                          )
                        : theme.textTheme.bodyLarge,
                  ),
                ),
              ),
              SmoothPageIndicator(
                controller: _controller,
                count: 3,
                effect: ExpandingDotsEffect(
                  activeDotColor: pageIndicatorTheme.activeDotColor,
                  dotColor: pageIndicatorTheme.dotColor,
                  dotHeight: 8,
                  dotWidth: 8,
                  expansionFactor: 4,
                  spacing: 5,
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (!lastPage) {
                    _controller.nextPage(
                        duration: Duration(milliseconds: 350),
                        curve: Curves.linear);
                  } else {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (builder) => GetStartedPage()),
                        (route) => false);
                  }
                },
                child: Container(
                  child: Text(
                    lastPage ? "Done" : "Next",
                    style: theme.textTheme.bodyLarge,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
