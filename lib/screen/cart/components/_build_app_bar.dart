import 'package:flutter/cupertino.dart';
import 'package:flutter_ecommerce_app/components/_close_activity.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context) {
  return AppBar(
    elevation: 0,
    leading: closeActivity(),
    title: Text("Giỏ hàng", style: TextStyle(color: Colors.black)),
    backgroundColor: Colors.grey.shade100,
  );
}
