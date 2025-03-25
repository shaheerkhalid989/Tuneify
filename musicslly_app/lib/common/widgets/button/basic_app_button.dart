import 'package:flutter/material.dart';
import 'package:musicslly_app/core/configs/theme/app_colors.dart';

class BasicAppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final double height;

  const BasicAppButton({
    required this.onPressed,
    required this.title,
    required this.height,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        minimumSize: Size.fromHeight(height ?? 80),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: AppColors.lightGreen,
        ),
      ),
    );
  }
}
