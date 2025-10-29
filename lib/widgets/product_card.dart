import 'package:crafty_bay/data/model/product.dart';
import 'package:crafty_bay/ui/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product});
 final Product product;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to(()=> ProductDetailsScreen(productId: product.id!,));
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.black),
        ),
        child: SizedBox(
          width: 120,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 7, top: 5),

                  height: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage( product.image ?? '',
                      ),
                    ),
                  ),
                ),
                Text( product.title ?? '' ,
                  maxLines: 1,
                  style: TextStyle(
                    overflow: TextOverflow.ellipsis,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('\$${product.price ?? 0}', style: TextStyle(color: Colors.brown.shade900)),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        Icon(
                          Icons.star_border_purple500_rounded,
                          size: 17,
                          color: Colors.amber,
                        ),
                        const SizedBox(width: 5),
                        Text('${product.star ?? 0}'),
                        Container(
                          //margin: EdgeInsets.symmetric(horizontal: 7),
                          decoration: BoxDecoration(),
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3),
                            ),
                            color: Colors.brown.shade300,
                            child: Icon(
                              Icons.favorite_outline,
                              color: Colors.white,
                              size: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
