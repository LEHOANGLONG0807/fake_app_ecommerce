import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/constant.dart';
import 'package:flutter_ecommerce_app/helper/_utils.dart';
import 'package:flutter_ecommerce_app/models/Product.dart';
import 'package:google_fonts/google_fonts.dart';
import '_card_img.dart';
import 'package:get/get.dart';
import 'package:flutter_ecommerce_app/main.dart';

class ItemCart extends StatefulWidget {
  final ProductInCart product;
  final VoidCallback onTap;
  final VoidCallback onChanged;
  final bool isAddRemove;

  const ItemCart({Key key, this.product, this.onTap, this.onChanged, this.isAddRemove = true})
      : super(key: key);

  @override
  _ItemCartState createState() => _ItemCartState();
}

class _ItemCartState extends State<ItemCart> {
  final _quantity = 0.obs;

  AppController get _appCtrl => Get.find();

  @override
  void initState() {
    _quantity.value = widget.product.quantity;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Card(
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                cardImage(widget.product.product),
                SizedBox(width: kSpace),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.product.product.title,
                        style: GoogleFonts.ptSans(fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: kSpace),
                      _cartPriceDescriptionRightToImg(widget.product),
                    ],
                  ),
                )
              ],
            ),
            Divider(color: Colors.grey),
            Padding(
              padding: EdgeInsets.all(kSpace),
              child: _viewTotalPrice(widget.product),
            )
          ],
        ),
      ),
    );
  }

  Widget _cartPriceDescriptionRightToImg(ProductInCart productInCart) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "${productInCart.product.price.formatCurrencyNoName}",
          style: GoogleFonts.ptSans(fontSize: 16),
        ),
        SizedBox(height: kSpace),
        if (widget.isAddRemove)
          Obx(() {
            return Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                InkWell(
                  onTap: _quantity.value > 0
                      ? () {
                          _appCtrl.onRemoveProduct(widget.product.product);
                          _quantity.value = _quantity.value - 1;
                          widget.onChanged?.call();
                        }
                      : null,
                  child: Icon(
                    Icons.remove_circle,
                    color: _quantity.value > 0 ? Colors.black : Colors.grey,
                  ),
                ),
                SizedBox(width: kSpace),
                Text(_quantity.value.toString(), style: mediumText),
                SizedBox(width: kSpace),
                InkWell(
                    onTap: () {
                      _quantity.value = _quantity.value + 1;
                      _appCtrl.onAddProduct(widget.product.product);
                      widget.onChanged?.call();
                    },
                    child: Icon(Icons.add_circle)),
              ],
            );
          })
        else
          Text('Số lượng: ${_quantity.value.toString()}', style: mediumText),
      ],
    );
  }

  Row _viewTotalPrice(ProductInCart product) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Tổng tiền: ",
          style: mediumText,
        ),
        Obx(() {
          return Text(
            '${(product.product.price * _quantity.value).formatCurrencyNoName}',
            style: GoogleFonts.ptSans(fontSize: 18, fontWeight: FontWeight.w600),
          );
        }),
      ],
    );
  }
}
