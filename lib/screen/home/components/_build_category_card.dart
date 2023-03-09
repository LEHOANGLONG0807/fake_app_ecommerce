import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../models/Product.dart';
import 'package:flutter_ecommerce_app/main.dart';

Widget buildCard(Product product) {
  return Container(
    height: 200,
    width: 160,
    clipBehavior: Clip.antiAliasWithSaveLayer,
    margin: EdgeInsets.symmetric(horizontal: 3, vertical: 4),
    decoration: BoxDecoration(
      color: Colors.white,
      boxShadow: [
        BoxShadow(
          offset: Offset(0, 1),
          blurRadius: 5,
          color: Colors.grey.shade300,
        ),
      ],
      borderRadius: BorderRadius.circular(15),
    ),
    child: GridTile(
      header: Stack(
        children: [
          Center(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: imageIcon(product),
            ),
          ),
          if (product.sale != null)
            Image.asset(
              'assets/images/ic_sale.png',
              width: 30,
              package: 'flutter_ecommerce_app',
            ),
          if (product.sale != null)
            Positioned(
              top: 0,
              right: 0,
              child: Container(
                color: Colors.red,
                child: Text(
                  '-${product.sale}%  ',
                  style: Get.textTheme.caption
                      .copyWith(fontWeight: FontWeight.w500, color: Colors.white),
                ),
              ),
            )
        ],
      ),
      footer: _buildPriceRating(product),
      child: Container(),
    ),
  );
}

Padding _buildPriceRating(Product product) {
  return Padding(
    padding: EdgeInsets.all(10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          product.title,
          maxLines: product.sale != null ? 1 : 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 5),
        if (product.sale != null)
          Text(
            '${(product.price * (100 + product.sale) / 100).formatCurrencyNoName}',
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: Colors.grey,
                decoration: TextDecoration.lineThrough),
          ),
        Text(
          '${product.price.formatCurrencyNoName}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
      ],
    ),
  );
}

Text description(Product product) {
  return Text(
    product.description,
    maxLines: 2,
  );
}

Image imageIcon(Product product) {
  return Image.network(
    product.images[0],
    fit: BoxFit.cover,
    height: 100,
    width: 100,
  );
}
