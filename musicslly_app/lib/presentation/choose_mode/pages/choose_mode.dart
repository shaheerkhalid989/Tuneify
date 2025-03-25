import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:musicslly_app/common/widgets/button/basic_app_button.dart';
import 'package:musicslly_app/core/configs/assets/app_rive.dart';
import 'package:musicslly_app/core/configs/assets/app_vectors.dart';
import 'package:musicslly_app/core/configs/theme/custom_container.dart';
import 'package:musicslly_app/presentation/auth/pages/signin_or_signup.dart';
import 'package:musicslly_app/presentation/choose_mode/bloc/theme_cubit.dart';
import 'package:rive/rive.dart';

class ChooseModePage extends StatefulWidget {
  const ChooseModePage({super.key});
  @override
  State<ChooseModePage> createState() => _ChooseModePageState();
}

class _ChooseModePageState extends State<ChooseModePage>
    with SingleTickerProviderStateMixin {
  bool status = true;
  SMIInput<bool>? _isDarkInput;

  @override
  void initState() {
    super.initState();

    // Initialize the status based on the current theme
    final currentTheme = context.read<ThemeCubit>().state;
    status = currentTheme == ThemeMode.dark;
  }

  void _toggleStatus() {
    setState(() {
      status = !status;
      if (_isDarkInput != null) {
        _isDarkInput?.value = status; // Update the Rive state machine input
      }

      // Toggle the theme
      context
          .read<ThemeCubit>()
          .updateTheme(status ? ThemeMode.dark : ThemeMode.light);
    });
  }

  void _onRiveInit(Artboard artboard) {
    final controller =
        StateMachineController.fromArtboard(artboard, 'Switch Theme');
    if (controller != null) {
      artboard.addController(controller);
      _isDarkInput = controller.findInput('isDark');
      _isDarkInput?.value = status;
    }
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      //backgroundColor: Colors.black.withOpacity(0.9),
      body: Stack(
        children: [
          CustomContainer(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
          ),
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5), // Apply blur effect
            child: Container(),
          ),
          Container(
            color: Colors.black.withOpacity(0.05),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 20,
            ),
            child: Column(children: [
              Align(
                alignment: Alignment.topCenter,
                child: SvgPicture.asset(
                  AppVectors.logo,
                  height: 200,
                ),
              ),
              Spacer(),
              Text(
                'Choose Mode',
                style: textTheme.headlineLarge?.copyWith(
                  //color: Colors.white,
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),
              GestureDetector(
                onTap: _toggleStatus, // Toggle the state on tap
                child: Container(
                  height: 120,
                  width: 180,
                  child: RiveAnimation.asset(
                    AppRive.switch_Theme,
                    fit: BoxFit.contain,
                    stateMachines: const ["Switch Theme"],
                    onInit: _onRiveInit,
                  ),
                ),
              ),
              SizedBox(
                height: 190,
              ),
              BasicAppButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SignIn_SignUp(),
                    ),
                  );
                },
                title: "Continue",
                height: 80,
              ),
              SizedBox(
                height: 20,
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
