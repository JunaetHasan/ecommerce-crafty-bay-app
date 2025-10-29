import 'package:crafty_bay/data/model/network_response.dart';
import 'package:crafty_bay/data/model/product_model.dart';
import 'package:crafty_bay/services/network_caller.dart';
import 'package:crafty_bay/utitily/urls.dart';
import 'package:get/get.dart';

class ProductListController extends GetxController {

  bool _productListInProgress = false;
  String _errorMessages = '';
  ProductModel _productModel = ProductModel();
  
  bool get productListInProgress => _productListInProgress;
  String get errorMessages => _errorMessages;
  ProductModel get productModel => _productModel;
  
  Future<bool> getProductList (int categoryId)async {
    _productListInProgress = true;
    update();
    
    final NetworkResponse response = await NetworkCaller.getRequest(Urls.productList(categoryId));
    _productListInProgress = false;
    if(response.isSuccess){
      _productModel = ProductModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    }else{
      _errorMessages = 'product not fetch';
      update();
      return false;
    }
  }

  void setProducts (ProductModel productModel) {
    _productModel = productModel;
    update();
  }
}