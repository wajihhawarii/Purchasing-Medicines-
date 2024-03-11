import 'package:buyingmedicines1/core/constant/route.dart';
import 'package:buyingmedicines1/core/services/myservicees.dart';
import 'package:buyingmedicines1/core/services/theme.dart';
import 'package:buyingmedicines1/routes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MyServices.sharedPreferences = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getThemeDate(),
      debugShowCheckedModeBanner: false,
      routes: routes,
      initialRoute: AppRoute.startpage,
    );
  }
}
