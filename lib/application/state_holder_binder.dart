import 'package:crafty_bay/state_holders/add_to_cart_controller.dart';
import 'package:crafty_bay/state_holders/cart_list_controller.dart';
import 'package:crafty_bay/state_holders/category_controller.dart';
import 'package:crafty_bay/state_holders/create_invoice_controller.dart';
import 'package:crafty_bay/state_holders/email_verification%20_controller.dart';
import 'package:crafty_bay/state_holders/home_slider_controller.dart';
import 'package:crafty_bay/state_holders/main_buttom_nav_controller.dart';
import 'package:crafty_bay/state_holders/new_product_controller.dart';
import 'package:crafty_bay/state_holders/otp_verification_controller.dart';
import 'package:crafty_bay/state_holders/popular_product_controller.dart';
import 'package:crafty_bay/state_holders/product_details_controller.dart';
import 'package:crafty_bay/state_holders/product_list_controller.dart';
import 'package:crafty_bay/state_holders/special_product_controller.dart';
import 'package:get/get.dart';

class StateHolderBinder extends Bindings{
  @override
  void dependencies() {
    Get.put(MainButtomNavController());
    Get.put(EmailVerificationController());
    Get.put(OtpVerificationController());
    Get.put(HomeSliderController());
    Get.put(CategoryController());
    Get.put(PopularProductController());
    Get.put(SpecialProductController());
    Get.put(NewProductController());
    Get.put(ProductDetailsController());
    Get.put(AddToCartController());
    Get.put(ProductListController());
    Get.put(CartListController());
    Get.put(CreateInvoiceController());

  }
  
  
}