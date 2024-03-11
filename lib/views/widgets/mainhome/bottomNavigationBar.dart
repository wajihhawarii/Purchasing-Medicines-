import 'package:buyingmedicines1/controllers/mainhome.dart';
import 'package:buyingmedicines1/core/constant/color.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  final MainHomeControlleImp homeControllerImp;
  const CustomBottomNavigationBar({super.key, required this.homeControllerImp});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.assessment), label: "History"),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_sharp), label: "profile")
      ],
      backgroundColor: AppColor.white.withOpacity(0.7),
      currentIndex: selectIndex,
      onTap: homeControllerImp.onTapItem,
      unselectedItemColor: AppColor.red,
      selectedItemColor: AppColor.blue,
      elevation: 5,
    );
  }
}
