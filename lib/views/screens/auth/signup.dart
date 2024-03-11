import 'package:buyingmedicines1/controllers/auth/signup.dart';
import 'package:buyingmedicines1/core/constant/color.dart';
import 'package:buyingmedicines1/core/constant/images.dart';
import 'package:buyingmedicines1/core/functions/validateFiled.dart';
import 'package:buyingmedicines1/views/widgets/auth/CustomAuthButton.dart';
import 'package:buyingmedicines1/views/widgets/auth/customTextForm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ChangeNotifierProvider<SignUpControllerImp>(
      create: (context) {
        return SignUpControllerImp();
      },
      child: Consumer<SignUpControllerImp>(
        builder: (context, signUpControllerImp, chid) {
          return SingleChildScrollView(
            child: signUpControllerImp.load == 1
                ? const SizedBox(
                    height: 800,
                    width: double.infinity,
                    child: CircularProgressIndicator(),
                  )
                : Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Form(
                      key: signUpControllerImp.formstate,
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 40,
                          ),
                          Container(
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
                          const SizedBox(
                            height: 60,
                          ),
                          const Row(
                            children: [
                              Text(
                                "SignUp",
                                style: TextStyle(
                                    color: AppColor.red,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25),
                              ),
                            ],
                          ),
                          const Row(
                            children: [
                              Text(
                                "Create A New Account",
                                style: TextStyle(
                                    color: AppColor.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14),
                              ),
                            ],
                          ),
                          CutomTextForm(
                            obscurt: false,
                            hintText: "Pleace Enter Your Name",
                            controller: signUpControllerImp.name,
                            validator: (String? val) {
                              return validatorTextFiled(val, "name");
                            },
                          ),
                          CutomTextForm(
                            obscurt: false,
                            hintText: "Email Address",
                            controller: signUpControllerImp.email,
                            validator: (String? val) {
                              return validatorTextFiled(val, "email");
                            },
                          ),
                          CutomTextForm(
                              obscurt: false,
                              hintText: "Phone Number",
                              controller: signUpControllerImp.phone,
                              validator: (String? val) {
                                return validatorTextFiled(val, "phone");
                              }),
                          CutomTextForm(
                              obscurt: false,
                              hintText: "Home Address",
                              controller: signUpControllerImp.homeaddress,
                              validator: (String? val) {
                                return validatorTextFiled(val, "home");
                              }),
                          CutomTextForm(
                            obscurt: false,
                            hintText: "password",
                            controller: signUpControllerImp.password,
                            validator: (String? val) {
                              return validatorTextFiled(val, "password");
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomAuthButton(
                            onPressed: () {
                              signUpControllerImp.signUp(context);
                            },
                            text: "SignUp",
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already An Account ?",
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              TextButton(
                                  onPressed: () {
                                    signUpControllerImp.goToLogin(context);
                                  },
                                  child: const Text(
                                    "Login Now",
                                    style: TextStyle(
                                        color: AppColor.red,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
          );
        },
      ),
    ));
  }
}
