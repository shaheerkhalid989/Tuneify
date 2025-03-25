import "package:flutter/material.dart";
import "package:lottie/lottie.dart";
import "package:musicslly_app/core/configs/assets/app_gifs.dart";

class IntroPage2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
      alignment: Alignment(0, 0.37),
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width - 100,
      child: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 30,
          ),
          Text(
            "Discover and Listen",
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
              "Tuneify lets you explore and stream a vast library of songs from all genres. Find the perfect soundtrack for every moment, and enjoy high-quality audio that brings your music to life.",
              textAlign: TextAlign.justify,
              style: textTheme.bodyMedium?.copyWith(
                fontSize: 15,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Lottie.asset(AppGifs.playlist, height: 300, width: 300),
          
        ]),
      ),
    );
  }
}
