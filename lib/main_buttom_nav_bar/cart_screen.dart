import 'package:crafty_bay/state_holders/cart_list_controller.dart';
import 'package:crafty_bay/state_holders/main_buttom_nav_controller.dart';
import 'package:crafty_bay/ui/screens/checkout_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/cart_product_cart.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});


  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
WidgetsBinding.instance.addPostFrameCallback((_){
  Get.find<CartListController>().getCartList();
});
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Get.find<MainButtomNavController>().backToHome();
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Cart', style: TextStyle(fontWeight: FontWeight.bold)),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Get.back();
              Get.find<MainButtomNavController>().backToHome();
            },
            icon: Icon(Icons.arrow_back_ios),
          ),
        ),
        body: GetBuilder<CartListController>(

          builder: (cartListController) {
            if(cartListController.cartListInProgress){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            return Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: cartListController.cartListModel.data?.length ?? 0,
                    itemBuilder: (context, index) {
                      return CartProductCart(cartData: cartListController.cartListModel.data![index],);
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  margin: EdgeInsets.only(bottom: 2.5),
                  height: 70,
                  width: 400,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.white),
                    color: Colors.blue.shade100,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Total prize',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '\$${cartListController.totalPrice}',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4),
                            side: BorderSide(color: Colors.white),
                          ),
                          foregroundColor: Colors.white,
                        ),
                        onPressed: () {
                          if (Get.find<CartListController>().cartListModel.data?.isNotEmpty ?? false){
                            Get.to(() => CheckoutScreen());
                          }

                        },
                        child: Text('CheckOut'),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
        ),
      ),
    );
  }
}
