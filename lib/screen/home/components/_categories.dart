import 'package:flutter/material.dart';

Row section(title, VoidCallback onSeeMore,{bool isSeeMore=true}) {
  return Row(
    children: [
      Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
      ),
      Spacer(),
    if(isSeeMore)  InkWell(
        onTap: onSeeMore,
        child: Icon(Icons.arrow_forward),
      )
    ],
  );
}
