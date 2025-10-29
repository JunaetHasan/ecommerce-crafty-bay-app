import 'package:crafty_bay/application/color_extension.dart';
import 'package:crafty_bay/data/model/product_details.dart';
import 'package:crafty_bay/state_holders/add_to_cart_controller.dart';
import 'package:crafty_bay/state_holders/product_details_controller.dart';
import 'package:crafty_bay/ui/screens/reviews_screen.dart';
import 'package:crafty_bay/widgets/custom_stepper.dart';
import 'package:crafty_bay/widgets/product_image_slider.dart';
import 'package:crafty_bay/widgets/size_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatefulWidget {
  final int productId;
  const ProductDetailsScreen({super.key, required this.productId});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
 // List<String> colors = [
   // Colors.black,
   // Colors.blue,
  ////  Colors.deepOrange,
   // Colors.limeAccent,
  //  Colors.purple,
 // ];
  //List<String> sizes = ['M', 'N', 'L', 'XL', 'XLL'];
  int selectedSizeIndex = 0;
  int selectedColorIndex = 0;


  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_){
      Get.find<ProductDetailsController>().getProductDetails(widget.productId);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<ProductDetailsController>(

        builder: (productDetailsController) {
          if(productDetailsController.productDetailsInProgress){
            return Center(
              child: CircularProgressIndicator(),
            );
          }


          return Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                          children: [
                        ProductImageSlider(imageList: [
                          productDetailsController.productDetails.img1 ?? '',
                          productDetailsController.productDetails.img2 ?? '',
                          productDetailsController.productDetails.img3 ?? '',
                          productDetailsController.productDetails.img4 ?? '',

                        ],),
                        productAppBar,
                      ]
                      ),
                      const SizedBox(height: 15),
                      productDetailsWidget (productDetailsController.productDetails,productDetailsController.availableColors),
                    ],
                  ),
                ),
              ),
              addToCardBottomContainer(productDetailsController.productDetails,productDetailsController.availableSizes,productDetailsController.availableColors),
            ],
          );
        }
      ),
    );
  }

  Padding  productDetailsWidget (ProductDetails  productDetails,List<String> colors) {
    

    
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  productDetails.product?.title ?? '',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              CustomStepper(lowerLimit: 1, upperLimit: 100, stepValue: 1, value: 1, onChange: (newValue) {},),
            ],
          ),
          Row(
            children: [
              Text('${productDetails.product?.star ?? 0}'),
              const SizedBox(width: 5),
              InkWell(
                onTap: () {
                  Get.to(() => ReviewsScreen());
                },
                child: Text('Reviews'),
              ),
              const SizedBox(width: 5),
              Icon(Icons.star_border_purple500_rounded, size: 17),
            ],
          ),
          const SizedBox(height: 10),
          Text('Color', style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 10),

          SizedBox(
            height: 30,

            child: ListView.builder(
              itemCount: productDetails.color?.split(',').length ?? 0,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                if (kDebugMode) {
                  print(colors[index]);
                }
                return InkWell(
                  onTap: () {
                    selectedColorIndex = index;
                    if (mounted) {
                      setState(() {});
                    }
                  },
                  child: CircleAvatar(
                    //maxRadius: 28,
                    backgroundColor: HexColor.fromHex(colors[index]),
                    child: selectedColorIndex == index ? Icon(Icons.done, color: Colors.white) : null,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          Text('Size', style: Theme.of(context).textTheme.titleLarge),

          const SizedBox(height: 10),
          SizedBox(
            height: 30,
            child: SizePicker(
              initialSelected: 0,
              onSelected: (int selectedSize) {
                selectedSizeIndex = selectedSize;
              },
              sizes: productDetails.size?.split(',')?? [],
            ),
          ),
          const SizedBox(height: 10),
          Text('Description', style: Theme.of(context).textTheme.titleLarge),

          const SizedBox(height: 10),
          Text(productDetails.des ?? ''),
        ],
      ),
    );
  }

  AppBar get productAppBar  {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: InkWell(
        onTap: () {
          Get.back();
        },
        child: Icon(Icons.arrow_back_ios),
      ),
      title: Text(
        'Product details',
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20),
      ),
    );
  }

  Container  addToCardBottomContainer (ProductDetails details,List<String> colors,List<String> sizes) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(bottom: 2.5),
      height: 70,
      width: 400,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.white),
        color: Colors.brown.shade100,
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
                '\$100',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          GetBuilder<AddToCartController>(

            builder: (addToCartController) {
              if(addToCartController.addToCartInProgress){
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              return TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                    side: BorderSide(color: Colors.white),
                  ),
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  addToCartController.getAddToCardProduct(details.id!, colors[selectedColorIndex].toString(), sizes[selectedSizeIndex]).then((result){
                    if(result){
                      Get.showSnackbar(GetSnackBar(title: 'Add to cart ',message: 'Product has been added',));
                    }
                  });
                },
                child: Text('AddToCart'),
              );
            }
          ),
        ],
      ),
    );
  }






}
