import 'package:crafty_bay/data/model/network_response.dart';
import 'package:crafty_bay/data/model/product_model.dart';
import 'package:crafty_bay/services/network_caller.dart';
import 'package:crafty_bay/utitily/urls.dart';
import 'package:get/get.dart';

class NewProductController extends GetxController {
  bool _newProductInProgress = false;
  String _errorMessages = '';
  ProductModel _newProductModel = ProductModel();

  bool get  newProductInProgress => _newProductInProgress;
  String get errorMessages => _errorMessages;
  ProductModel get newProductModel => _newProductModel;

  Future<bool> getNewProduct () async {
    _newProductInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(Urls.getProductByRemarks('new'));
    _newProductInProgress = false;
    if(response.isSuccess){
      _newProductModel = ProductModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    }else{
      _errorMessages = 'New Product fetch fail';
      update();
      return true;
    }
  }
}