import 'package:buyingmedicines1/controllers/home.dart';
import 'package:buyingmedicines1/core/constant/color.dart';
import 'package:buyingmedicines1/core/constant/images.dart';
import 'package:buyingmedicines1/core/constant/route.dart';
import 'package:buyingmedicines1/views/widgets/home/custom_gridview.dart';
import 'package:buyingmedicines1/views/widgets/home/serach_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeCotrollerImp>(
      create: (_) {
        return HomeCotrollerImp();
      },
      child: Container(
        margin: const EdgeInsets.all(5),
        width: double.infinity,
        child: ListView(
          children: [
            Row(
              children: [
                SizedBox(
                  height: 60,
                  width: 180,
                  child: Image.asset(
                    AppImages.logo1,
                  ),
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(AppRoute.cardpage);
                    },
                    icon: const Icon(
                      Icons.shopping_cart_outlined,
                      color: AppColor.red,
                      size: 35,
                    ))
              ],
            ),
            const Text(
              " Find Medicene or vitimins with medicine",
              style: TextStyle(
                  color: AppColor.grey,
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
            ),
            const SearchItem(),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: Text(
                "Medicin && Vitimines By Categories",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                    color: AppColor.black,
                    fontSize: 18),
              ),
            ),
            const CustomGridView(),
          ],
        ),
      ),
    );
  }
}
