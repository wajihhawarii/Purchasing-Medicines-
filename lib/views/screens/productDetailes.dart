import 'package:buyingmedicines1/controllers/productDetailes.dart';
import 'package:buyingmedicines1/core/constant/color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailes extends StatelessWidget {
  const ProductDetailes({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) {
        return ProductDetaileControllerImp();
      },
      child: Scaffold(
        backgroundColor: AppColor.white.withOpacity(1),
        body: Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: const CustomProductsDetaile(),
        ),
      ),
    );
  }
}

class CustomProductsDetaile extends StatelessWidget {
  const CustomProductsDetaile({super.key});

  @override
  Widget build(BuildContext context) {
    var productDetaileControllerImp = Provider.of<ProductDetaileControllerImp>(
        context); //object from class in Another file
    final List<dynamic> arguments = ModalRoute.of(context)!.settings.arguments
        as List<dynamic>; // Receiving data from the previous interface
    productDetaileControllerImp.productModel = arguments[0];
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 50, bottom: 20),
          child: Row(
            children: [
              const Text(
                "\tProduct Detailes",
                style: TextStyle(color: AppColor.black, fontSize: 30),
              ),
              const Spacer(),
              IconButton(
                onPressed: () {
                  productDetaileControllerImp.toHomePage(context);
                },
                icon: const Icon(Icons.arrow_forward_ios_rounded),
              ),
            ],
          ),
        ),
        const Divider(
          thickness: 2,
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          height: 280,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(55),
              image: DecorationImage(
                image: NetworkImage(
                    productDetaileControllerImp.productModel.image!),
                fit: BoxFit.fill,
              )),
        ),
        Text(productDetaileControllerImp.productModel.name!,
            style: const TextStyle(
                color: AppColor.black,
                fontSize: 20,
                fontWeight: FontWeight.bold)),
        Container(
          padding: const EdgeInsets.all(5),
          height: 200,
          decoration: BoxDecoration(
            color: AppColor.grey.withOpacity(0.05),
            borderRadius: BorderRadius.circular(10),
          ),
          width: double.infinity,
          child: SingleChildScrollView(
            child: Text(productDetaileControllerImp.productModel.description!,
                style: TextStyle(
                    color: AppColor.black1.withOpacity(0.8),
                    fontSize: 16,
                    fontWeight: FontWeight.bold)),
          ),
        ),
        Row(
          children: [
            const Spacer(),
            const Text("PR ", style: TextStyle(color: AppColor.black)),
            Text(
              "${productDetaileControllerImp.productModel.price!} \$",
              style: const TextStyle(color: AppColor.red),
            )
          ],
        ),
        Container(
            width: double.infinity,
            margin: const EdgeInsets.all(10),
            child: Center(
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    side: const BorderSide(color: AppColor.black, width: 2),
                    borderRadius: BorderRadius.circular(20)),
                minWidth: 410,
                height: 50,
                color: AppColor.green,
                child: const Text(
                  "Add To Card",
                  style: TextStyle(color: AppColor.white, fontSize: 20),
                ),
                onPressed: () {
                  productDetaileControllerImp.addToCard(
                      productDetaileControllerImp.productModel.idProduct!,
                      context);
                },
              ),
            )),
      ],
    );
  }
}
