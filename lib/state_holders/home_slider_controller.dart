import 'package:crafty_bay/data/model/network_response.dart';
import 'package:crafty_bay/data/model/slider_model.dart';
import 'package:crafty_bay/services/network_caller.dart';
import 'package:crafty_bay/utitily/urls.dart';
import 'package:get/get.dart';

class HomeSliderController extends GetxController{

  bool _homeSliderInProgress = false;
  final String _errorMessages = '';
  SliderModel _sliderModel = SliderModel();

  bool get homeSliderInprogress => _homeSliderInProgress;
  String get messages => _errorMessages;
  SliderModel get sliderModel => _sliderModel;

  Future<bool> getHomeSlider ()async {
    _homeSliderInProgress = true;
    update();
    final NetworkResponse response = await NetworkCaller.getRequest(Urls.productSlider);
    _homeSliderInProgress = false;
    if(response.isSuccess){
      _sliderModel = SliderModel.fromJson(response.responseJson ?? {});
      update();
      return true;
    }else{
      update();
      return false;
    }
  }
}