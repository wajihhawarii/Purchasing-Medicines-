import 'package:buyingmedicines1/controllers/home.dart';
import 'package:buyingmedicines1/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({super.key});

  @override
  Widget build(BuildContext context) {
    var homeCotrollerImp = Provider.of<HomeCotrollerImp>(context);

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      padding: const EdgeInsets.symmetric(vertical: 5),
      height: 60,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColor.green,
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextFormField(
        onTap: () {
          homeCotrollerImp.goToSearchPage(context);
        },
        style: const TextStyle(color: AppColor.white, fontSize: 16),
        decoration: InputDecoration(
          prefixIcon: const Icon(
            Icons.search,
            color: AppColor.black,
            size: 30,
          ),
          hintText: "Search Medicine....",
          border: InputBorder.none,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColor.grey)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AppColor.grey)),
        ),
        onChanged: (val) {
          print(val);
        },
      ),
    );
  }
}
