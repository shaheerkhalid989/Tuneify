import "package:flutter/material.dart";
import "package:lottie/lottie.dart";
import "package:musicslly_app/core/configs/assets/app_gifs.dart";

class IntroPage1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      alignment: Alignment(0, 0.55),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width - 100,
      child: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 30,
          ),
          Text(
            "Welcome to Tuneify",
            style: textTheme.headlineLarge?.copyWith(
              fontSize: 32,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Text(
              "Dive into the world of music with Tuneify! Whether you're here to relax, discover new beats, or enjoy your all-time favorites, our app is your gateway to endless musical experiences.",
              textAlign: TextAlign.justify,
              style: textTheme.bodyMedium?.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                //color: Colors.black87
              ),
            ),
          ),
          // SizedBox(
          //   height: 10,
          // ),
          Lottie.asset(AppGifs.music_List,
              height: 350, width: 500, alignment: Alignment(0.85, 0)),
        ]),
      ),
    );
  }
}
