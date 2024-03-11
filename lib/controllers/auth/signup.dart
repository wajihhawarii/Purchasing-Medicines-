import 'dart:convert';
import 'package:buyingmedicines1/apilink/apilink.dart';
import 'package:buyingmedicines1/core/constant/route.dart';
import 'package:buyingmedicines1/core/functions/AlertDilog.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;

abstract class SignUpController extends ChangeNotifier {
  signUp(BuildContext context);
  goToLogin(BuildContext context);
}

class SignUpControllerImp extends SignUpController {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController homeaddress = TextEditingController();

  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  int load = 2;

  @override
  goToLogin(BuildContext context) {
    Navigator.of(context).pushReplacementNamed(AppRoute.login);
  }

  @override
  signUp(context) async {
    var form = formstate.currentState;
    if (form!.validate()) {
      load = 1;
      notifyListeners();
      var response = await http.post(Uri.parse(ApiLink.registerpage), body: {
        "fullname": name.text,
        "password": password.text,
        "email": email.text,
        "phone": phone.text,
        "address": homeaddress.text,
      });
      load = 2;
      notifyListeners();
      if (response.statusCode == 200 || response.statusCode == 201) {
        final date = jsonDecode(response.body);
        if (date["value"] == 1) {
          // ignore: use_build_context_synchronously
          showDialog(
              context: context,
              builder: (context) {
                return const AlertDialog(
                  title: Text("Success To Registerd in"),
                );
              });
          // ignore: use_build_context_synchronously
          Navigator.of(context).pushReplacementNamed(AppRoute.login);
        } else {
          // ignore: use_build_context_synchronously
          showAlertDialog(context);
        }
      } else {}
    }
  }
}
