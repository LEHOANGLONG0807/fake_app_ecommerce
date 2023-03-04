import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/screen/home/home_page.dart';
import 'package:get/get.dart';

class PaymentSuccess extends StatelessWidget {
  const PaymentSuccess({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _theme = Theme.of(context);
    return Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/checkout_success.png',
              package: 'flutter_ecommerce_app',
              width: 150,
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 50,
                left: 30,
                right: 30,
              ),
              child: Text('Thành công!', style: _theme.textTheme.headline4),
            ),
            Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'Đơn đặt hàng của bạn sẽ được giao sớm. Cảm ơn bạn đã chọn ứng dụng của chúng tôi!',
                  style: _theme.textTheme.headline6.copyWith(fontWeight: FontWeight.normal),
                  textAlign: TextAlign.center,
                )),
            ElevatedButton(
              child: Text('Tiếp tục mua sắm'),
              onPressed: () {
                Get.offAll(HomePage());
              },
            ),
          ],
        ));
  }
}
