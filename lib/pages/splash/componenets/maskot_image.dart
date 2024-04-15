import 'package:flutter/material.dart';
import 'package:my_portfolio/core/constants/asset_image.dart';

class MaskotImage extends StatelessWidget {
  const MaskotImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 200,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        gradient: const LinearGradient(colors: [
          Colors.pinkAccent,
          Colors.blue,
        ]),
        boxShadow: const [
          BoxShadow(
            color: Colors.pink,
            offset: Offset(-2, 0),
            blurRadius: 20,
          ),
          BoxShadow(
            color: Colors.blue,
            offset: Offset(2, 0),
            blurRadius: 20,
          ),
        ],
      ),
      child: Image.asset(
        AssetImageConstant.maskotImage,
        fit: BoxFit.cover,
      ),
    );
  }
}
