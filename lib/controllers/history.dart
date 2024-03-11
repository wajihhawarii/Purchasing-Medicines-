import 'dart:convert';
import 'package:buyingmedicines1/apilink/apilink.dart';
import 'package:buyingmedicines1/core/services/myservicees.dart';
import 'package:buyingmedicines1/models/orderhistory.dart';
import 'package:buyingmedicines1/models/profileinformations.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;

abstract class HistoryController extends ChangeNotifier {
  getOrderHistory();
  String userId =
      MyServices.sharedPreferences.getString(PrefProfile.idUSer) as String;
}

class HistoryCotrollerImp extends HistoryController {
  List<OrderHistoryModel> orderHistoryList = [];
  int load = 0; //من اجل ان يعمل رفريش في الواجهة
  int repo = 0;
  @override
  getOrderHistory() async {
    var response = await http.get(Uri.parse(ApiLink.gethistory + userId));
    if (response.statusCode == 200 || response.statusCode == 201) {
      final date = jsonDecode(response.body) as List;
      if (date.isNotEmpty) {
        orderHistoryList.clear();
        orderHistoryList.addAll(date.map((e) => OrderHistoryModel.fromJson(e)));
        notifyListeners();
        load = 1;
        repo = 1;
      } else {}
    } else {}
  }
}
