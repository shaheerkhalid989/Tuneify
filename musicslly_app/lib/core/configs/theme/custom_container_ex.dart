import 'package:flutter/material.dart';
import 'package:musicslly_app/core/configs/assets/app_images.dart';
import 'package:musicslly_app/core/configs/theme/app_theme.dart';
import 'package:musicslly_app/core/configs/theme/app_theme_extra.dart';

class CustomContainerEx extends StatelessWidget {
  final EdgeInsetsGeometry padding;

  CustomContainerEx({required this.padding});

  @override
  Widget build(BuildContext context) {
    final customDecoration = Theme.of(context).extension<CustomDecoration>()!;
    return Container(
      padding: padding,
      decoration: customDecoration.containerDecoration,
    );
  }
}
