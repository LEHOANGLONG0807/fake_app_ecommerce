import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/components/_close_activity.dart';

Widget buildSearchRow(Function(String) onChanged) {
  return TextField(
    onChanged: onChanged,
    decoration: InputDecoration(
        suffixIcon: Icon(Icons.search),
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        border: OutlineInputBorder(
          gapPadding: 8,
          borderRadius: borderRadius,
        ),
        filled: true,
        hintStyle: new TextStyle(color: Colors.grey[800]),
        hintText: "Tìm kiếm sản phẩm",
        fillColor: Colors.grey.shade300),
  );
}

IconButton _buildFilterBtn() {
  return IconButton(
    alignment: Alignment.center,
    icon: Icon(CupertinoIcons.sort_down, size: 20),
    onPressed: () => print("Filter clicked"),
    tooltip: "Filter",
    iconSize: 35,
    padding: EdgeInsets.all(10),
    color: Colors.teal,
  );
}
