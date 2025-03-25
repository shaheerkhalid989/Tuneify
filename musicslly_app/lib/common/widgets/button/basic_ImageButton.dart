import 'package:flutter/material.dart';
import 'package:musicslly_app/common/helper/is_dark_mode.dart';

class BasicImageButton extends StatelessWidget {
  final VoidCallback onPressed;
  final double dimentions;
  final String imageAdd;

  const BasicImageButton({
    required this.onPressed,
    required this.dimentions,
    required this.imageAdd,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(5),
      splashColor: context.isDarkMode
          ? Colors.black.withOpacity(0.8)
          : Colors.white.withOpacity(0.8),
      child: Container(
        height: dimentions ?? 60,
        width: dimentions ?? 60,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(6),
          border: Border.all(
            color: Colors.grey,
            width: 2,
          ),
        ),
        child: Align(
          alignment: Alignment.center,
          child: Image.asset(
            imageAdd,
            alignment: Alignment.center,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
