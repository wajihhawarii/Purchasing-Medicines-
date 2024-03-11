import 'package:buyingmedicines1/controllers/serach.dart';
import 'package:buyingmedicines1/core/constant/color.dart';
import 'package:buyingmedicines1/views/widgets/search/appbar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white.withOpacity(0.9),
      body: ChangeNotifierProvider<SearchCotrollerImp>(
        create: (_) {
          return SearchCotrollerImp();
        },
        child: const SearchItem(),
      ),
    );
  }
}

class SearchItem extends StatelessWidget {
  const SearchItem({super.key});
  @override
  Widget build(BuildContext context) {
    var searchCotrollerImp = Provider.of<SearchCotrollerImp>(context);
    searchCotrollerImp.getProduct();
    return ListView(
      children: [
        const SearchAppBar(), // object from class in another file
        Container(
          padding: const EdgeInsets.all(5),
          height: 720,
          width: double.infinity,
          child: searchCotrollerImp.listSearchProduct
                  .isEmpty //Check if there are no items matching your search
              ? const Center(
                  child: Text(
                  "Search Medicine...",
                  style: TextStyle(color: AppColor.grey),
                ))
              : GridView.builder(
                  shrinkWrap: true,
                  itemCount: searchCotrollerImp
                      .listSearchProduct.length, //listCategories.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, //عدد الاعمدة
                    mainAxisSpacing: 2, //المسافة بين الاسطر
                    crossAxisSpacing: 2, //المسافة بين الاعمدة
                  ),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        searchCotrollerImp.goToDetailesItme(
                            searchCotrollerImp.listProducts[index], context);
                      },
                      child: Container(
                        margin: const EdgeInsets.all(5),
                        height: 120,
                        width: 120,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: AppColor.white),
                        child: Column(children: [
                          Container(
                            height: 120,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                  image: NetworkImage(
                                    searchCotrollerImp
                                        .listSearchProduct[index].image!,
                                  ),
                                  fit: BoxFit.fill,
                                )),
                          ),
                          Text(
                            searchCotrollerImp.listSearchProduct[index].name!,
                            style: const TextStyle(
                                color: AppColor.black, fontSize: 16),
                          ),
                          Text(
                            searchCotrollerImp.listSearchProduct[index].price!,
                            style: const TextStyle(
                                color: AppColor.red, fontSize: 16),
                          ),
                        ]),
                      ),
                    );
                  },
                ),
        )
      ],
    );
  }
}
