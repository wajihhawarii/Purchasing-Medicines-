import 'package:buyingmedicines1/core/constant/color.dart';
import 'package:buyingmedicines1/core/constant/route.dart';
import 'package:buyingmedicines1/core/services/myservicees.dart';
import 'package:buyingmedicines1/models/profileinformations.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 10, right: 5, top: 30),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              children: [
                const Text(
                  " My Profile",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: AppColor.black,
                  ),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(AppRoute.startpage);
                  },
                  icon: const Icon(
                    Icons.arrow_circle_right_outlined,
                    size: 30,
                    color: AppColor.red,
                  ),
                )
              ],
            ),
          ),
          for (int i = 0; i < customListTileList.length; i++)
            customListTileList[i],
        ],
      ),
    );
  }
}

class CustomListTiel extends StatelessWidget {
  final IconData iconData;
  final String title;
  final String subtile;

  const CustomListTiel(
      {super.key,
      required this.iconData,
      required this.title,
      required this.subtile});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: ListTile(
        leading: Icon(
          iconData,
          color: AppColor.green,
        ),
        title: Text(
          title,
          style:
              TextStyle(color: AppColor.black.withOpacity(0.6), fontSize: 18),
        ),
        subtitle: Text(
          subtile,
          style: const TextStyle(color: AppColor.blue, fontSize: 16),
        ),
      ),
    );
  }
}

//Information about user
List customListTileList = [
  CustomListTiel(
    iconData: Icons.person,
    title: "Name",
    subtile:
        MyServices.sharedPreferences.getString(PrefProfile.name).toString(),
  ),
  CustomListTiel(
    iconData: Icons.phone,
    title: "phone",
    subtile:
        MyServices.sharedPreferences.getString(PrefProfile.phone).toString(),
  ),
  CustomListTiel(
    iconData: Icons.email,
    title: "Email",
    subtile:
        MyServices.sharedPreferences.getString(PrefProfile.email).toString(),
  ),
  CustomListTiel(
    iconData: Icons.home,
    title: "Address",
    subtile:
        MyServices.sharedPreferences.getString(PrefProfile.address).toString(),
  ),
  CustomListTiel(
    iconData: Icons.date_range,
    title: "DateTime",
    subtile:
        MyServices.sharedPreferences.getString(PrefProfile.cretedAt).toString(),
  ),
];
