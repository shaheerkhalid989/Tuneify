import "package:flutter/material.dart";
import "package:lottie/lottie.dart";
import "package:musicslly_app/core/configs/assets/app_gifs.dart";

class IntroPage3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      alignment: Alignment(0, 0.97),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width - 100,
      child: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 30,
          ),
          Text(
            "Share the Love",
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
              "Music is meant to be shared! With Tuneify, you can easily share your favorite tracks and playlists with friends and family, spreading joy and connecting with loved ones through the power of music.",
              textAlign: TextAlign.justify,
              style: textTheme.bodyMedium?.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Lottie.asset(AppGifs.share,
              height: 400, width: 300, alignment: Alignment(0, -1)),
        ]),
      ),
    );
  }
}
