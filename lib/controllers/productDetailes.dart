import 'dart:convert';
import 'package:buyingmedicines1/apilink/apilink.dart';
import 'package:buyingmedicines1/core/functions/AlertDilog.dart';
import 'package:buyingmedicines1/core/services/myservicees.dart';
import 'package:buyingmedicines1/models/categories.dart';
import 'package:buyingmedicines1/models/profileinformations.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;

abstract class ProductDetaileController extends ChangeNotifier {
  addToCard(String idProduct, BuildContext context);
  toHomePage(context);
  String userid =
      MyServices.sharedPreferences.getString(PrefProfile.idUSer) as String;
}

class ProductDetaileControllerImp extends ProductDetaileController {
  late ProductModel productModel;
  int load = 0;

  @override
  addToCard(String idProduct, context) async {
    var response = await http.post(Uri.parse(ApiLink.addcard), body: {
      "id_user": userid,
      "id_product": idProduct,
    });
    if (response.statusCode == 200 || response.statusCode == 201) {
      final date = jsonDecode(response.body);
      if (date["value"] == 1) {
        // ignore: use_build_context_synchronously
        getShowDialog(context, "Yes,", " Product added to cart success");
      } else {
        // ignore: use_build_context_synchronously
        getShowDialog(
            context, "Sorry,", "The product has been added to the Card");
      }
    } else {}
  }

  @override
  toHomePage(context) {
    Navigator.of(context).pop();
  }
}
