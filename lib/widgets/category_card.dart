import 'package:crafty_bay/data/model/category_data.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {

  const CategoryCard({
    super.key, required this.categoryData, required this.onTap,
  });

  final CategoryData categoryData;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 7),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 5),
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),

                color: Colors.brown.shade50,
              ),
              child: Image(image: NetworkImage(categoryData.categoryImg ?? '')),
            ),
            Text(categoryData.categoryName ?? '',style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
            ),),
          ],
        ),
      ),
    );
  }
}
