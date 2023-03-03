import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/models/Product.dart';

Widget cardImage(Product product) {
  return Image.network(
    product.images[0],
    width: 150,
    height: 140,
    fit: BoxFit.fill,
    color: product.color,
  );
}
