import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_ecommerce_app/components/_close_activity.dart';
import 'package:flutter_ecommerce_app/models/Product.dart';

class DetailVoucherPage extends StatefulWidget {
  final VoucherModel model;

  DetailVoucherPage(this.model);

  @override
  _DetailVoucherPageState createState() => _DetailVoucherPageState();
}

class _DetailVoucherPageState extends State<DetailVoucherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        leading: closeActivity(),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image.asset(
                'assets/images/sale.png',
                width: double.infinity,
                package: 'flutter_ecommerce_app',
                fit: BoxFit.cover,
                height: 220,
              ).paddingOnly(bottom: 60),
              Container(
                width: double.infinity,
                height: 120,
                margin: EdgeInsets.symmetric(horizontal: 30),
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 1),
                      blurRadius: 5,
                      color: Colors.grey.shade300,
                    ),
                  ],
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Get.theme.primaryColor,
                      ),
                      child: Text(
                        widget.model.code,
                        style: Get.textTheme.caption
                            .copyWith(fontWeight: FontWeight.w500, color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.model.name,
                      style: Get.textTheme.bodyText2.copyWith(fontWeight: FontWeight.w600),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Hạn sử dụng: ${widget.model.hsd}',
                      style: Get.textTheme.overline.copyWith(color: Colors.grey.shade500),
                    ),
                  ],
                ),
              )
            ],
          ),
          const Divider(height: 60),
          Text(
            widget.model.desc,
            style: Get.textTheme.bodyText2.copyWith(color: Colors.grey.shade700),
          ).paddingSymmetric(horizontal: 30),
        ],
      ),
    );
  }
}
