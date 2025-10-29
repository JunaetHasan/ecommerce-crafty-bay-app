import 'package:crafty_bay/data/model/network_response.dart';
import 'package:crafty_bay/data/model/product_model.dart';
import 'package:crafty_bay/services/network_caller.dart';
import 'package:crafty_bay/utitily/urls.dart';
import 'package:get/get.dart';

class PopularProductController extends GetxController{

  bool _popularInProgress = false;
  String _errorMessages = '';
  ProductModel _popularProductModel = ProductModel();

  bool get popularInProgress => _popularInProgress;
  String get errorMessages => _errorMessages;
  ProductModel get popularProductModel => _popularProductModel;

  Future<bool> getPopularProduct ()async {
    _popularInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(Urls.getProductByRemarks('popular'));
    _popularInProgress = false;
    if(response.isSuccess){
    _popularProductModel = ProductModel.fromJson(response.responseJson ?? {});
    update();
    return true;
    }else{
      _errorMessages = 'Popular product fetch fail';
      update();
      return false;
    }

  }
}