import 'package:buyingmedicines1/core/constant/route.dart';
import 'package:buyingmedicines1/views/screens/auth/loign.dart';
import 'package:buyingmedicines1/views/screens/search.dart';
import 'package:buyingmedicines1/views/screens/auth/signup.dart';
import 'package:buyingmedicines1/views/screens/card.dart';
import 'package:buyingmedicines1/views/screens/main_home.dart';
import 'package:buyingmedicines1/views/screens/productDetailes.dart';
import 'package:buyingmedicines1/views/screens/startpage.dart';
import 'package:flutter/material.dart';

Map<String, Widget Function(BuildContext)> routes = {
  AppRoute.startpage: (_) => const StartPage(),
  AppRoute.login: (_) => const Login(),
  AppRoute.signUp: (_) => const SignUp(),
  AppRoute.mainPage: (_) => const MainPage(),
  AppRoute.productdetailes: (_) => const ProductDetailes(),
  AppRoute.cardpage: (_) => const CardPage(),
  AppRoute.searchpage: (_) => const SearchPage(),
};
