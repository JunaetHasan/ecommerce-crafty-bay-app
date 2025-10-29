import 'package:crafty_bay/services/network_caller.dart';
import 'package:crafty_bay/data/model/network_response.dart';
import 'package:crafty_bay/utitily/urls.dart';
import 'package:get/get.dart';

class EmailVerificationController extends GetxController{

  bool _getEmailVerificationInProgress = false;
  String _errorMassages = '';

  bool get getEmailVerificationInProgress => _getEmailVerificationInProgress;
  String get errorMessages => _errorMassages;


  Future<bool> getUserEmail (String email) async {
    _getEmailVerificationInProgress = true;
    update();

 final NetworkResponse response = await NetworkCaller.getRequest(Urls.email(email));
  if(response.isSuccess){
    _errorMassages = response.responseJson!['data'] ?? '';
    return true;
  }else{
   return false;
  }
  }
}