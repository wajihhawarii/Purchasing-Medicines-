import 'package:buyingmedicines1/controllers/auth/login.dart';
import 'package:buyingmedicines1/core/constant/color.dart';
import 'package:buyingmedicines1/core/constant/images.dart';
import 'package:buyingmedicines1/core/functions/validateFiled.dart';
import 'package:buyingmedicines1/views/widgets/auth/CustomAuthButton.dart';
import 'package:buyingmedicines1/views/widgets/auth/customTextForm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ChangeNotifierProvider<LoginControllerImp>(
      create: (context) {
        return LoginControllerImp();
      },
      child: SingleChildScrollView(
        child: Consumer<LoginControllerImp>(
            builder: (context, loginControllerImp, child) {
          return loginControllerImp.load == 1
              ? const SizedBox(
                  height: 800,
                  width: double.infinity,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Form(
                    key: loginControllerImp.formstate,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 60, bottom: 120),
                          height: 200,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage(AppImages.logo),
                            fit: BoxFit.fill,
                            colorFilter: ColorFilter.mode(Colors.green,
                                BlendMode.color), //نقوم بنلوين الصورة
                          )),
                        ),
                        const Row(
                          children: [
                            Text(
                              "Login",
                              style: TextStyle(
                                  color: AppColor.red,
                                  fontSize: 25,
                                  fontStyle: FontStyle.italic,
                                  fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                          ],
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        const Row(
                          children: [
                            Text(
                              "Login into your Account",
                              style: TextStyle(
                                  color: AppColor.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        CutomTextForm(
                          obscurt: false,
                          validator: (val) {
                            return validatorTextFiled(val, "email");
                          },
                          controller: loginControllerImp.email,
                          hintText: "Email Address",
                        ),
                        CutomTextForm(
                          obscurt: loginControllerImp.obscurt,
                          validator: (val) =>
                              validatorTextFiled(val, "password"),
                          controller: loginControllerImp.password,
                          hintText: "Password",
                          suffixIcon: IconButton(
                            onPressed: () {
                              loginControllerImp.showPassWord();
                            },
                            icon: Icon(!loginControllerImp.obscurt
                                ? Icons.visibility
                                : Icons.visibility_off_outlined),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        CustomAuthButton(
                          onPressed: () {
                            loginControllerImp.login(context);
                          },
                          text: "login",
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Dont have an account ?",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            TextButton(
                                onPressed: () {
                                  loginControllerImp.goToSingUp(context);
                                },
                                child: const Text(
                                  "Create Account",
                                  style: TextStyle(
                                      color: AppColor.red,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ))
                          ],
                        )
                      ],
                    ),
                  ),
                );
        }),
      ),
    ));
  }
}
