import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/components/_close_activity.dart';
import 'package:flutter_ecommerce_app/helper/_utils.dart';
import 'package:flutter_ecommerce_app/main.dart';
import 'package:flutter_ecommerce_app/models/Product.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

import '../constant.dart';
import 'payment_screen.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  AppController get _appCtrl => Get.find();

  final _orders = <ProductOrder>[].obs;

  @override
  void initState() {
    _orders.addAll(_appCtrl.orders);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        elevation: 0,
        leading: closeActivity(),
        title: Text("Đơn hàng", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.grey.shade100,
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        child: Obx(() {
          if (_orders.isEmpty)
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(),
                Image.asset(
                  'assets/images/ic_empty.png',
                  width: 100,
                  color: Colors.grey.shade400,
                  package: 'flutter_ecommerce_app',
                ),
                const SizedBox(height: 10),
                Text('Không có dữ liệu'),
              ],
            );
          return ListView.builder(
            itemCount: _orders.length,
            itemBuilder: (context, index) {
              return ItemOrder(
                product: _orders[index],
                onTap: () async {
                  Get.to(() => PaymentPage(
                        _orders[index],
                        isEnable: false,
                      ));
                },
                onChanged: () {
                  _orders.clear();
                  _orders.addAll(_appCtrl.orders);
                },
              );
            },
          );
        }),
      ),
    );
  }
}

class ItemOrder extends StatefulWidget {
  final ProductOrder product;
  final VoidCallback onTap;
  final VoidCallback onChanged;

  const ItemOrder({Key key, this.product, this.onTap, this.onChanged}) : super(key: key);

  @override
  _ItemOrderState createState() => _ItemOrderState();
}

class _ItemOrderState extends State<ItemOrder> {
  AppController get _appCtrl => Get.find();

  @override
  void initState() {
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            Text(
              widget.product.id,
              style: GoogleFonts.ptSans(fontSize: 14, fontWeight: FontWeight.w500),
            ).paddingSymmetric(horizontal: 10),
            const SizedBox(height: 5),
            ...widget.product.products.map(
              (e) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    e.product.title,
                    style: GoogleFonts.ptSans(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    'Số lượng: ${e.quantity}',
                    style: GoogleFonts.ptSans(fontSize: 14, fontWeight: FontWeight.w500),
                  ),
                ],
              ).paddingOnly(bottom: 6, right: 10, left: 10),
            ),
            Divider(color: Colors.grey),
            Padding(
              padding: EdgeInsets.only(left: kSpace, right: kSpace, bottom: kSpace),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 6),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: widget.product.status == 1
                                ? Colors.blue.withOpacity(0.2)
                                : widget.product.status == 2
                                    ? Colors.green.withOpacity(0.2)
                                    : Colors.red.withOpacity(0.2)),
                        child: Text(
                          widget.product.status == 1
                              ? 'Chờ duyệt'
                              : widget.product.status == 2
                                  ? 'Hoàn thành'
                                  : 'Đã hủy',
                          style: GoogleFonts.ptSans(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: widget.product.status == 1
                                  ? Colors.blue
                                  : widget.product.status == 2
                                      ? Colors.green
                                      : Colors.red),
                        ),
                      ),
                      if (widget.product.status == 1)
                        TextButton(
                          onPressed: () {
                            _appCtrl.cancelOrder(widget.product.id);
                            widget.onChanged?.call();
                          },
                          child: Text(
                            'Hủy',
                            style: GoogleFonts.ptSans(
                                fontSize: 14, fontWeight: FontWeight.w500, color: Colors.red),
                          ),
                        ),
                      const Spacer(),
                      Text(DateFormat('dd/mm/yyyy').format(widget.product.createdAt))
                    ],
                  ),
                  const SizedBox(height: 10),
                  _viewTotalPrice(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _viewTotalPrice() {
    num total = 0;
    widget.product.products.forEach((element) {
      total += element.product.price * element.quantity;
    });

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Tổng tiền: ",
          style: mediumText,
        ),
        Text(
          '${total.formatCurrencyNoName}',
          style: GoogleFonts.ptSans(fontSize: 18, fontWeight: FontWeight.w600),
        )
      ],
    );
  }
}
