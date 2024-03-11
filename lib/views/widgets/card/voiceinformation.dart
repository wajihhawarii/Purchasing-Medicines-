import 'package:buyingmedicines1/controllers/card.dart';
import 'package:buyingmedicines1/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VoiceInformation extends StatelessWidget {
  const VoiceInformation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var cardCotrollerImp = Provider.of<CardCotrollerImp>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: const EdgeInsets.all(8),
        height: 170,
        //We set this condition in order for the loading module to appear before fetching data from the database
        child: cardCotrollerImp.load == 0
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      const Text(
                        "Total Items",
                        style: TextStyle(color: AppColor.black, fontSize: 18),
                      ),
                      const Spacer(),
                      Text(
                        cardCotrollerImp.totalPrice == null
                            ? "0"
                            : cardCotrollerImp.totalPrice!,
                        style: const TextStyle(
                            color: AppColor.green, fontSize: 18),
                      ),
                    ],
                  ),
                  const Row(
                    children: [
                      Text(
                        "Delivery Free",
                        style: TextStyle(color: AppColor.black, fontSize: 18),
                      ),
                      Spacer(),
                      Text(
                        "0",
                        style: TextStyle(color: AppColor.green, fontSize: 18),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      const Text(
                        "Total Payment",
                        style: TextStyle(color: AppColor.black, fontSize: 18),
                      ),
                      const Spacer(),
                      Text(
                        cardCotrollerImp.totalPrice == null
                            ? "0"
                            : cardCotrollerImp.totalPrice!,
                        style: const TextStyle(
                            color: AppColor.green, fontSize: 18),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      minWidth: 500,
                      height: 50,
                      color: AppColor.green,
                      onPressed: () {
                        cardCotrollerImp.cheakNow(context);
                      },
                      child: const Text(
                        "CHECK NOW",
                        style: TextStyle(color: AppColor.white, fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
