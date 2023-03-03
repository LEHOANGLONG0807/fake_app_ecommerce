import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/main.dart';
import 'package:flutter_ecommerce_app/screen/details/detail_page.dart';
import 'package:get/get.dart';

import '../../models/Product.dart';
import '../payment_screen.dart';
import 'components/_build_app_bar.dart';
import 'components/_item_cart_view.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  AppController get _appCtrl => Get.find();

  final _products = <ProductInCart>[].obs;

  @override
  void initState() {
    _products.addAll(_appCtrl.productCart);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey.shade200,
      appBar: buildAppBar(context),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              child: Obx(() {
                if (_products.isEmpty) return     Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/ic_empty.png',width: 100,color: Colors.grey.shade400),
                    const SizedBox(height: 10),
                    Text('Không có dữ liệu'),

                  ],
                );
                return ListView.builder(
                  itemCount: _products.length,
                  itemBuilder: (context, index) {
                    return ItemCart(
                      product: _products[index],
                      onTap: () async {
                        await Get.to(ProductDetail(product: _products[index].product));
                        _products.clear();
                        _products.addAll(_appCtrl.productCart);
                      },
                      onChanged: () {
                        _products.clear();
                        _products.addAll(_appCtrl.productCart);
                      },
                    );
                  },
                );
              }),
            ),
            const SizedBox(height: 15),
            SizedBox(
              child: Obx(() {
                return ElevatedButton(
                    onPressed: _products.isNotEmpty
                        ? () {
                            _order();
                          }
                        : null,
                    child: Text('Tiếp tục'));
              }),
              width: double.infinity,
            ).paddingSymmetric(horizontal: 50),
            const SizedBox(height: 15),
          ],
        ),
      ),
    );
  }

  void _order() {
    final order = ProductOrder(
        id: 'DH${DateTime.now().microsecondsSinceEpoch.toString()}',
        products: _products,
        name: '',
        phone: '',
        email: '',
        address: '',
        status: 1,
        createdAt: DateTime.now());
    Get.to(() => PaymentPage(order));
  }
}
