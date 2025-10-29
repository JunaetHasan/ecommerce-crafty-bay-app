import 'package:crafty_bay/main_buttom_nav_bar/cart_screen.dart';
import 'package:crafty_bay/main_buttom_nav_bar/category_list_screen.dart';
import 'package:crafty_bay/main_buttom_nav_bar/home_screen.dart';
import 'package:crafty_bay/main_buttom_nav_bar/wish_list_screen.dart';
import 'package:crafty_bay/state_holders/category_controller.dart';
import 'package:crafty_bay/state_holders/home_slider_controller.dart';
import 'package:crafty_bay/state_holders/main_buttom_nav_controller.dart';
import 'package:crafty_bay/state_holders/new_product_controller.dart';
import 'package:crafty_bay/state_holders/popular_product_controller.dart';
import 'package:crafty_bay/state_holders/special_product_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainButtomBavScreen extends StatefulWidget {
  const MainButtomBavScreen({super.key});

  @override
  State<MainButtomBavScreen> createState() => _MainButtomBavScreenState();
}

class _MainButtomBavScreenState extends State<MainButtomBavScreen> {


  final List<Widget> _screen = [
    HomeScreen(),
    CategoryScreen(),
    CartScreen(),
    WishListScreen(),
  ];
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_){
      Get.find<HomeSliderController>().getHomeSlider();
      Get.find<CategoryController>().getCategoryProduct();
      Get.find<PopularProductController>().getPopularProduct();
      Get.find<SpecialProductController>().getSpecialProduct();
      Get.find<NewProductController>().getNewProduct();
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainButtomNavController>(

      builder: (controller) {
        return Scaffold(
          body: _screen[controller.currentSelectIndex],
          bottomNavigationBar: BottomNavigationBar(
            showUnselectedLabels: true,

            showSelectedLabels: true,
            unselectedItemColor: Colors.black,
            selectedItemColor: Colors.red,
            onTap: controller.changeScreen,
            currentIndex: controller.currentSelectIndex,

            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home_outlined),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.category),
                label: "Category",
              ),
              BottomNavigationBarItem(icon: Icon(Icons.card_travel), label: "Cart"),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite_outline),
                label: "WishList",
              ),
            ],
          ),
        );
      }
    );
  }

}
