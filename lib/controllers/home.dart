import 'dart:convert';
import 'package:buyingmedicines1/apilink/apilink.dart';
import 'package:buyingmedicines1/core/constant/route.dart';
import 'package:buyingmedicines1/models/categories.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;

abstract class HomeController extends ChangeNotifier {
  getCategories();
  goToSearchPage(BuildContext context);
  selectCategorie(int index);
}

class HomeCotrollerImp extends HomeController {
  List<CategoriesModel> categoriesList = [];
  int load = 0; //من اجل ان يعمل رفريش في الواجهة
  int indexx = 0;
  int repo = 0;

  @override
  selectCategorie(int index) {
    indexx = index;
    notifyListeners();
  }

  @override
  getCategories() async {
    var response = await http.get(Uri.parse(ApiLink.getproductwithcategories));
    if (response.statusCode == 200 || response.statusCode == 201) {
      final date = jsonDecode(response.body) as List;
      if (date.isNotEmpty) {
        categoriesList.clear();
        categoriesList.addAll(date.map((e) => CategoriesModel.fromJson(e)));
        notifyListeners();
        load = 1;
        repo = 1;
      } else {}
    } else {}
  }

  @override
  goToSearchPage(BuildContext context) {
    Navigator.of(context).pushNamed(AppRoute.searchpage);
  }
}
