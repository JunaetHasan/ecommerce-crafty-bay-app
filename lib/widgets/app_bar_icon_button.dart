import 'package:flutter/material.dart';

class AppBarIconButton extends StatelessWidget {
  const AppBarIconButton({
    super.key, required this.icon,
  });
 final IconData icon;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(1000),
      onTap: () {},
      child: CircleAvatar(
        radius: 15,
        backgroundColor: Colors.black54,
        child: Icon(icon, size: 25, color: Colors.white),
      ),
    );
  }
}