import 'dart:math';

import 'package:flutter/cupertino.dart';
class Product {
  Color color;
  String title;
  String image;
  List<String> images;
  num price;
  String tag;
  String description;
  String info;
  num prePrice;
  int sale;

  Product(
      {this.color,
      this.title,
      this.image,
      this.price,
      this.tag,
      this.description,
      this.images,
      this.prePrice,
      this.sale,
      this.info});

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        title: json["title"],
        images: (json["images"] as List).map((e) => e.toString()).toList(),
        price: json["price"],
        tag: json["tag"],
        description: json["description"],
        info: json["info"],
        prePrice: json["prePrice"],
        sale: json["sale"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "images": images,
        "price": price,
        "tag": tag,
        "description": description,
        "info": info,
        "sale": sale,
        "prePrice": prePrice,
      };

  List<ProductPriceSeries> get getPriceSeries => ProductPriceSeries.getPriceSeries(price);
}

class ProductInCart {
  Product product;
  int quantity;

  ProductInCart({this.product, this.quantity});

  factory ProductInCart.fromJson(Map<String, dynamic> json) => ProductInCart(
        quantity: json["quantity"],
        product: Product.fromJson(json["product"]),
      );

  Map<String, dynamic> toJson() => {
        "quantity": quantity,
        "product": product.toJson(),
      };
}

class ProductOrder {
  List<ProductInCart> products;
  String name;
  String email;
  String phone;
  String id;
  String address;
  num totalAmount;
  int status; //1: inprogess, 2 completed, 3 cancel,
  DateTime createdAt;
  VoucherModel voucher;

  ProductOrder(
      {this.products,
      this.name,
      this.id,
      this.email,
      this.phone,
      this.address,
      this.status,
      this.voucher,
      this.totalAmount,
      this.createdAt});

  factory ProductOrder.fromJson(Map<String, dynamic> json) => ProductOrder(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      phone: json["phone"],
      address: json["address"],
      status: json["status"],
      totalAmount: json["totalAmount"],
      voucher: json["voucher"] != null ? VoucherModel.fromJson(json["voucher"]) : null,
      createdAt: DateTime.tryParse(json["createdAt"]),
      products: (json["products"] as List).map((e) => ProductInCart.fromJson(e)).toList());

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "address": address,
        "status": status,
        "totalAmount": totalAmount,
        "voucher": voucher?.toJson(),
        "createdAt": createdAt.toIso8601String(),
        "products": products.map((e) => e.toJson()).toList(),
      };
}

class VoucherModel {
  String name;
  String hsd;
  String code;
  String id;
  String desc;
  String type; //percent/money;
  num amount;
  Function apply;

  VoucherModel({
    this.name,
    this.id,
    this.desc,
    this.hsd,
    this.code,
    this.type,
    this.amount,
    this.apply,
  });

  factory VoucherModel.fromJson(Map<String, dynamic> json) => VoucherModel(
        id: json["id"],
        name: json["name"],
        code: json["code"],
        desc: json["desc"],
        hsd: json["hsd"],
        type: json["type"],
        amount: json["amount"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "code": code,
        "desc": desc,
        "hsd": hsd,
        "amount": amount,
        "type": type,
      };
}

class ProductPriceSeries {
  final String month;
  final num price;

  ProductPriceSeries({this.month, this.price });

  static List<ProductPriceSeries> getPriceSeries(num price) {
    final max = price + 5000000;
    final min = price - 2000000;
    final data = [
       ProductPriceSeries(
        month: "11/2022",
        price: min + Random().nextInt(max - min),
      ),
      ProductPriceSeries(
        month: "12/2022",
        price: min + Random().nextInt(max - min),
      ),
      ProductPriceSeries(
        month: "01/2023",
        price: min + Random().nextInt(max - min),
      ),
      ProductPriceSeries(
        month: "02/2023",
        price: min + Random().nextInt(max - min),
      ),
      ProductPriceSeries(
        month: "03/2023",
        price: price,
      ),
    ];
    return data;
  }
}
