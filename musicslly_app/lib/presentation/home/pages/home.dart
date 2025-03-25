import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:musicslly_app/common/helper/is_dark_mode.dart';
import 'package:musicslly_app/common/widgets/appbar/appBar.dart';
import 'package:musicslly_app/common/widgets/card/hometopCard.dart';
import 'package:musicslly_app/core/configs/assets/app_vectors.dart';
import 'package:musicslly_app/core/configs/theme/app_colors.dart';
import 'package:musicslly_app/core/configs/theme/app_theme.dart';
import 'package:musicslly_app/presentation/home/widgets/news_songs.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  final List<Map<String, dynamic>> albumCards = [
    {
      'artistImg': AppVectors.bili1,
      'artistName': 'Billie Eilish',
      'albumName': 'Hit Me Hard and Soft',
      'imageheight': 195.0,
      'imagePaddingBottom': 7.0,
      'imagePaddingRight': 34.5,
    },
    {
      'artistImg': AppVectors.asim,
      'artistName': 'Asim Azhar',
      'albumName': 'BEMATLAB',
      'imageheight': 200.0,
      'imagePaddingBottom': 8.0,
      'imagePaddingRight': 33.0,
    },
    {
      'artistImg': AppVectors.dualipa,
      'artistName': 'Dua Lipa',
      'albumName': 'Radical Optimism',
      'imageheight': 200.0,
      'imagePaddingBottom': 8.0,
      'imagePaddingRight': 33.0,
    },
    {
      'artistImg': AppVectors.yoyo,
      'artistName': 'Yoyo Honey Sing',
      'albumName': 'Honey 3.0',
      'imageheight': 200.0,
      'imagePaddingBottom': 8.0,
      'imagePaddingRight': 33.0,
    },
    {
      'artistImg': AppVectors.justin,
      'artistName': 'Justin Bieber',
      'albumName': 'Justice',
      'imageheight': 200.0,
      'imagePaddingBottom': 8.0,
      'imagePaddingRight': 33.0,
    },
    {
      'artistImg': AppVectors.badshah,
      'artistName': 'Badshah',
      'albumName': 'Ek Tha Raja',
      'imageheight': 200.0,
      'imagePaddingBottom': 8.0,
      'imagePaddingRight': 33.0,
    },
    {
      'artistImg': AppVectors.aliZafar,
      'artistName': 'Ali Zafar',
      'albumName': 'Jhoom',
      'imageheight': 190.0,
      'imagePaddingBottom': 8.0,
      'imagePaddingRight': 34.0,
    },
    {
      'artistImg': AppVectors.apDhillon1,
      'artistName': 'AP Dhillon',
      'albumName': 'Dil Nu',
      'imageheight': 200.0,
      'imagePaddingBottom': 8.0,
      'imagePaddingRight': 33.0,
    },
  ];

  final PageController _pageController = PageController(viewportFraction: 1.03);
  int _currentPage = 0;
  Timer? _timer;
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    _startAutoScroll();
    tabController = TabController(
      length: 4,
      vsync: this,
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoScroll() {
    _timer = Timer.periodic(Duration(seconds: 2, milliseconds: 500), (timer) {
      if (_pageController.hasClients) {
        int nextPage = (_currentPage + 1) % albumCards.length;
        _pageController.animateToPage(
          nextPage,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
        setState(() {
          _currentPage = nextPage;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final pageIndicatorTheme = theme.extension<PageIndicatorTheme>()!;

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            BackdropFilter(
              filter:
                  ImageFilter.blur(sigmaX: 5, sigmaY: 5), // Apply blur effect
              child: Container(),
            ),
            Container(
              color: Colors.black.withOpacity(0.05),
            ),
            BasicAppBar(
              hideBackBtn: true,
              title: SvgPicture.asset(
                AppVectors.logo,
                height: 40,
                width: 40,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                children: [
                  SizedBox(height: 80),
                  cardListView(context),
                  cardIndicator(context),
                  SizedBox(height: 5),
                  tabs(context),
                  SizedBox(
                    height: 260,
                    child: TabBarView(
                      children: [
                        const NewsSongs(),
                        Container(),
                        Container(),
                        Container(),
                      ],
                      controller: tabController,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget cardListView(BuildContext context) {
    return SizedBox(
      height: 230, // Set height for the PageView
      child: PageView.builder(
        controller: _pageController,
        itemCount: albumCards.length,
        onPageChanged: (index) {
          setState(() {
            _currentPage = index;
          });
        },
        itemBuilder: (context, index) {
          return AnimatedBuilder(
            animation: _pageController,
            builder: (context, child) {
              double value = 1.0;
              if (_pageController.position.haveDimensions) {
                value = _pageController.page! - index;
                value = (1 - (value.abs() * 0.3)).clamp(0.8, 1.0);
              }
              return Center(
                child: Transform.scale(
                  scale: value,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Hometopcard(
                      artistImg: albumCards[index]['artistImg']!,
                      artistName: albumCards[index]['artistName']!,
                      albumName: albumCards[index]['albumName']!,
                      imageheight: albumCards[index]['imageheight']!,
                      imagePaddingBottom: albumCards[index]
                          ['imagePaddingBottom']!,
                      imagePaddingRight: albumCards[index]
                          ['imagePaddingRight']!,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget cardIndicator(BuildContext context) {
    final theme = Theme.of(context);
    final pageIndicatorTheme = theme.extension<PageIndicatorTheme>()!;
    return SmoothPageIndicator(
      controller: _pageController,
      count: albumCards.length,
      effect: ExpandingDotsEffect(
        activeDotColor: pageIndicatorTheme.activeDotColor,
        dotColor: pageIndicatorTheme.dotColor,
        dotHeight: 8,
        dotWidth: 8,
        spacing: 4,
      ),
    );
  }

  Widget tabs(BuildContext context) {
    return TabBar(
        indicatorColor: context.isDarkMode
            ? AppColors.lightGreen
            : AppColors.primary.withOpacity(0.8),
        labelColor: context.isDarkMode
            ? AppColors.lightGreen
            : AppColors.primary.withOpacity(0.8),
        labelStyle: TextStyle(
            //fontSize: 15,
            fontWeight: FontWeight.w600),
        controller: tabController,
        dividerColor: Colors.transparent,
        indicatorWeight: 1,
        indicatorPadding: EdgeInsets.only(bottom: 10),
        tabs: [
          Tab(
            text: 'News',
          ),
          Tab(text: 'Videos'),
          Tab(text: 'Artists'),
          Tab(text: 'Podcasts'),
        ]);
  }
}
