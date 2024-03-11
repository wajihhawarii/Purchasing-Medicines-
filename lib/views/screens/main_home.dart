import 'package:buyingmedicines1/controllers/mainhome.dart';
import 'package:buyingmedicines1/core/constant/color.dart';
import 'package:buyingmedicines1/views/widgets/mainhome/bottomNavigationBar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MainHomeControlleImp>(create: (_) {
      return MainHomeControlleImp();
    }, child: Consumer<MainHomeControlleImp>(
      builder: (context, homeControllerImp, child) {
        return Scaffold(
          backgroundColor: AppColor.white,
          body: homeControllerImp.pageLIst
              .elementAt(selectIndex), //index page that will appear
          bottomNavigationBar: CustomBottomNavigationBar(
              homeControllerImp:
                  homeControllerImp), //object from class in Another file
        );
      },
    ));
  }
}
