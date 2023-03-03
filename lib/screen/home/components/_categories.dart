import 'package:flutter/material.dart';

Row section(title, VoidCallback onSeeMore) {
  return Row(
    children: [
      Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      Spacer(),
      InkWell(
        onTap: onSeeMore,
        child: Icon(Icons.arrow_forward),
      )
    ],
  );
}
