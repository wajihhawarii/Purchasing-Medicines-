import 'package:buyingmedicines1/controllers/history.dart';
import 'package:buyingmedicines1/core/constant/color.dart';
import 'package:buyingmedicines1/views/widgets/history/custom_orderlist.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        return HistoryCotrollerImp();
      },
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: AppColor.grey.withOpacity(0.1),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: const Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 50, bottom: 20),
              child: Row(
                children: [
                  Text(
                    "\tOrders History",
                    style: TextStyle(color: AppColor.black, fontSize: 30),
                  ),
                ],
              ),
            ),
            Divider(
              thickness: 2,
            ),
            CustomOrderList(),
          ],
        ),
      ),
    );
  }
}
