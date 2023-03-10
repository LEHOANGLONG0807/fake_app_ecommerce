import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/components/_close_activity.dart';
import 'package:flutter_ecommerce_app/main.dart';
import 'package:flutter_ecommerce_app/models/Product.dart';
import 'package:flutter_ecommerce_app/models/_res_files.dart';
import 'package:flutter_ecommerce_app/screen/details/detail_page.dart';
import 'package:flutter_ecommerce_app/screen/payment_success.dart';
import 'package:get/get.dart';

import 'cart/components/_item_cart_view.dart';

class PaymentPage extends StatefulWidget {
  final ProductOrder order;
  final bool isEnable;

  PaymentPage(this.order, {this.isEnable = true});

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  AppController get _appCtrl => Get.find();
  num _totalAmount = 0;

  final vouchers = Res.getVoucher();

  final _formKey = GlobalKey<FormState>();
  final _textNameCtrl = TextEditingController();

  final _textCode = TextEditingController();

  final _textEmailCtrl = TextEditingController();

  final _textPhoneCtrl = TextEditingController();

  final _textAddressCtrl = TextEditingController();

  VoucherModel _voucher;

  num _giamGia = 0;

  bool _isLoading = false;

  String _errorVoucher;

  @override
  void initState() {
    widget.order.products.forEach((element) {
      _totalAmount += element.quantity * element.product.price;
    });
    _textAddressCtrl.text = widget.order.address;
    _textEmailCtrl.text = widget.order.email;
    _textPhoneCtrl.text = widget.order.phone;
    _textNameCtrl.text = widget.order.name;
    super.initState();
  }

  void _searchCode() {
    VoucherModel voucher;
    vouchers.forEach((element) {
      if (element.code == _textCode.text) {
        voucher = element;
      }
    });
    if (voucher != null) {
      if (voucher.apply(widget.order.products) != null) {
        setState(() {
          _giamGia = voucher.apply(widget.order.products);
          _voucher = voucher;
        });
        return;
      }
    }
    setState(() {
      _errorVoucher = 'Khuy???n m??i kh??ng t???n t???i ho???c b???n kh??ng ????? ??i???u ki???n ??p d???ng';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        elevation: 0,
        leading: closeActivity(),
        title: Text(widget.isEnable ? "Thanh To??n" : '????n h??ng',
            style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.grey.shade100,
      ),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Expanded(
                    child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        Text(
                          'T???ng ti???n thanh to??n',
                          style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          (_totalAmount - _giamGia).formatCurrencyNoName,
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: Get.theme.primaryColor),
                        ),
                        const Divider(height: 40),
                        Text(
                          'Th??ng tin kh??ch h??ng',
                          style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('H??? t??n'),
                            const SizedBox(height: 5),
                            TextFormField(
                              controller: _textNameCtrl,
                              decoration: InputDecoration(
                                enabled: widget.isEnable,
                                prefixIcon:
                                    Icon(Icons.drive_file_rename_outline, color: Colors.grey),
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                border: OutlineInputBorder(
                                  gapPadding: 8,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                filled: true,
                                hintStyle: new TextStyle(color: Colors.grey),
                                hintText: "Nh???p h??? t??n",
                                fillColor: Colors.grey.shade200,
                              ),
                              validator: (val) {
                                if (val.trim().isEmpty) {
                                  return "Vui l??ng nh???p h??? t??n";
                                }
                                return null;
                              },
                            ),
                          ],
                        ).paddingSymmetric(horizontal: 10, vertical: 6),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Email'),
                            const SizedBox(height: 5),
                            TextFormField(
                              controller: _textEmailCtrl,
                              decoration: InputDecoration(
                                enabled: widget.isEnable,
                                prefixIcon: Icon(Icons.mail_outline, color: Colors.grey),
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                border: OutlineInputBorder(
                                  gapPadding: 8,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                filled: true,
                                hintStyle: new TextStyle(color: Colors.grey),
                                hintText: "Nh???p email",
                                fillColor: Colors.grey.shade200,
                              ),
                              keyboardType: TextInputType.emailAddress,
                              validator: (val) {
                                if (!GetUtils.isEmail(val)) {
                                  return "Vui l??ng nh???p email";
                                }
                                return null;
                              },
                            ),
                          ],
                        ).paddingSymmetric(horizontal: 10, vertical: 6),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('S??? ??i???n tho???i'),
                            const SizedBox(height: 5),
                            TextFormField(
                              controller: _textPhoneCtrl,
                              decoration: InputDecoration(
                                enabled: widget.isEnable,
                                prefixIcon: Icon(Icons.phone, color: Colors.grey),
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                border: OutlineInputBorder(
                                  gapPadding: 8,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                filled: true,
                                hintStyle: new TextStyle(color: Colors.grey),
                                hintText: "Nh???p s??? ??i???n tho???i",
                                fillColor: Colors.grey.shade200,
                              ),
                              keyboardType: TextInputType.phone,
                              validator: (val) {
                                if (!GetUtils.isPhoneNumber(val)) {
                                  return "Vui l??ng nh???p s??? ??i???n tho???i";
                                }
                                return null;
                              },
                            ),
                          ],
                        ).paddingSymmetric(horizontal: 10, vertical: 6),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('?????a ch???'),
                            const SizedBox(height: 5),
                            TextFormField(
                              controller: _textAddressCtrl,
                              decoration: InputDecoration(
                                enabled: widget.isEnable,
                                prefixIcon:
                                    Icon(Icons.add_location_alt_outlined, color: Colors.grey),
                                focusedBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                border: OutlineInputBorder(
                                  gapPadding: 8,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                filled: true,
                                hintStyle: new TextStyle(color: Colors.grey),
                                hintText: "Nh???p ?????a ch???",
                                fillColor: Colors.grey.shade200,
                              ),
                              validator: (val) {
                                if (val.trim().isEmpty) {
                                  return "Vui l??ng nh???p ?????a ch???";
                                }
                                return null;
                              },
                            ),
                          ],
                        ).paddingSymmetric(horizontal: 10, vertical: 6),
                        const Divider(height: 40),
                        Text(
                          'S???n ph???m ???? ch???n',
                          style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
                        ),
                        ListView.builder(
                          itemCount: widget.order.products.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            return ItemCart(
                              product: widget.order.products[index],
                              isAddRemove: false,
                              onTap: () async {
                                Get.to(ProductDetail(
                                  product: widget.order.products[index].product,
                                  isAddRemove: false,
                                ));
                              },
                            );
                          },
                        )
                      ],
                    ),
                  ),
                )),
                const SizedBox(height: 15),
                if (widget.isEnable)
                  SizedBox(
                    child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            _payment();
                          }
                        },
                        child: Text('Y??u c???u ?????t h??ng')),
                    width: double.infinity,
                  ).paddingSymmetric(horizontal: 50),
                const SizedBox(height: 15),
              ],
            ),
          ),
          if (_isLoading) Center(child: CircularProgressIndicator()),
        ],
      ),
    );
  }

  void _payment() {
    setState(() {
      _isLoading = true;
    });
    Future.delayed(2.seconds, () {
      final order = widget.order;
      order.name = _textNameCtrl.text;
      order.email = _textEmailCtrl.text;
      order.phone = _textPhoneCtrl.text;
      order.address = _textAddressCtrl.text;
      _appCtrl.addOrder(order);
      Get.offAll(() => PaymentSuccess());
      setState(() {
        _isLoading = false;
      });
    });
  }
}
