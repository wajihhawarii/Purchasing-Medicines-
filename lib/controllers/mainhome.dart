import 'package:buyingmedicines1/views/screens/history.dart';
import 'package:buyingmedicines1/views/screens/home.dart';
import 'package:buyingmedicines1/views/screens/profile.dart';
import 'package:flutter/material.dart';

abstract class MainHomeController extends ChangeNotifier {
  onTapItem(int index);
}

int selectIndex = 0;

class MainHomeControlleImp extends MainHomeController {
  final pageLIst = [
    const HomePage(),
    const HistoryPage(),
    const ProfilePage(),
  ];

  @override
  onTapItem(int index) {
    selectIndex = index;
    notifyListeners();
  }
}
