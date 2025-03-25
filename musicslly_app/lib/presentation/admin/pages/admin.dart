import 'dart:io';
import 'dart:ui';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:musicslly_app/common/widgets/appbar/appBar.dart';
import 'package:musicslly_app/common/widgets/button/basic_app_button.dart';
import 'package:musicslly_app/core/configs/assets/app_vectors.dart';

class AdminPage extends StatefulWidget {
  AdminPage({super.key});

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            BackdropFilter(
              filter:
                  ImageFilter.blur(sigmaX: 5, sigmaY: 5), // Apply blur effect
              child: Container(),
            ),
            Container(
              color: Colors.black.withOpacity(0.05),
            ),
            BasicAppBar(
              hideBackBtn: true,
              title: SvgPicture.asset(
                AppVectors.logo,
                height: 40,
                width: 40,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              child: Column(children: [
                SizedBox(height: 60),
                Text(
                  "Admin Panel",
                  style: textTheme.headlineLarge?.copyWith(
                    fontSize: 30,
                  ),
                ),
                SizedBox(height: 30),
                Align(
                  alignment: Alignment(-0.99, 0),
                  //alignment: Alignment.centerLeft,
                  child: Text(
                    "Choose Song",
                    style: textTheme.bodySmall
                        ?.copyWith(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(height: 10),
                BasicAppButton(
                    onPressed: _pickMp3File, title: "Picker", height: 70)
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickMp3File() async {
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['mp3'],
    );

    if (result != null) {
      final file = File(result.files.single.path!);
      // Use the file as needed
    } else {}
  }
}
