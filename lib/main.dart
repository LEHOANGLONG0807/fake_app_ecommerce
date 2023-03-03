import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/models/Product.dart';
import 'package:flutter_ecommerce_app/screen/home/home_page.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'models/_res_files.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GetMaterialApp(
      home: HomePage(),
    ),
  );
}

class AppController extends GetxController {
  SharedPreferences prefs;
  @override
  void onInit() async {
    prefs = await SharedPreferences.getInstance();
    final orderStg = prefs.get('order');
    final cartStg = prefs.get('cart');
    if (orderStg != null && orderStg is List) {
      orderStg.forEach((element) {
        final json = jsonDecode(element);
        final model = ProductOrder.fromJson(json);
        orders.add(model);
      });
    }
    if (cartStg != null && cartStg is List) {
      cartStg.forEach((element) {
        final json = jsonDecode(element);
        final model = ProductInCart.fromJson(json);
        productCart.add(model);
      });
    }
    super.onInit();
  }

  final productCart = <ProductInCart>[];

  final orders = <ProductOrder>[];

  final products = Res.products();

  void _updateStgOrder() {
    final orderStr = <String>[];
    orders.forEach((element) {
      final json = jsonEncode(element.toJson());
      orderStr.add(json);
    });
    prefs.setStringList('order', orderStr);
  }

  void _updateStgCart() {
    final cartStr = <String>[];
    productCart.forEach((element) {
      final json = jsonEncode(element.toJson());
      cartStr.add(json);
    });
    prefs.setStringList('cart', cartStr);
  }

  void onAddProduct(Product product) {
    final index = productCart.indexWhere((element) => element.product.title == product.title);
    if (index >= 0) {
      int quantity = productCart[index].quantity + 1;
      productCart[index].quantity = quantity;
    } else {
      productCart.add(ProductInCart(product: product, quantity: 1));
    }
    _updateStgCart();
  }

  void cancelOrder(String id) {
    final index = orders.indexWhere((element) => element.id == id);
    orders[index].status = 3;
    _updateStgOrder();
  }

  void addOrder(ProductOrder order) {
    orders.insert(0, order);
    _updateStgOrder();
    productCart.clear();
    _updateStgCart();
  }

  int getQuantity(Product product) {
    final index = productCart.indexWhere((element) => element.product.title == product.title);
    if (index >= 0) {
      return productCart[index].quantity;
    }

    return 0;
  }

  void onRemoveProduct(Product product) {
    final index = productCart.indexWhere((element) => element.product.title == product.title);
    if (productCart[index].quantity > 1) {
      int quantity = productCart[index].quantity - 1;
      productCart[index].quantity = quantity;
    } else {
      productCart.removeAt(index);
    }
    _updateStgCart();
  }
}

extension DynamicExtension on dynamic {
  String get formatCurrencyNoName {
    const locale = 'en';
    const currencyName = '';
    const errorText = '0';
    var formatter = NumberFormat.currency(
        locale: locale, name: currencyName, decimalDigits: 0, customPattern: "#,##0.00\u00A4");
    switch (this.runtimeType) {
      case num:
      case int:
      case double:
        return formatter.format(this) + ' VNĐ';
      case String:
        var value = double.tryParse(this);
        if (value == null) {
          return errorText;
        }
        return formatter.format(value) + ' VNĐ';
      default:
        return errorText;
    }
  }
}
