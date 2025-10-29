import 'package:crafty_bay/data/model/network_response.dart';
import 'package:crafty_bay/data/model/product_model.dart';
import 'package:crafty_bay/services/network_caller.dart';
import 'package:crafty_bay/utitily/urls.dart';
import 'package:get/get.dart';

class SpecialProductController  extends GetxController {
  bool _specialProductInProgress = false;
  String _errorMessages = '';
  ProductModel  _specialProductModel = ProductModel();

  bool get specialProductInProgress => _specialProductInProgress;
  String get errorMessages => _errorMessages;
  ProductModel get specialProductModel => _specialProductModel;


  Future<bool> getSpecialProduct () async {
    _specialProductInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(Urls.getProductByRemarks('special'));
    _specialProductInProgress = false;
    if(response.isSuccess){
      _specialProductModel = ProductModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    }else{
      _errorMessages = 'Special product fetch fail';
      update();
      return false;
    }
  }
}