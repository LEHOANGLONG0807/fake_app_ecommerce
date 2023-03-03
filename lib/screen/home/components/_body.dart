import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/models/_res_files.dart';
import 'package:get/get.dart';
import '../../../constant.dart';
import '../../../models/Product.dart';
import '../../all_product_screen.dart';
import '_action_bar.dart';
import '_categories.dart';
import '_product_category.dart';
import '_search_filter_view.dart';

Widget detailBody(BuildContext context) {
  return Column(
    children: [
      buildActionBar(),
      SizedBox(height: kSpace),
      Expanded(
        child: ListView(
          children: [
            SizedBox(height: kSpace),
            CarouselSlider(
                items: banner.map((e) => Image.network(e,fit: BoxFit.cover,)).toList(),
                options: CarouselOptions(
                  height: 180,
                  aspectRatio: 16 / 9,
                  viewportFraction: 1,
                  initialPage: 0,
                  enableInfiniteScroll: true,
                  reverse: false,
                  autoPlay: true,
                  autoPlayInterval: Duration(seconds: 3),
                  autoPlayAnimationDuration: Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                )),
            SizedBox(height: kSpace),
            section('Thể loại', () {
              final list = Res.products();
              Get.to(() => AllProductScreen(
                    title: 'Sản phẩm',
                    products: list,
                  ));
            }),
            SizedBox(height: kSpace),
            Container(
              height: 140,
              child: category(),
            ),
            SizedBox(height: kSpace),
            section('Sản phẩm nổi bật', () {
              final list = Res.products();
              Get.to(() => AllProductScreen(
                    title: 'Sản phẩm',
                    products: list,
                  ));
            }),
            SizedBox(height: kSpace),
            mostPopularCategory(context)
          ],
        ),
      ),
    ],
  );
}

const banner = [
  'https://induongquang.com/data/upload/banner-noi-that.jpg',
  'https://sudospaces.com/phedecor-com/2021/11/banner-1.jpg',
  'https://media.licdn.com/dms/image/C5112AQEuBbMyZPTueA/article-cover_image-shrink_720_1280/0/1520193021149?e=2147483647&v=beta&t=UzWwiJhDMKv-QwWbhynhEv14t8FEGiECes7mwbk2jK0'
];
