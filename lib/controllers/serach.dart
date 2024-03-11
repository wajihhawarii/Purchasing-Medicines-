import 'dart:convert';
import 'package:buyingmedicines1/apilink/apilink.dart';
import 'package:buyingmedicines1/core/constant/route.dart';
import 'package:buyingmedicines1/models/categories.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;

abstract class SearchController extends ChangeNotifier {
  searchProduct(String text);
  goToMainPage(BuildContext context);
  goToDetailesItme(ProductModel productModel, BuildContext context);
}

class SearchCotrollerImp extends SearchController {
  List<ProductModel> listProducts = [];
  List<ProductModel> listSearchProduct = [];

  getProduct() async {
    listProducts.clear();
    var urlProduct = Uri.parse(ApiLink.getproduct);
    final response = await http.get(urlProduct);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      for (var product in data) {
        listProducts.add(ProductModel.fromJson(product)); //add All طريقة تانية
      }
    }
  }

  @override
  searchProduct(String text) {
    listSearchProduct.clear();
    if (text.isEmpty) {
      notifyListeners();
    } else {
      for (var element in listProducts) {
        if (element.name!.toLowerCase().contains(text)) {
          listSearchProduct.add(element);
        }
      }
      notifyListeners();
    }
  }

  @override
  goToMainPage(BuildContext context) {
    Navigator.of(context).pushNamed(AppRoute.mainPage);
  }

  @override
  goToDetailesItme(ProductModel productModel, BuildContext context) {
    Navigator.of(context)
        .pushNamed(AppRoute.productdetailes, arguments: [productModel]);
  }
}
