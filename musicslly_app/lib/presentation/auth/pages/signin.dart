import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:musicslly_app/common/helper/is_dark_mode.dart';
import 'package:musicslly_app/common/widgets/button/basic_ImageButton.dart';
import 'package:musicslly_app/common/widgets/button/basic_app_button.dart';
import 'package:musicslly_app/core/configs/assets/app_images.dart';
import 'package:musicslly_app/core/configs/assets/app_vectors.dart';
import 'package:musicslly_app/core/configs/theme/app_colors.dart';
import 'package:musicslly_app/data/models/auth/signin_user_req.dart';
import 'package:musicslly_app/domain/usecases/auth/signin.dart';
import 'package:musicslly_app/presentation/admin/pages/admin.dart';
import 'package:musicslly_app/presentation/auth/pages/signup.dart';
import 'package:musicslly_app/presentation/home/pages/home.dart';
import 'package:musicslly_app/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInPage extends StatefulWidget {
  SignInPage({super.key});

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _obscureText = true;
  bool _rememberMe = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadSavedCredentials();
  }

  Future<void> _loadSavedCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _emailController.text = prefs.getString('email') ?? '';
      _passwordController.text = prefs.getString('password') ?? '';
      _rememberMe = prefs.getBool('rememberMe') ?? false;
    });
  }

  Future<void> _saveCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (_rememberMe) {
      await prefs.setString('email', _emailController.text);
      await prefs.setString('password', _passwordController.text);
    } else {
      await prefs.remove('email');
      await prefs.remove('password');
    }
    await prefs.setBool('rememberMe', _rememberMe);
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      bottomNavigationBar: signUp_pageLink(context),
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
                  "Sign In",
                  style: textTheme.headlineLarge?.copyWith(
                    fontSize: 30,
                  ),
                ),
                SizedBox(height: 30),
                email_Field(context),
                SizedBox(height: 12),
                password_Field(context),
                SizedBox(height: 12),
                rememberMe_Checkbox(context),
                SizedBox(height: 28),
                BasicAppButton(
                    onPressed: () async {
                      await _saveCredentials();
                      var result = await sl<SigninUseCase>().call(
                        params: SigninUserReq(
                          email: _emailController.text,
                          password: _passwordController.text,
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
                        );
                        ScaffoldMessenger.of(context).showSnackBar(snackbar);
                      }, (r) {
                        if (_emailController.text ==
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
                    title: "Login Account",
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

  Widget email_Field(BuildContext context) {
    return TextField(
      controller: _emailController,
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
      controller: _passwordController,
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

  Widget rememberMe_Checkbox(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          activeColor:
              context.isDarkMode ? AppColors.lightGreen : AppColors.primary,
          checkColor: context.isDarkMode ? Colors.black : Colors.white,
          value: _rememberMe,
          onChanged: (value) {
            setState(() {
              _rememberMe = value!;
            });
          },
        ),
        Text("Remember Me"),
      ],
    );
  }

  Widget signUp_pageLink(BuildContext context) {
    final text_Theme = Theme.of(context).textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Don't have an account?",
            style: text_Theme.bodyMedium?.copyWith(fontSize: 15),
          ),
          TextButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => SignUpPage(),
                ),
                (route) => false,
              );
            },
            child: Text(
              "Sign Up",
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
