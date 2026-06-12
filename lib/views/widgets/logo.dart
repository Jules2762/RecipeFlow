import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final double width;
  final double height;
  const Logo({super.key, this.width = 50, this.height = 50});
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/logo/logo-trans.png",
      width: width,
      height: height,
      fit: BoxFit.cover,
    );
  }
}
