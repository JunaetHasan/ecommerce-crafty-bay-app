import 'package:crafty_bay/image_url/paths.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScreenLgo extends StatelessWidget {
  const ScreenLgo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(child: SvgPicture.asset(Paths.logoSvg,width: 100,height: 100,));
  }
}