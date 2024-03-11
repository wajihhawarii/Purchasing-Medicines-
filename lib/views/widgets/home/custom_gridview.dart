import 'package:buyingmedicines1/controllers/home.dart';
import 'package:buyingmedicines1/core/constant/color.dart';
import 'package:buyingmedicines1/core/constant/images.dart';
import 'package:buyingmedicines1/core/constant/route.dart';
import 'package:buyingmedicines1/views/widgets/home/card_categories.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({super.key});
  @override
  Widget build(BuildContext context) {
    var homeCotrollerImp = Provider.of<HomeCotrollerImp>(
        context); // object from calss in another file
    homeCotrollerImp.getCategories(); //Fetch Date From DateBase
    return SizedBox(
      height: 650,
      width: double.infinity,
      child: homeCotrollerImp.load == 0
          ? const SizedBox(
              height: 300,
              width: double.infinity,
              child: Center(child: CircularProgressIndicator()),
            )
          : ListView(
              children: [
                SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: homeCotrollerImp.categoriesList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      mainAxisSpacing: 2,
                      crossAxisSpacing: 2,
                    ),
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          homeCotrollerImp.selectCategorie(index);
                        },
                        child: CardCategories(
                          color: homeCotrollerImp.indexx == index
                              ? AppColor.blue.withOpacity(1)
                              : AppColor.green.withOpacity(0.1),
                          image: homeCotrollerImp.categoriesList[index].image!,
                          name:
                              homeCotrollerImp.categoriesList[index].category!,
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: AppColor.green,
                  ),
                  padding: const EdgeInsets.all(10),
                  height: 338,
                  child: homeCotrollerImp
                          .categoriesList[homeCotrollerImp.indexx]
                          .product!
                          .isEmpty
                      ? SizedBox(
                          height: 100,
                          width: 100,
                          child: Image.asset(
                            AppImages.noresult,
                            fit: BoxFit.fill,
                          ),
                        )
                      : GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                          ),
                          itemCount: homeCotrollerImp
                              .categoriesList[homeCotrollerImp.indexx]
                              .product!
                              .length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                Navigator.of(context).pushNamed(
                                    AppRoute.productdetailes,
                                    arguments: [
                                      homeCotrollerImp
                                          .categoriesList[
                                              homeCotrollerImp.indexx]
                                          .product![index],
                                    ]);
                              },
                              child: Container(
                                  height: 250,
                                  width: 250,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          homeCotrollerImp
                                              .categoriesList[
                                                  homeCotrollerImp.indexx]
                                              .product![index]
                                              .image
                                              .toString(),
                                        ),
                                        fit: BoxFit.fill,
                                        colorFilter: ColorFilter.mode(
                                            Colors.black.withOpacity(0.5),
                                            BlendMode.color),
                                      )),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 20,
                                        width: 40,
                                        child: Center(
                                          child: Text(
                                            " ${homeCotrollerImp.categoriesList[homeCotrollerImp.indexx].product![index].name}",
                                            style: const TextStyle(
                                                color: AppColor.black1,
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold,
                                                fontStyle: FontStyle.normal),
                                          ),
                                        ),
                                      ),
                                      const Spacer(),
                                      SizedBox(
                                        height: 40,
                                        width: 40,
                                        child: Center(
                                          child: Text(
                                            " ${homeCotrollerImp.categoriesList[homeCotrollerImp.indexx].product![index].price}",
                                            style: const TextStyle(
                                                color: AppColor.red,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                fontStyle: FontStyle.normal),
                                          ),
                                        ),
                                      ),
                                    ],
                                  )),
                            );
                          },
                        ),
                ),
              ],
            ),
    );
  }
}
