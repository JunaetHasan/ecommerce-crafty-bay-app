import 'package:crafty_bay/services/network_caller.dart';
import 'package:crafty_bay/data/model/network_response.dart';
import 'package:crafty_bay/state_holders/auth_controller.dart';
import 'package:crafty_bay/utitily/urls.dart';
import 'package:get/get.dart';

class OtpVerificationController extends GetxController{

  bool _otpVerificationInProgress = false;
  final String _errorMessages = '';

  bool get otpVerificationInProgress => _otpVerificationInProgress;
  String get errorMessages => _errorMessages;

  Future<bool> userOtpVerify (String email,String otp) async {
    _otpVerificationInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(Urls.otp(email,otp));
    _otpVerificationInProgress = false;
    update();
    if(response.isSuccess){
      AuthController.setAccessToken( response.responseJson!['data']);
      return true;
    }else{
      return false;
    }
  }
}
