import 'package:crafty_bay/main_buttom_nav_bar/main_buttom_bav_screen.dart';
import 'package:crafty_bay/state_holders/otp_verification_controller.dart';
import 'package:crafty_bay/widgets/screen_logo.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpVerificationScreen extends StatefulWidget {
  final String email;
  const OtpVerificationScreen({super.key, required this.email});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  TextEditingController otpTEController = TextEditingController();
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
              const SizedBox(height: 100),
              ScreenLgo(),
              const SizedBox(height: 10),
              Text(
                'Your Otp code send',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 10),
              PinCodeTextField(
                validator: (String? value) {
                  if (value?.isEmpty ?? true) {
                    return 'Enter your current otp';
                  }
                  return null;
                },
                controller: otpTEController,

                length: 6,
                obscureText: false,
                animationType: AnimationType.fade,
                pinTheme: PinTheme(
                  inactiveFillColor: Colors.grey.shade400,
                  inactiveColor: Colors.white,
                  selectedFillColor: Colors.white,
                  selectedColor: Colors.black,
                  activeColor: Colors.brown,
                  disabledColor: Colors.white,
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 50,
                  fieldWidth: 40,
                  activeFillColor: Colors.white,
                ),
                animationDuration: Duration(milliseconds: 300),
                backgroundColor: Colors.blue.shade50,
                enableActiveFill: true,
                onCompleted: (v) {
                  if (kDebugMode) {
                    print("Completed");
                  }
                },
                onChanged: (value) {},
                beforeTextPaste: (text) {
                  return true;
                },
                appContext: context,
              ),
               
              SizedBox(
                width: double.infinity,
                child: GetBuilder<OtpVerificationController>(
                  builder: (otpController) {
                    if (otpController.otpVerificationInProgress) {
                      return Center(child: CircularProgressIndicator());
                    }
                    return ElevatedButton(
                      onPressed: () async {
                        if (globalKey.currentState!.validate()) {
                          final response = await otpController.userOtpVerify(widget.email, otpTEController.text.trim(),);
                          if (response) {
                            Get.offAll(() => MainButtomBavScreen());
                          }else{
                            if(mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Otp verification fail')));
                            }
                          }
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
}
