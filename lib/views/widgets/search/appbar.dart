import 'package:buyingmedicines1/controllers/serach.dart';
import 'package:buyingmedicines1/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchAppBar extends StatelessWidget {
  const SearchAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    var searchCotrollerImp = Provider.of<SearchCotrollerImp>(context);

    return Container(
        margin: const EdgeInsets.only(left: 5, right: 5, top: 5, bottom: 20),
        height: 60,
        width: double.infinity,
        decoration: BoxDecoration(
          color: AppColor.white.withOpacity(0.6),
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextFormField(
          autofocus: true,
          style: const TextStyle(color: Colors.black, fontSize: 16),
          onChanged: (text) {
            searchCotrollerImp.searchProduct(text);
          },
          decoration: InputDecoration(
            suffixIcon: IconButton(
              onPressed: () {
                searchCotrollerImp.goToMainPage(context);
              },
              icon: const Icon(
                Icons.arrow_forward_ios,
                size: 25,
              ),
            ),
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.black,
              size: 30,
            ),
            hintStyle: const TextStyle(
                fontStyle: FontStyle.italic, color: AppColor.grey),
            hintText: "Search Medicine...",
            border: InputBorder.none,
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColor.grey.withOpacity(0.5))),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: AppColor.grey.withOpacity(0.5))),
          ),
        ));
  }
}
