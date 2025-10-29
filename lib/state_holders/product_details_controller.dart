import 'package:crafty_bay/data/model/network_response.dart';
import 'package:crafty_bay/data/model/product_details.dart';
import 'package:crafty_bay/data/model/product_details_model.dart';
import 'package:crafty_bay/services/network_caller.dart';
import 'package:crafty_bay/utitily/urls.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController{

  bool _productDetailsInProgress = false;
  String _errorMessages = '';
  final List<String> _availableColors = [];
  List<String> _availableSizes = [];
  ProductDetails _productDetails = ProductDetails();

  bool get productDetailsInProgress => _productDetailsInProgress;
  String get errorMessages => _errorMessages;
  ProductDetails get productDetails => _productDetails;
  List<String> get availableColors => _availableColors;
  List<String> get availableSizes => _availableSizes;

  Future<bool> getProductDetails (int id) async {
    _productDetailsInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(Urls.getProductDetails(id));
    _productDetailsInProgress = false;

    if(response.isSuccess){
      _productDetails = ProductDetailsModel.fromJson(response.responseJson ?? {}).data!.first;
      _convertStringToColor(productDetails.color ?? '');
      _convertStringSizes(productDetails.size ?? '');
      update();
      return true;
    }else{
      _errorMessages = 'Slider data fetch! try again';
      update();
      return true;
    }
  }

  void _convertStringToColor (String color){
    _availableColors.clear();
    final List<String> splitColors =  color.split(',');
    for(String c in splitColors) {
      if (c.isNotEmpty) {
        availableColors.add(c);
      }
    }

  }
  void _convertStringSizes (String sizes){
    _availableSizes  = sizes.split(',');
  }
}