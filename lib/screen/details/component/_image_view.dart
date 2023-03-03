import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../models/Product.dart';

class ShowImages extends StatefulWidget {
  final Product product;
  const ShowImages({Key key, this.product}) : super(key: key);

  @override
  _ShowImagesState createState() => _ShowImagesState();
}

class _ShowImagesState extends State<ShowImages> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 250,
          width: double.infinity,
          color: widget.product.color,
          child: PageView(
            children: widget.product.images
                .map(
                  (e) => Image.network(
                    e,
                    alignment: Alignment.centerRight,
                    width: double.infinity,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                )
                .toList(),
            onPageChanged: (index){
              setState(() {
                _index=index;
              });
            },
          ),
        ),
        const SizedBox(height: 10),
        _buildRowIndicator(),
      ],
    );
  }

  Widget _buildRowIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: widget.product.images
          .asMap()
          .keys
          .map(
            (e) => Container(
              margin: EdgeInsets.symmetric(horizontal: 3),
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _index == e ? Get.theme.primaryColor : Colors.grey),
            ),
          )
          .toList(),
    );
  }
}
