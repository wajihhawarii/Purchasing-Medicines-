import 'dart:convert';
import 'package:buyingmedicines1/apilink/apilink.dart';
import 'package:buyingmedicines1/core/functions/AlertDilog.dart';
import 'package:buyingmedicines1/core/services/myservicees.dart';
import 'package:buyingmedicines1/models/card.dart';
import 'package:buyingmedicines1/models/profileinformations.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;

abstract class CardController extends ChangeNotifier {
  getProducts();
  getTotalPrice();
  cheakNow(BuildContext context);
  updateQuantity(String type, String cardId);
  String userId =
      MyServices.sharedPreferences.getString(PrefProfile.idUSer) as String;
}

class CardCotrollerImp extends CardController {
  int load = 0; //من اجل ان يعمل رفريش في الواجهة
  int repo = 0;

  List<CardModel> cardProductList = [];

  @override
  getProducts() async {
    var response =
        await http.get(Uri.parse("${ApiLink.getcard}?userID=$userId"));
    if (response.statusCode == 200 || response.statusCode == 201) {
      final date = jsonDecode(response.body) as List;
      getTotalPrice();
      if (date.isNotEmpty) {
        cardProductList.clear();
        cardProductList.addAll(date.map((e) => CardModel.fromJson(e)));
        notifyListeners();
        load = 1;
        repo = 1;
      } else {}
    } else {}
  }

  String? totalPrice;
  @override
  getTotalPrice() async {
    var response = await http.get(Uri.parse(ApiLink.totalprice + userId));
    if (response.statusCode == 200 || response.statusCode == 201) {
      final date = jsonDecode(response.body) as Map;
      if (date.isNotEmpty) {
        totalPrice = date["Total"];
        notifyListeners();
        load = 1;
        repo = 1;
      } else {}
    } else {}
  }

  @override
  updateQuantity(String type, String cardId) async {
    var response = await http.post(Uri.parse(ApiLink.updataquantity), body: {
      "cartID": cardId,
      "tipe": type,
    });
    if (response.statusCode == 200 || response.statusCode == 201) {
      final date = jsonDecode(response.body) as Map;
      if (date.isNotEmpty) {
        getProducts();
        notifyListeners();
        load = 1;
        repo = 1;
      } else {}
    } else {}
  }

  @override
  cheakNow(BuildContext context) async {
    var urlCheckout = Uri.parse(ApiLink.checkout);
    final response = await http.post(urlCheckout, body: {
      "idUser": userId,
    });
    final data = jsonDecode(response.body);
    int value = data['value'];
    String message = data['message'];
    if (value == 1) {
      // ignore: use_build_context_synchronously
      showAlertDialogCheakNow(context);
    } else {
      print(message);
    }
  }
}
