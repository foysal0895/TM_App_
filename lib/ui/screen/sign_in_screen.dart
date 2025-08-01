import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tm_app_with_firebase/ui/screen/main_bottom_nav_bar_screen.dart';
import 'package:tm_app_with_firebase/ui/utils/app_colors.dart';
import 'package:tm_app_with_firebase/ui/widgets/screen_background.dart';

import 'forgot_password_email.dart';
import 'sign_up_screen.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Screenbackground(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: _buildSignInForm(textTheme),
        ),
      ),
    );
  }

  Widget _buildSignInForm(TextTheme textTheme) {
    return Column(
      children: [
        const SizedBox(height: 100),
        Text(
          'Get Start With',
          style: textTheme.displaySmall?.copyWith(fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(hintText: 'Email'),
        ),
        const SizedBox(height: 20),
        TextFormField(
          decoration: InputDecoration(hintText: 'Password'),
          obscureText: true,
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            _onTapNextButton(); // <-- call the method here
          },
          child: const Icon(Icons.arrow_forward_ios),
        ),
        const SizedBox(height: 20),
        TextButton(
          onPressed: _onTapForgotPasswordButton, // <-- call the method here
          child: const Text('Forgot Password?'),
        ),
        const SizedBox(height: 20),
        _buildSignUpSection(),
      ],
    );
  }

  Widget _buildSignUpSection() {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5,
        ),
        text: "Don't have an account? ",
        children: [
          TextSpan(
            text: 'Sign Up',
            style: TextStyle(color: AppColors.themeColor),
            recognizer: TapGestureRecognizer()..onTap = _onTapSignUp,
          ),
        ],
      ),
    );
  }

  void _onTapForgotPasswordButton() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const EmailScreen()),
    );
  }

  void _onTapNextButton() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const MainBottomNavBarScreen()),
      (route) => false,
    );
  }

  void _onTapSignUp() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUpScreen()),
    );
  }
}
