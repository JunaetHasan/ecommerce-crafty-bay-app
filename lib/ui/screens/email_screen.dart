import 'package:crafty_bay/state_holders/email_verification%20_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../widgets/screen_logo.dart';
import 'otp_verification_screen.dart';

class EmailScreen extends StatefulWidget {
  const EmailScreen({super.key});

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
  final TextEditingController emailTEController = TextEditingController();
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: globalKey,
          child: Column(
            children: [
              const SizedBox(height: 200),
              ScreenLgo(),
              Text(
                'Welcome to Back ',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(
                  hintStyle: TextStyle(fontWeight: FontWeight.bold),
                  hintText: 'Email',
                ),
                validator: (String? text) {
                  if (text?.isEmpty ?? true) {
                    return 'Enter your email address';
                  } else if (text!.isEmail == false) {
                    return 'Enter you valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: GetBuilder<EmailVerificationController>(
                  builder: (emailController) {
                    if (emailController.getEmailVerificationInProgress) {
                      return Center(child: CircularProgressIndicator());
                    }
                    return ElevatedButton(
                      onPressed: () async {
                        if (globalKey.currentState!.validate()) {
                          verifyEmail(emailController);
                        }
                      },
                      child: Text('Next'),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> verifyEmail(EmailVerificationController emailController) async {
    final response = await emailController.getUserEmail(
      emailTEController.text.trim(),
    );
    if (response) {
      Get.to(()=> OtpVerificationScreen(email: emailTEController.text.trim()));
    } else {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('email verification fail')));
      }
    }
  }
}
