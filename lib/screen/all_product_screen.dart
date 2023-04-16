import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/components/_close_activity.dart';
import 'package:flutter_ecommerce_app/models/Product.dart';
import 'package:get/get.dart';
import 'package:slugify/slugify.dart';
import 'cart/cart_page.dart';
import 'details/detail_page.dart';
import 'home/components/_build_category_card.dart';
import 'home/components/_search_filter_view.dart';

class AllProductScreen extends StatefulWidget {
  final String title;
  final List<Product> products;

  const AllProductScreen({Key key, this.title, this.products}) : super(key: key);

  @override
  _AllProductScreenState createState() => _AllProductScreenState();
}

class _AllProductScreenState extends State<AllProductScreen> {
  final _products = <Product>[].obs;

  @override
  void initState() {
    _products.addAll(widget.products);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          widget.title,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: closeActivity(),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {
              Get.to(() => CartPage());
            },
            child: Padding(
              padding: EdgeInsets.all(8),
              child: CircleAvatar(
                child: Icon(
                  CupertinoIcons.cart,
                  size: 30,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          buildSearchRow((val) {
            _products.clear();
            if (val.trim().isEmpty) {
              _products.addAll(widget.products);
            } else {
              final key = slugify(val.trim(), delimiter: '', lowercase: true).toString();
              widget.products.forEach((element) {
                final name =
                    slugify(element.title.trim(), delimiter: '', lowercase: true).toString();
                if (name.contains(key)) {
                  _products.add(element);
                }
              });
            }
            _products.refresh();
          }).paddingSymmetric(horizontal: 13),
          SizedBox(height: 10),
          Expanded(
            child: Obx(() {
              if (_products.isEmpty)
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/ic_empty.png',
                        package: 'flutter_ecommerce_app', width: 100, color: Colors.grey.shade400),
                    const SizedBox(height: 10),
                    Text('Không có dữ liệu'),
                  ],
                );
              return GridView.count(
                crossAxisCount: 2,
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 13),
                children: List.generate(_products.toList().length, (index) {
                  return GestureDetector(
                    onTap: () => Get.to(ProductDetail(product: _products[index])),
                    child: buildCard(_products[index]),
                  );
                }),
              );
            }),
          ),
        ],
      ),
    );
  }
}
