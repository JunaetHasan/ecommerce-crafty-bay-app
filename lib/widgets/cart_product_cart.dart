import 'package:crafty_bay/data/model/cart_list_model.dart';
import 'package:crafty_bay/state_holders/cart_list_controller.dart';
import 'package:crafty_bay/widgets/custom_stepper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartProductCart extends StatelessWidget {
  final CartData cartData;
  const CartProductCart({
    super.key, required this.cartData,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0)
      ),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8,vertical: 10),
            height: 90,
            width: 100,
            decoration: BoxDecoration(
              //color: Colors.green,
              image: DecorationImage(image: NetworkImage(cartData.product?.image ?? '')),
            ),
          ),
          const SizedBox(width: 5,),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,

              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(cartData.product?.title ?? '',style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                        ),),
                        RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: 'Color : ${cartData.color ?? ''}',
                                style:  TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey.shade900,
                                ),
                              ),
                              TextSpan(
                                text: 'Size : ${cartData.size}',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.grey.shade900,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Icon(Icons.delete_outline),
                  ],
                ),
                const SizedBox(height: 10),
                Row(

                  children: [
                    Text('\$${cartData.product?.price ?? 0}',style: TextStyle(
                        color: Colors.blue.shade800,
                        fontWeight: FontWeight.bold
                    ),),
                    const Spacer(),
                    SizedBox(
                      height:30 ,
                      child: FittedBox(
                        child: CustomStepper(lowerLimit: 1, upperLimit: 10, stepValue: 1, value: cartData.numberOfItems, onChange: (int value) {

                          Get.find<CartListController>().changeItem(cartData.id!, value);
                        },
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
