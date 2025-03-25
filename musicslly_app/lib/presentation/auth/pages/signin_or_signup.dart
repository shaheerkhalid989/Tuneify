import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:musicslly_app/common/widgets/appbar/appBar.dart';
import 'package:musicslly_app/common/widgets/button/basic_app_button.dart';
import 'package:musicslly_app/common/widgets/button/basic_app_button2.dart';
import 'package:musicslly_app/core/configs/assets/app_vectors.dart';
import 'package:musicslly_app/presentation/auth/pages/signin.dart';
import 'package:musicslly_app/presentation/auth/pages/signup.dart';

class SignIn_SignUp extends StatelessWidget {
  const SignIn_SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Stack(
        children: [
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5), // Apply blur effect
            child: Container(),
          ),
          Container(
            color: Colors.black.withOpacity(0.05),
          ),
          const BasicAppBar(),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 200,
            ),
            child: Column(children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: SvgPicture.asset(
                  AppVectors.logo,
                  height: 120,
                ),
              ),
              //Spacer(),
              SizedBox(
                  //height: 20,
                  ),
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
                'Explore millions of tracks, curated playlists, and personalized recommendations with Tuneify. Enjoy high-quality sound, offline listening, and seamless device integration. Join the Tuneify community and elevate your music experience today!',
                style: textTheme.bodyMedium?.copyWith(
                  //color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 60,
              ),
              Row(
                children: [
                  SizedBox(width: 20),
                  Expanded(
                      flex: 1,
                      child: BasicAppButton(
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignUpPage(),
                              ),
                              (route) => false,
                            );
                          },
                          title: "SignUp",
                          height: 65)),
                  SizedBox(width: 25),
                  Expanded(
                      flex: 1,
                      child: BasicAppButton2(
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SignInPage(),
                              ),
                              (route) => false,
                            );
                          },
                          title: "SignIn",
                          height: 65)),
                  SizedBox(width: 20),
                ],
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
