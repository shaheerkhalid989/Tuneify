import 'package:flutter/material.dart';
import 'package:musicslly_app/core/configs/theme/app_colors.dart';

class BasicAppButton2 extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double height;

  const BasicAppButton2({
    required this.onPressed,
    required this.title,
    required this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        minimumSize: Size.fromHeight(height ?? 80),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: AppColors.primary,
        ),
      ),
    );
  }
}
