import 'package:buyingmedicines1/core/constant/color.dart';
import 'package:buyingmedicines1/core/services/myservicees.dart';
import 'package:buyingmedicines1/models/profileinformations.dart';
import 'package:flutter/material.dart';

class DeliveryDestination extends StatelessWidget {
  const DeliveryDestination({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.grey.withOpacity(0.05),
      height: 140,
      width: double.infinity,
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
            child: Text(
              "Delivery Destination",
              style: TextStyle(color: AppColor.black),
            ),
          ),
          for (int index = 0; index < userInformation.length; index++)
            Row(
              children: [
                Text(
                  userInformationName[index],
                  style: const TextStyle(color: AppColor.green, fontSize: 18),
                ),
                const Spacer(),
                Text(
                  userInformation[index],
                  style: const TextStyle(color: AppColor.blue, fontSize: 18),
                ),
              ],
            ),
        ],
      ),
    );
  }
}

List userInformationName = ["name", "address", "phone"];
List userInformation = [
  MyServices.sharedPreferences.getString(PrefProfile.name),
  MyServices.sharedPreferences.getString(PrefProfile.address),
  MyServices.sharedPreferences.getString(PrefProfile.phone),
];
