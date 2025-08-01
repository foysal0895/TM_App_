import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tm_app_with_firebase/ui/screen/pin_verification_screen.dart';

import '../utils/app_colors.dart';
import '../widgets/screen_background.dart';


class EmailScreen extends StatefulWidget {
  const EmailScreen({super.key});

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Screenbackground(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: _buildEmailInputForm(Theme.of(context).textTheme),
        ),
      ),
    );
  }

   Widget _buildEmailInputForm(TextTheme textTheme) {
    return Column(
      children: [
        const SizedBox(height: 100),
        Text(
          'Your Email Address',
          style: textTheme.displaySmall?.copyWith(fontWeight: FontWeight.w600),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          'A 6 digit code will be sent to your email address',
          style: textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w100),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
       
       TextFormField(
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(hintText: 'Email'),
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
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PinVerificationScreen(),
      ),
    );
  }

  void _onTapSignIn() {
     Navigator.pop(context);
      
        }
}