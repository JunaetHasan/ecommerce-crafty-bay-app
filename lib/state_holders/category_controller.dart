import 'package:crafty_bay/data/model/category_model.dart';
import 'package:crafty_bay/data/model/network_response.dart';
import 'package:crafty_bay/services/network_caller.dart';
import 'package:crafty_bay/utitily/urls.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController{

  bool _categoryInProgress = false;
  String _errorMessages = '';
  CategoryModel _categoryModel = CategoryModel();
  bool get categoryInProgress => _categoryInProgress;
  String get errorMessages => _errorMessages;
  CategoryModel get categoryModel => _categoryModel;

  Future<bool> getCategoryProduct ()async{
    _categoryInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(Urls.productCategory);
    _categoryInProgress = false;
    if(response.isSuccess){
      _categoryModel = CategoryModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    }else{
    _errorMessages = 'Category Product fail';
    update();
    return false;
    }
  }
}