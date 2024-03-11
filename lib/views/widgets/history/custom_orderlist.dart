import 'package:buyingmedicines1/controllers/history.dart';
import 'package:buyingmedicines1/core/constant/color.dart';
import 'package:buyingmedicines1/views/widgets/history/voicedetailes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomOrderList extends StatelessWidget {
  const CustomOrderList({super.key});

  @override
  Widget build(BuildContext context) {
    var historyCotrollerImp = Provider.of<HistoryCotrollerImp>(
        context); // Objects from class another  flile
    historyCotrollerImp.getOrderHistory(); //Fetch Date From DateBase
    return SizedBox(
      height: 500,
      width: double.infinity,
      //We set this condition in order for the loading module to appear before fetching data from the database

      child: historyCotrollerImp.load == 0
          ? const SizedBox(
              height: 600,
              width: double.infinity,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : ListView.builder(
              itemCount: historyCotrollerImp.orderHistoryList.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 4,
                  shadowColor: AppColor.black,
                  child: ListTile(
                    subtitle: Row(
                      children: [
                        const Text(
                          " Number Voise : ",
                          style: TextStyle(
                              fontSize: 14,
                              color: AppColor.black,
                              fontStyle: FontStyle.normal),
                        ),
                        Text(
                          historyCotrollerImp.orderHistoryList[index].invoice!,
                          style: const TextStyle(
                              color: AppColor.blue, fontSize: 14),
                        ),
                      ],
                    ),
                    trailing: IconButton(
                      onPressed: () {
                        orderDetailes(
                            context,
                            historyCotrollerImp.orderHistoryList[
                                index]); // Show Detailes Order By AlertDailog
                      },
                      icon: const Icon(
                        Icons.arrow_right,
                        size: 28,
                        color: AppColor.black,
                      ),
                    ), //النسق في نهاية الحقل
                    leading: const Icon(
                      Icons.circle,
                      color: AppColor.green,
                      size: 20,
                    ),
                    title: Row(
                      children: [
                        const Text(
                          " DateTime : ",
                          style: TextStyle(fontSize: 14, color: AppColor.black),
                        ),
                        Text(
                          historyCotrollerImp.orderHistoryList[0].orderAt!,
                          style: const TextStyle(
                              fontSize: 14, color: AppColor.blue),
                        ),
                      ],
                    ),
                    onTap: () {},
                    iconColor: AppColor.red,
                    textColor: AppColor.white,
                    splashColor: AppColor.black,
                  ),
                );
              },
            ),
    );
  }
}
