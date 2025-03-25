import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:musicslly_app/common/widgets/appbar/appBar.dart';
import 'package:musicslly_app/core/configs/assets/app_vectors.dart';
import 'package:musicslly_app/presentation/intro/pages/onBoarding_Screens.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    redirect();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.black.withOpacity(0.9),
      body: Stack(
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5), // Apply blur effect
            child: Container(),
          ),
          Container(
            color: Colors.black.withOpacity(0.05),
          ),
          const BasicAppBar(
            hideBackBtn: true,
          ),
          Center(
            child: SvgPicture.asset(
              AppVectors.logo,
              width: 380,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> redirect() async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
          builder: (BuildContext context) => const OnBoardingScreens()),
    );
  }
}
