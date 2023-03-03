import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/components/_close_activity.dart';
import 'package:flutter_ecommerce_app/screen/cart/cart_page.dart';
import 'package:get/get.dart';

AppBar detailAppBar(product, VoidCallback callBack) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.white,
    title: Text(
      product.title,
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      ),
    ),
    leading: closeActivity(),
    centerTitle: true,
    actions: [
      InkWell(
        onTap: () async {
          await Get.to(() => CartPage());
          callBack?.call();
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
  );
}
