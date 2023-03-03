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

  Product(
      {this.color,
      this.title,
      this.image,
      this.price,
      this.tag,
      this.description,
      this.images,
      this.info});

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        title: json["title"],
        images: (json["images"] as List).map((e) => e.toString()).toList(),
        price: json["price"],
        tag: json["tag"],
        description: json["description"],
        info: json["info"],
      );

  Map<String, dynamic> toJson() => {
        "title": title,
        "images": images,
        "price": price,
        "tag": tag,
        "description": description,
        "info": info,
      };
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
  int status; //1: inprogess, 2 completed, 3 cancel,
  DateTime createdAt;

  ProductOrder(
      {this.products,
      this.name,
      this.id,
      this.email,
      this.phone,
      this.address,
      this.status,
      this.createdAt});

  factory ProductOrder.fromJson(Map<String, dynamic> json) => ProductOrder(
      id: json["id"],
      name: json["name"],
      email: json["email"],
      phone: json["phone"],
      address: json["address"],
      status: json["status"],
      createdAt: DateTime.tryParse(json["createdAt"]),
      products: (json["products"] as List).map((e) => ProductInCart.fromJson(e)).toList());

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone": phone,
        "address": address,
        "status": status,
        "createdAt": createdAt.toIso8601String(),
        "products": products.map((e) => e.toJson()).toList(),
      };
}
