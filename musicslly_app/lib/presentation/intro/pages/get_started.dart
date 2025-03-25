import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:musicslly_app/common/widgets/button/basic_app_button.dart';
import 'package:musicslly_app/core/configs/assets/app_vectors.dart';
import 'package:musicslly_app/core/configs/theme/custom_container.dart';
import 'package:musicslly_app/presentation/choose_mode/pages/choose_mode.dart';

class GetStartedPage extends StatelessWidget {
  const GetStartedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

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
            child: Column(children: [
              // SizedBox(
              //   height: -10,
              // ),
              Align(
                alignment: Alignment.topCenter,
                child: SvgPicture.asset(
                  AppVectors.logo,
                  height: 200,
                ),
              ),
              Spacer(),
              Text(
                'Enjoy Listening to Music',
                style: textTheme.headlineLarge?.copyWith(
                  //color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Explore millions of tracks, curated playlists, and personalized recommendations with Tuneify. Enjoy high-quality sound, offline listening, and seamless device integration. Join the Tune community and elevate your music experience today!',
                style: textTheme.bodyMedium?.copyWith(
                  //color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                  //letterSpacing: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 25,
              ),
              BasicAppButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const ChooseModePage(),
                    ),
                    (route) => false,
                  );
                },
                title: "Get Started",
                height: 80,
              ),
              SizedBox(
                height: 20,
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
