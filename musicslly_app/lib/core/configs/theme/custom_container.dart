import 'package:flutter/material.dart';
import 'package:musicslly_app/core/configs/assets/app_images.dart';

class CustomContainer extends StatelessWidget {
  final EdgeInsetsGeometry padding;

  CustomContainer({required this.padding});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 10,
        vertical: 10,
      ),
      height: double.infinity,
      width: double.infinity,
      child: Opacity(
          opacity: 0.6,
          child: Image.asset(
            AppImages.introBG,
            fit: BoxFit.contain,
          )),
    );
  }
}
