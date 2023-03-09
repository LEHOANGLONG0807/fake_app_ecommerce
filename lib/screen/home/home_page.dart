import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/screen/home/components/_body.dart';
import '../../main.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  final controller = Get.put(AppController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: detailBody(context),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   child: Icon(CupertinoIcons.phone),
      //   onPressed: () async {
      //     final url = 'tel: 0986562117';
      //     if (await canLaunch(url)) {
      //       launch(url);
      //     }
      //   },
      // ),
    );
  }
}
