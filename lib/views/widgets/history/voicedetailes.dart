//كان من الممكن ان نخبر مطور الخلفية ان يضع لدينا رابط من اجل ان يعرض الطلبان حسب رقم الفاتورة
import 'package:buyingmedicines1/core/constant/color.dart';
import 'package:buyingmedicines1/models/orderhistory.dart';
import 'package:flutter/material.dart';

orderDetailes(BuildContext context, OrderHistoryModel orderHistoryModel) {
  showDialog(
      barrierDismissible: false,
      context: context,
      barrierColor: AppColor.black1
          .withOpacity(0.9), //لون الواجهة التي خلف الرسالة  التي سوف تظهر
      builder: (context) => AlertDialog(
            backgroundColor: AppColor.black,
            title: const Text(
              "Order Detailes",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: AppColor.red,
                  fontStyle: FontStyle.italic),
            ),
            content: SizedBox(
              height: 230,
              width: 300,
              child: ListView.builder(
                  itemCount: orderHistoryModel.detail!.length,
                  itemBuilder: (BuildContext context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColor.white.withOpacity(0.5),
                      ),
                      height: 150,
                      width: 300,
                      margin: const EdgeInsets.all(6),
                      padding: const EdgeInsets.all(6),
                      child: ListView(
                        children: [
                          Text(
                            "Order $index",
                            style: const TextStyle(
                                color: AppColor.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              const Text("nameProduct : ",
                                  style: TextStyle(
                                      color: AppColor.black1,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.normal)),
                              Text(
                                  orderHistoryModel.detail![index].nameProduct!,
                                  style: const TextStyle(
                                      color: AppColor.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.normal)),
                            ],
                          ),
                          const Divider(),
                          Row(
                            children: [
                              const Text("quantity : ",
                                  style: TextStyle(
                                      color: AppColor.black1,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.normal)),
                              Text(orderHistoryModel.detail![index].quantity!,
                                  style: const TextStyle(
                                      color: AppColor.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.normal)),
                            ],
                          ),
                          const Divider(),
                          Row(
                            children: [
                              const Text("price : ",
                                  style: TextStyle(
                                      color: AppColor.black1,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.normal)),
                              Text(orderHistoryModel.detail![index].price!,
                                  style: const TextStyle(
                                      color: AppColor.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.normal)),
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            actions: [
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                color: Colors.green,
                child: const Text("ok"),
              ),
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                color: Colors.red,
                child: const Text("cansel"),
              ),
            ],
          ));
}
