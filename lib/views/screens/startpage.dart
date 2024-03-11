import 'package:buyingmedicines1/core/constant/color.dart';
import 'package:buyingmedicines1/core/constant/images.dart';
import 'package:buyingmedicines1/core/constant/route.dart';
import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _SplashScreensState();
}

class _SplashScreensState extends State<StartPage> {
  sessionLogout() {}
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 80,
          ),
          WidgetIllustrations(
            widget: ButtonPrimary(
                text: "Get Started",
                onPressed: () {
                  Navigator.pushReplacementNamed(context, AppRoute.signUp);
                }),
            image: AppImages.startimage,
            title: "Find Your MEdical\n solution",
            subtile1: "consult with adoctor",
            subtile2: "whereever and wherenever you want ",
          ),
        ],
      ),
    );
  }
}

class WidgetIllustrations extends StatelessWidget {
  final Widget widget;
  final String image;
  final String title;
  final String subtile1;
  final String subtile2;
  const WidgetIllustrations(
      {super.key,
      required this.widget,
      required this.image,
      required this.title,
      required this.subtile1,
      required this.subtile2});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 140),
          height: 400,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.fill,
                colorFilter: ColorFilter.mode(AppColor.green.withOpacity(0.7),
                    BlendMode.color), //نقوم بنلوين الصورة
              )),
        ),
        Text(
          title,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: AppColor.grey,
          ),
        ),
        Column(
          children: [
            Text(
              subtile1,
              style: const TextStyle(
                color: AppColor.grey,
              ),
            ),
            Text(
              subtile2,
              style: const TextStyle(color: AppColor.grey),
            ),
            const SizedBox(
              height: 50,
            ),
            widget,
          ],
        )
      ],
    );
  }
}

class ButtonPrimary extends StatelessWidget {
  final String text;
  final void Function()? onPressed;

  const ButtonPrimary({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 20,
      height: 50,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColor.green,
        ),
        child: Text(
          text,
          style: const TextStyle(
              color: AppColor.white, fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
