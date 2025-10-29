import 'package:crafty_bay/u_color/u_color.dart';
import 'package:flutter/material.dart';

class HomeSectionTitle extends StatelessWidget {
  const HomeSectionTitle({
    super.key, required this.title,  required this.onTap,
  });
  final String title;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18),

        ),
        InkWell(
          onTap: onTap,
          child: Text('SeeAll',style: TextStyle(
              color: UColor.brown
          ),),
        )
      ],
    );
  }
}