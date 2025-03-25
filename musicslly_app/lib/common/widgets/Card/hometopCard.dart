import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:musicslly_app/common/helper/is_dark_mode.dart';
import 'package:musicslly_app/core/configs/theme/app_colors.dart';

class Hometopcard extends StatelessWidget {
  final String artistImg;
  final String artistName;
  final String albumName;
  final double imageheight;
  final double imagePaddingBottom;
  final double imagePaddingRight;
  const Hometopcard(
      {required this.artistImg,
      required this.artistName,
      required this.albumName,
      required this.imageheight,
      required this.imagePaddingBottom,
      required this.imagePaddingRight,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      width: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: context.isDarkMode
                      ? AppColors.lightGreen
                      : AppColors.primary,
                ),
                height: 155,
                alignment: Alignment.bottomCenter,
                child: Row(
                  children: [
                    SizedBox(width: 20),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 18),
                          Text(
                            'New Album',
                            style: TextStyle(
                              color: context.isDarkMode
                                  ? Color(0xff6B8E29)
                                  : Color(0xffE6CCFF),
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Expanded(
                            child: Text(
                              albumName,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: context.isDarkMode
                                    ? Color(0xff6B8E29)
                                    : Color(0xffE6CCFF),
                                fontSize: 18,
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              artistName,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                color: context.isDarkMode
                                    ? Color(0xff6B8E29)
                                    : Color(0xffE6CCFF),
                                fontSize: 15,
                              ),
                            ),
                          ),
                          SizedBox(height: 18),
                        ],
                      ),
                    ),
                    SizedBox(width: 180),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              bottom: imagePaddingBottom,
              right: imagePaddingRight,
            ),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                child: SvgPicture.asset(
                  artistImg,
                  height: imageheight,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
