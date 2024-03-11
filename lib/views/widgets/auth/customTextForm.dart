import 'package:buyingmedicines1/core/constant/color.dart';
import 'package:flutter/material.dart';

class CutomTextForm extends StatelessWidget {
  final Widget? suffixIcon;
  final String? hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final bool obscurt;
  const CutomTextForm({
    super.key,
    this.suffixIcon,
    required this.hintText,
    required this.controller,
    required this.validator,
    required this.obscurt,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.all(10),
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
                blurRadius: 2,
                color: AppColor.black1,
                offset: Offset(2, 2),
                spreadRadius: 0)
          ],
          color: AppColor.white),
      width: MediaQuery.of(context).size.width,
      child: TextFormField(
        style: const TextStyle(fontSize: 16, color: AppColor.blue),
        controller: controller,
        validator: validator,
        obscureText: obscurt,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}




//Icon(Icons.visibility),  عين كلمة المررور