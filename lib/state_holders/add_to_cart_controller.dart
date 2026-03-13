import 'package:crafty_bay/data/model/network_response.dart';
import 'package:crafty_bay/services/network_caller.dart';
import 'package:crafty_bay/utitily/urls.dart';
import 'package:get/get.dart';

class AddToCartController extends GetxController{
  bool _addToCartInProgress = false;
  String _errorMessages = '';

  bool get addToCartInProgress => _addToCartInProgress;
  String get errorMessages => _errorMessages;

  Future<bool> getAddToCardProduct (int productId,String color,String size,int quanity) async {
    _addToCartInProgress = true;

    update();
    Map<String,dynamic> requestBody ={
      "product_id" : productId,
      "color" : color,
      "size" : size,
      "qty" : quanity,
    };
    final NetworkResponse response = await NetworkCaller.postRequest(Urls.addToCart, requestBody);
    _addToCartInProgress = false;
    update();
    if(response.isSuccess){
     return true;
    }else{
     _errorMessages = 'Add to cart data fail';
     update();
     return false;
    }
  }
}
