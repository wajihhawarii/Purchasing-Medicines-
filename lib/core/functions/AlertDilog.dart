import 'package:buyingmedicines1/core/constant/color.dart';
import 'package:buyingmedicines1/core/constant/route.dart';
import 'package:flutter/material.dart';

showAlertDialog(context) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
            backgroundColor: AppColor.black1,
            title: const Text(
              "Error",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: AppColor.red,
                  fontStyle: FontStyle.italic),
            ),
            content: const Text(
              "Email or PassWord is not Valid \n Try Again Pleace",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.italic,
                  color: AppColor.blue),
            ),
            actions: [
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                color: AppColor.green,
                child: const Text("ok"),
              ),
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                color: AppColor.red,
                child: const Text("cansel"),
              ),
            ],
          ));
}

getShowDialog(BuildContext context, String messageTitle, String messageBody) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
            elevation: 5,
            backgroundColor: AppColor.white,
            title: Text(
              messageTitle,
              style: const TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                  fontStyle: FontStyle.italic),
            ),
            content: Text(
              messageBody,
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  fontStyle: FontStyle.italic,
                  color: AppColor.black1.withOpacity(0.8)),
            ),
            actions: [
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoute.cardpage);
                },
                color: AppColor.green,
                child: const Text("ToCard"),
              ),
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                color: AppColor.red,
                child: const Text("cansel"),
              ),
            ],
          ));
}

showAlertDialogCheakNow(context) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
            backgroundColor: AppColor.white,
            title: const Text(
              "Yes",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: AppColor.red,
                  fontStyle: FontStyle.italic),
            ),
            content: const Text(
              "Your order is proccer",
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.italic,
                  color: AppColor.black1),
            ),
            actions: [
              MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20)),
                onPressed: () {
                  Navigator.of(context).pushNamed(AppRoute.mainPage);
                },
                color: AppColor.green,
                child: const Text("ok"),
              ),
            ],
          ));
}
