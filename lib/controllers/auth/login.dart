import 'dart:convert';
import 'package:buyingmedicines1/apilink/apilink.dart';
import 'package:buyingmedicines1/core/constant/route.dart';
import 'package:buyingmedicines1/core/functions/AlertDilog.dart';
import 'package:buyingmedicines1/core/functions/saveprofile.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;

abstract class LoginController extends ChangeNotifier {
  login(BuildContext context);
  goToSingUp(BuildContext context);
  showPassWord();
}

class LoginControllerImp extends LoginController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  int load = 2;
  bool obscurt = false;

  @override
  goToSingUp(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(AppRoute.signUp);
  }

  @override
  login(context) async {
    var form = formstate.currentState;
    if (form!.validate()) {
      load = 1;
      notifyListeners();
      var response = await http.post(Uri.parse(ApiLink.loginpage), body: {
        "email": email.text,
        "password": password.text,
      });
      load = 2;
      notifyListeners();
      final date = jsonDecode(response.body);
      if (date["value"] == 1) {
        savePref(
            idUser: date["user_id"],
            name: date["name"],
            email: date["email"],
            phone: date["phone"],
            address: date["address"],
            createdAt: date["created_at"]);

        // ignore: use_build_context_synchronously
        Navigator.of(context).pushReplacementNamed(AppRoute.mainPage);
      } else {
        // ignore: use_build_context_synchronously
        showAlertDialog(context);
      }
    } else {}
  }

  @override
  showPassWord() {
    obscurt = !obscurt;
    notifyListeners();
  }
}
