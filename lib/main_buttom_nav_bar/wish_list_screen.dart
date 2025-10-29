import 'package:crafty_bay/state_holders/main_buttom_nav_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.find<MainButtomNavController>().backToHome();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: InkWell(
            onTap: () {
              //Get.back();
              Get.find<MainButtomNavController>().backToHome();
            },
            child: Icon(Icons.arrow_back_ios),
          ),
          title: Text(
            'WishList',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: GridView.builder(
          itemCount: 20,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 15,
            mainAxisExtent: 170,
          ),
          itemBuilder: (context, index) {
            return null;

            //return FittedBox(fit: BoxFit.cover, child: ProductCard());
          },
        ),
      ),
    );
  }
}
