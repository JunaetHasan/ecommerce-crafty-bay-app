

import 'package:crafty_bay/data/model/cart_list_model.dart';
import 'package:crafty_bay/data/model/network_response.dart';
import 'package:crafty_bay/services/network_caller.dart';
import 'package:crafty_bay/utitily/urls.dart';
import 'package:get/get.dart';

class CartListController extends GetxController {
  bool _cartListInProgress = false;
  String _errorMessages = '';
  CartListModel _cartListModel = CartListModel();
  double _totalPrice = 0;

  bool get cartListInProgress => _cartListInProgress;
  String get errorMessages => _errorMessages;
  CartListModel get cartListModel => _cartListModel;
  double get totalPrice => _totalPrice;

  Future<bool> getCartList() async {
    _cartListInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(
      Urls.cartList,
    );
    _cartListInProgress = false;

    if (response.isSuccess) {
      _cartListModel = CartListModel.fromJson(response.responseJson !);
      _calculatorTotalPrice();
      update();
      return true;
    } else {
      _errorMessages = 'Cart list fail';
      return false;
    }
  }

  void changeItem (int cartId ,int noOfItems){
    _cartListModel.data?.firstWhere((e)=> e.id == cartId).numberOfItems = noOfItems;
    _calculatorTotalPrice();
  }

  void _calculatorTotalPrice (){
    _totalPrice = 0;
   for(CartData data in _cartListModel.data ?? []){
      _totalPrice += (data.numberOfItems*(double.tryParse(data.product?.price ?? '0') ?? 0));
    }
update();
  }
}
