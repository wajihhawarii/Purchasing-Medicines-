import 'package:buyingmedicines1/core/constant/color.dart';
import 'package:buyingmedicines1/core/constant/route.dart';
import 'package:buyingmedicines1/views/widgets/profile/customListTile.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.black.withOpacity(0.1),
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
          const Divider(
            thickness: 2,
          ),
          for (int i = 0; i < customListTileList.length; i++)
            customListTileList[i],
        ],
      ),
    );
  }
}
