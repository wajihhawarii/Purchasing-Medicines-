import 'package:buyingmedicines1/controllers/card.dart';
import 'package:buyingmedicines1/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardProducts extends StatelessWidget {
  const CardProducts({super.key});

  @override
  Widget build(BuildContext context) {
    var cardCotrollerImp = Provider.of<CardCotrollerImp>(
        context); //Object From Class In Another File
    cardCotrollerImp.getProducts(); // Fetch Date From DateBase
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      height: 370,
      child: cardCotrollerImp.load == 0
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : cardCotrollerImp.cardProductList.isEmpty
              ? const Center(
                  child: Text(
                    "Empty Card",
                    style: TextStyle(color: AppColor.grey, fontSize: 40),
                  ),
                )
              : ListView.builder(
                  itemCount: cardCotrollerImp.cardProductList.length,
                  itemBuilder: (BuildContext context, index) {
                    return Card(
                      color: Colors.white,
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        height: 100,
                        width: double.infinity,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Image.network(
                                cardCotrollerImp.cardProductList[index].image!,
                                fit: BoxFit.fill,
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    cardCotrollerImp
                                        .cardProductList[index].name!,
                                    style: const TextStyle(
                                        fontSize: 16,
                                        color: AppColor.black,
                                        fontStyle: FontStyle.normal),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            cardCotrollerImp.updateQuantity(
                                                "tambah",
                                                cardCotrollerImp
                                                    .cardProductList[index]
                                                    .idCart!);
                                          },
                                          icon: const Icon(
                                            Icons.add_circle_outlined,
                                            size: 24,
                                            color: AppColor.green,
                                          )),
                                      Text(
                                        cardCotrollerImp
                                            .cardProductList[index].quantity!,
                                        style: const TextStyle(
                                            fontSize: 18, color: AppColor.blue),
                                      ),
                                      IconButton(
                                          onPressed: () {
                                            cardCotrollerImp.updateQuantity(
                                                "kurang",
                                                cardCotrollerImp
                                                    .cardProductList[index]
                                                    .idCart!);
                                          },
                                          icon: const Icon(
                                            Icons.remove_circle_outlined,
                                            size: 24,
                                            color: AppColor.red,
                                          ))
                                    ],
                                  ),
                                  Text(
                                    cardCotrollerImp
                                        .cardProductList[index].price!,
                                    style: const TextStyle(
                                        fontSize: 18, color: AppColor.black),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
    );
  }
}
