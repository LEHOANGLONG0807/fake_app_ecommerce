import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/models/Product.dart';
import 'package:get/get.dart';

import '../../detail_voucher.dart';

class ItemVoucher extends StatelessWidget {
  final VoucherModel model;
  const ItemVoucher({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.to(() => DetailVoucherPage(model));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 4),
        width: double.infinity,
        height: 50,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 2),
              blurRadius: 5,
              color: Colors.grey.shade300,
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              width: 5,
              height: 80,
              color: Get.theme.primaryColor,
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(model.name, style: Get.textTheme.subtitle2),
                  const SizedBox(height: 5),
                  Text(
                    'HSD: ${model.hsd}',
                    style: Get.textTheme.overline.copyWith(color: Colors.grey.shade400),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              width: 1,
              height: double.infinity,
              color: Colors.grey.shade200,
            ),
            SizedBox(
              width: 80,
              child: Text(
                model.code,
                style: Get.textTheme.caption.copyWith(color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            )
          ],
        ),
      ),
    );
  }
}
