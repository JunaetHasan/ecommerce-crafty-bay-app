import 'package:crafty_bay/image_url/paths.dart';
import 'package:crafty_bay/state_holders/category_controller.dart';
import 'package:crafty_bay/state_holders/home_slider_controller.dart';
import 'package:crafty_bay/state_holders/main_buttom_nav_controller.dart';
import 'package:crafty_bay/state_holders/new_product_controller.dart';
import 'package:crafty_bay/state_holders/popular_product_controller.dart';
import 'package:crafty_bay/state_holders/special_product_controller.dart';
import 'package:crafty_bay/ui/screens/product_list_screen.dart';
import 'package:crafty_bay/widgets/home_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../widgets/app_bar_icon_button.dart';
import '../widgets/category_card.dart';
import '../widgets/home_section_title.dart';
import '../widgets/product_card.dart';
import 'category_list_screen.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            SvgPicture.asset(Paths.logoNav),
            const Spacer(),
            AppBarIconButton(icon: Icons.person),
            const SizedBox(width: 2),
            AppBarIconButton(icon: Icons.notifications),
            const SizedBox(width: 2),
            AppBarIconButton(icon: Icons.call),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  hintText: 'search',
                  suffixIcon: Icon(Icons.search),
                ),
              ),

              const SizedBox(height: 10),

               GetBuilder<HomeSliderController>(

                 builder: (homeSliderController) {
                   if(homeSliderController.homeSliderInprogress){
                     return Center(
                       child: CircularProgressIndicator(),
                     );
                   }
                   return HomeSlider(slider: homeSliderController.sliderModel.data?? []);
                 }
               ),

              const SizedBox(height: 10),
              HomeSectionTitle(title: 'Category', onTap: (){
                 Get.find<MainButtomNavController>().changeScreen(0);
               Get.to(()=> CategoryScreen());
              },),
              const SizedBox(height: 10),
              SizedBox(
                height: 100,
                child: GetBuilder<CategoryController>(

                  builder: (categoryController) {
                    if(categoryController.categoryInProgress){
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: categoryController.categoryModel.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        return CategoryCard(categoryData: categoryController.categoryModel.data![index], onTap: () {
                          Get.to(()=> ProductListScreen(categoryId: categoryController.categoryModel.data![index].id!));
                        },);
                          }
                    );
                  }
                ),
              ),
              const SizedBox(height: 10),
               HomeSectionTitle(title: 'Popular', onTap: (){
                 Get.to(()=>ProductListScreen(productModel: Get.find<PopularProductController>().popularProductModel));
               }),
              const SizedBox(height: 10),
              SizedBox(
                height: 200,
                child: GetBuilder<PopularProductController>(

                  builder: (popularController) {
                    if(popularController.popularInProgress){
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: popularController.popularProductModel.data?.length ?? 0,
                      itemBuilder: (context, index) {
                        return ProductCard(product: popularController.popularProductModel.data![index],);
                      },
                    );
                  }
                ),
              ),
              const SizedBox(height: 10),
                HomeSectionTitle(title: 'Special', onTap: (){
                 Get.to(()=>ProductListScreen(productModel: Get.find<SpecialProductController>().specialProductModel,));
                }),
               const SizedBox(height: 10,),
              SizedBox(
                height: 200,
                child: GetBuilder<SpecialProductController>(
                  
                  builder: (specialController) {
                    if(specialController.specialProductInProgress){
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView.builder(
                      //itemCount: getLength(specialController.specialProductModel.data?.length ?? 0),
                     itemCount: specialController.specialProductModel.data?.length ?? 0,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return ProductCard(product: specialController.specialProductModel.data![index],);
                      },
                    );
                  }
                ),
              ),
              const SizedBox(height: 10),
              HomeSectionTitle(title: 'New', onTap: (){
                 Get.to(()=>ProductListScreen(productModel: Get.find<NewProductController>().newProductModel,));
              }),
              const SizedBox(height: 10,),
              SizedBox(
                height: 200,
                child: GetBuilder<NewProductController>(

                  builder: (newController) {
                    if(newController.newProductInProgress){
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return ListView.builder(
                      itemCount: 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return ProductCard(product: newController.newProductModel.data![index]);
                      },
                    );
                  }
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  //int getLength (int length ){
   // return length > 4?2 : length;
 // }

}
