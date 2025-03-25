import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:musicslly_app/common/widgets/button/basic_ImageButton.dart';
import 'package:musicslly_app/common/widgets/button/basic_app_button.dart';
import 'package:musicslly_app/core/configs/assets/app_images.dart';
import 'package:musicslly_app/core/configs/assets/app_vectors.dart';
import 'package:musicslly_app/data/models/auth/create_user_req.dart';
import 'package:musicslly_app/domain/usecases/auth/signup.dart';
import 'package:musicslly_app/presentation/admin/pages/admin.dart';
import 'package:musicslly_app/presentation/auth/pages/signin.dart';
import 'package:musicslly_app/presentation/home/pages/home.dart';
import 'package:musicslly_app/service_locator.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      bottomNavigationBar: signIn_pageLink(context),
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
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 20,
              ),
              child: Column(children: [
                SizedBox(height: 30),
                Align(
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    AppVectors.logo,
                    height: 70,
                  ),
                ),
                SizedBox(height: 45),
                Text(
                  "Register",
                  style: textTheme.headlineLarge?.copyWith(
                    fontSize: 30,
                  ),
                ),
                SizedBox(height: 30),
                name_Field(context),
                SizedBox(height: 12),
                email_Field(context),
                SizedBox(height: 12),
                password_Field(context),
                SizedBox(height: 28),
                BasicAppButton(
                    onPressed: () async {
                      var result = await sl<SignupUseCase>().call(
                        params: CreateUserReq(
                          email: emailController.text,
                          password: passwordController.text,
                          name: nameController.text,
                        ),
                      );
                      result.fold((l) {
                        var snackbar = SnackBar(
                          content: Opacity(
                            opacity: 0.8,
                            child: Text(
                              l,
                              style: TextStyle(fontSize: 17),
                            ),
                          ),
                          behavior: SnackBarBehavior.floating,
                          duration: const Duration(milliseconds: 1500),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          // animation: CurvedAnimation(
                          //   parent: AnimationController(
                          //     duration: const Duration(milliseconds: 1500),
                          //     vsync: Scaffold.of(context),
                          //   ),
                          //   curve: Curves.easeInOut,
                          // ),
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      }, (r) {
                        if (emailController.text ==
                            "mshaheerkhalid989@gmail.com") {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AdminPage(),
                            ),
                            (route) => false,
                          );
                        } else {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomePage(),
                            ),
                            (route) => false,
                          );
                        }
                      });
                    },
                    title: "Create Account",
                    height: 80),
                SizedBox(height: 10),
                continue_With_google_or_Fb(context),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget name_Field(BuildContext context) {
    return TextField(
      controller: nameController,
      decoration: const InputDecoration(
        labelText: 'Name',
        hintText: 'Enter your full name',
      ).applyDefaults(
        Theme.of(context).inputDecorationTheme,
      ),
    );
  }

  Widget email_Field(BuildContext context) {
    return TextField(
      controller: emailController,
      decoration: const InputDecoration(
        labelText: 'Email',
        hintText: 'Enter your email address',
      ).applyDefaults(
        Theme.of(context).inputDecorationTheme,
      ),
    );
  }

  Widget password_Field(BuildContext context) {
    return TextField(
      controller: passwordController,
      obscureText: _obscureText, // Show password as dots or characters
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Enter your password',
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText ? Icons.visibility : Icons.visibility_off,
          ),
          onPressed: () {
            setState(() {
              _obscureText = !_obscureText;
            });
          },
        ),
      ).applyDefaults(
        Theme.of(context).inputDecorationTheme,
      ),
    );
  }

  Widget signIn_pageLink(BuildContext context) {
    final text_Theme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Already have an account?",
            style: text_Theme.bodyMedium?.copyWith(fontSize: 15),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => SignInPage(),
                ),
                (route) => false,
              );
            },
            child: Text(
              "Sign In",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget continue_With_google_or_Fb(BuildContext context) {
    final text_Theme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Continue With",
            style: text_Theme.bodyMedium?.copyWith(fontSize: 18),
          ),
          SizedBox(height: 10),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            BasicImageButton(
              onPressed: () {},
              dimentions: 60,
              imageAdd: AppImages.google,
            ),
            Text(
              "OR",
              style: text_Theme.bodyMedium?.copyWith(fontSize: 18),
            ),
            BasicImageButton(
              onPressed: () {},
              dimentions: 60,
              imageAdd: AppImages.facebook,
            ),
          ]),
        ],
      ),
    );
  }
}
