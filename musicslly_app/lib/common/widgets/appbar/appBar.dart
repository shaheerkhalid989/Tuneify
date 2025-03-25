import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:musicslly_app/common/helper/is_dark_mode.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final bool hideBackBtn;
  const BasicAppBar({this.title, this.hideBackBtn = false, super.key});

  @override
  Widget build(BuildContext context) {
    // Update the system UI overlay style based on the current theme
    SystemChrome.setSystemUIOverlayStyle(
      context.isDarkMode
          ? SystemUiOverlayStyle.light // Light icons for dark mode
          : SystemUiOverlayStyle.dark, // Dark icons for light mode
    );

    return AppBar(
      //backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: title ?? const Text(""),
      leading: hideBackBtn
          ? null
          : IconButton(
              icon: Container(
                alignment: Alignment(0.35, 0),
                height: 45,
                width: 45,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: context.isDarkMode
                      ? Colors.white.withOpacity(0.05)
                      : Colors.black.withOpacity(0.05),
                ),
                child: Icon(
                  size: 18,
                  Icons.arrow_back_ios,
                ),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
