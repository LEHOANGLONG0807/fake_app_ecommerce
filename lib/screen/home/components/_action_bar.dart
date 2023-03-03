import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/screen/cart/cart_page.dart';
import 'package:flutter_ecommerce_app/screen/order_screen.dart';
import 'package:get/get.dart';

Row buildActionBar() {
  return Row(
    children: [
      Text(
        'Trang chủ',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
      Spacer(),
      GestureDetector(
        onTap: () {
          Get.to(() => OrderPage());
        },
        child: Column(
          children: [
            Icon(
              CupertinoIcons.time,
              size: 25,
            ),
            Text(
              'Đơn hàng',
              style: TextStyle(fontSize: 10),
            )
          ],
        ),
      ),
      const SizedBox(width: 15),
      GestureDetector(
        onTap: () {
          Get.to(() => CartPage());
        },
        child: Column(
          children: [
            Icon(
              CupertinoIcons.cart,
              size: 25,
            ),
            Text(
              'Giỏ hàng',
              style: TextStyle(fontSize: 10),
            )
          ],
        ),
      ),
    ],
  );
}
