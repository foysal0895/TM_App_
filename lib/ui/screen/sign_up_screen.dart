import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tm_app_with_firebase/ui/utils/app_colors.dart';
import 'package:tm_app_with_firebase/ui/widgets/screen_background.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Screenbackground(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: _buildSignUpForm(textTheme),
        ),
      ),
    );
  }

  Widget _buildSignUpForm(TextTheme textTheme) => _buildSignInForm(textTheme);

  Widget _buildSignInForm(TextTheme textTheme) {
    return Column(
      children: [
        const SizedBox(height: 100),
        Text(
          'Join With Us',
          style: textTheme.displaySmall?.copyWith(fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(hintText: 'Email'),
        ),
        const SizedBox(height: 8),
        TextFormField(
          decoration: InputDecoration(hintText: 'First Name'),
          obscureText: true,
        ),
        const SizedBox(height: 8),
        TextFormField(
          decoration: InputDecoration(hintText: 'Last Name'),
          obscureText: true,
        ),
        const SizedBox(height: 8),
        TextFormField(
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(hintText: 'Mobile Number'),
          obscureText: true,
        ),
        const SizedBox(height: 8),
        TextFormField(decoration: InputDecoration(hintText: 'Password')),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {},
          child: const Icon(Icons.arrow_forward_ios),
        ),

        const SizedBox(height: 20),
        _buildHaveAccountSection(),
      ],
    );
  }

  Widget _buildHaveAccountSection() {
    return RichText(
      text: TextSpan(
        style: TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.5,
        ),
        text: " Have an account? ",
        children: [
          TextSpan(
            text: 'Sign in',
            style: TextStyle(color: AppColors.themeColor),
            recognizer: TapGestureRecognizer()..onTap = _onTapSignIn,
          ),
        ],
      ),
    );
  }

  void _onTapNextButton() {
    // TODO: Implement next button functionality
  }

  void _onTapSignIn() {
    Navigator.pop(context);
  }
}
