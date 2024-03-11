import 'package:buyingmedicines1/controllers/card.dart';
import 'package:buyingmedicines1/core/constant/color.dart';
import 'package:buyingmedicines1/core/constant/route.dart';
import 'package:buyingmedicines1/views/widgets/card/cardproducts.dart';
import 'package:buyingmedicines1/views/widgets/card/deliveryDestination.dart';
import 'package:buyingmedicines1/views/widgets/card/voiceinformation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardPage extends StatelessWidget {
  const CardPage({super.key});

  @override
  Widget build(BuildContext context) {
    print("7777777777777777777777777777777");
    return ChangeNotifierProvider(
      create: (_) {
        return CardCotrollerImp();
      },
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50, bottom: 20),
                child: Row(
                  children: [
                    const Text(
                      "\tMyCard",
                      style: TextStyle(color: AppColor.black, fontSize: 30),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(AppRoute.mainPage);
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios_sharp,
                        size: 28,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                thickness: 2,
              ),
              const DeliveryDestination(),
              const CardProducts(),
              const VoiceInformation(),
            ],
          ),
        ),
      ),
    );
  }
}
