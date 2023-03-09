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
import 'widget_voucher.dart';

Widget detailBody(BuildContext context) {
  final voucher = Res.getVoucher();
  return Column(
    children: [
      buildActionBar(),
      SizedBox(height: kSpace),
      Expanded(
        child: ListView(
          children: [
            SizedBox(height: kSpace),
            CarouselSlider(
                items: banner
                    .map((e) => Image.network(
                          e,
                          fit: BoxFit.cover,
                        ))
                    .toList(),
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
            InkWell(
              onTap: () {
                final list = Res.productsSale();
                list.removeWhere((element) => element.sale == 30);
                Get.to(() => AllProductScreen(
                      title: 'Giảm giá 20%',
                      products: list,
                    ));
              },
              child: Container(
                width: double.infinity,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            'https://trangnguyensport.com/wp-content/uploads/2019/03/1920x-450px-20_master.jpg'))),
              ),
            ),
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
            SizedBox(height: kSpace),
            section('Chương trình khuyến mãi', () {}, isSeeMore: false),
            SizedBox(height: kSpace),
            ...voucher.map(
              (e) => ItemVoucher(model: e),
            ),
            SizedBox(height: kSpace),
            InkWell(
              onTap: () {
                final list = Res.productsSale();
                list.removeWhere((element) => element.sale == 20);
                Get.to(() => AllProductScreen(
                      title: 'Giảm giá 30%',
                      products: list,
                    ));
              },
              child: Image.network(
                  'https://png.pngtree.com/png-vector/20220910/ourmid/pngtree-30-off-limited-time-offer-sale-banner-png-image_6161227.png'),
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
  'https://sudospaces.com/phedecor-com/2021/11/banner-1.jpg',
  'https://noithattoandien.vn/wp-content/uploads/2017/10/BANNER-SOFA-YT-300x159.jpg',
  'https://media.licdn.com/dms/image/C5112AQEuBbMyZPTueA/article-cover_image-shrink_720_1280/0/1520193021149?e=2147483647&v=beta&t=UzWwiJhDMKv-QwWbhynhEv14t8FEGiECes7mwbk2jK0'
];
