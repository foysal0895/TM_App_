import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tm_app_with_firebase/ui/screen/sign_in_screen.dart';
import 'package:tm_app_with_firebase/ui/utils/app_colors.dart';
import 'package:tm_app_with_firebase/ui/widgets/screen_background.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Screenbackground(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: _resetPasswordForm(Theme.of(context).textTheme),
        ),
      ),
    );
  }

  Widget _resetPasswordForm(TextTheme textTheme) {
    return Column(
      children: [
        const SizedBox(height: 100),
        Text(
          'Set New Password',
          style: textTheme.displaySmall?.copyWith(fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          'Minimum 8 characters, at least one uppercase letter, one lowercase letter, one number and one special character',
          style: textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w100),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),

        TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(hintText: 'Password'),
        ),
        const SizedBox(height: 20),
        TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(hintText: 'Conferm Password'),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            _onTapNextButton();
          },
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
        text: " Have account? ",
        children: [
          TextSpan(
            text: 'Sign In',
            style: TextStyle(color: AppColors.themeColor),
            recognizer: TapGestureRecognizer()..onTap = _onTapSignIn,
          ),
        ],
      ),
    );
  }

  void _onTapNextButton() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const SignInScreen()),
      (route) => false,
    );
  }

  void _onTapSignIn() {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => const SignInScreen()),
      (route) => false,
    );
  }
}
