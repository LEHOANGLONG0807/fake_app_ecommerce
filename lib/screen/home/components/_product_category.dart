import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/models/Product.dart';
import '../../../models/_res_files.dart';
import '../../all_product_screen.dart';
import '../../details/detail_page.dart';
import 'package:get/get.dart';

import '_build_category_card.dart';
import '_build_popular_card.dart';

ListView category() {
  final categories = Res.fetchCategories();
  return ListView.builder(
      padding: EdgeInsets.only(left: 0),
      itemCount: categories.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            final list = Res.products();
            final newList = <Product>[];
            list.forEach((element) {
              if (element.tag == categories[index].tag) {
                newList.add(element);
              }
            });
            Get.to(() => AllProductScreen(
                  title: categories[index].title,
                  products: newList,
                ));
          },
          child: buildPopularCard(categories[index]),
        );
      });
}

GridView mostPopularCategory(context) {
  final products = Res.products();
  final newList = products.sublist(0, 6);
  return GridView.count(
    crossAxisCount: 2,
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    children: List.generate(newList.length, (index) {
      return GestureDetector(
        onTap: () => Get.to(ProductDetail(product: newList[index])),
        child: buildCard(newList[index]),
      );
    }),
  );
}
