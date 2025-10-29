import 'package:crafty_bay/state_holders/category_controller.dart';
import 'package:crafty_bay/state_holders/main_buttom_nav_controller.dart';
import 'package:crafty_bay/ui/screens/product_list_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/category_card.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  WillPopScope(
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
                Get.back();
               Get.find<MainButtomNavController>().backToHome();
              },
              child: Icon(Icons.arrow_back_ios),
            ),
            title: Text('Category', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          body: RefreshIndicator(
            onRefresh: () async{
           await  Get.find<CategoryController>().getCategoryProduct();
            },
            child: GetBuilder<CategoryController>(

              builder: (categoryController) {
                if(categoryController.categoryInProgress){
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return GridView.builder(

                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                  ),
                  itemBuilder: (context, index) {
                    return FittedBox(fit: BoxFit.cover, child: CategoryCard(categoryData: categoryController.categoryModel.data![index], onTap: () { 
                      Get.to(()=> ProductListScreen(categoryId: categoryController.categoryModel.data![index].id!));
                    },));
                  },
                );
              }
            ),
          ),
      ),
    );
  }
}
