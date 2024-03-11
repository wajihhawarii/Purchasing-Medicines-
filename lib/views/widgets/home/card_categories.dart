import 'package:buyingmedicines1/core/constant/color.dart';
import 'package:flutter/material.dart';

class CardCategories extends StatelessWidget {
  final Color color;
  final String image;
  final String name;
  const CardCategories({
    super.key,
    required this.image,
    required this.name,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 70,
          width: 90,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.fill,
                colorFilter: ColorFilter.mode(color, BlendMode.color),
              )),
        ),
        Text(
          name,
          style: const TextStyle(fontSize: 12, color: AppColor.black),
        ),
      ],
    );
  }
}
