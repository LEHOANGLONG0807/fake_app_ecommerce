import 'package:charts_flutter/flutter.dart' as chart;
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/helper/_utils.dart';
import 'package:get/get.dart';
import '../../models/Product.dart';
import '../../models/_res_files.dart';
import '../home/components/_build_category_card.dart';
import 'component/_build_app_bar.dart';
import 'package:flutter_ecommerce_app/main.dart';
import '../../constant.dart';
import 'component/_image_view.dart';

class ProductDetail extends StatefulWidget {
  ProductDetail({Key key, this.product, this.isAddRemove = true}) : super(key: key);
  final bool isAddRemove;
  final Product product;

  @override
  _ProductDetailState createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  List<Product> _suggests = [];

  final _quantity = 0.obs;

  AppController get _appCtrl => Get.find();

  @override
  void initState() {
    _quantity.value = _appCtrl.getQuantity(widget.product);
    final products = Res.products();
    products.forEach((element) {
      if (element.tag == widget.product.tag && element.title != widget.product.title) {
        _suggests.add(element);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: detailAppBar(widget.product, () {
        _quantity.value = _appCtrl.getQuantity(widget.product);
      }),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                ShowImages(product: widget.product),
                SizedBox(height: kSpace),
                SizedBox(height: kSpace),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (widget.product.sale != null)
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                        color: Colors.red,
                        child: Text(
                          'Giảm ${widget.product.sale}%  ',
                          style: Get.textTheme.bodyText2
                              .copyWith(fontWeight: FontWeight.w500, color: Colors.white),
                        ),
                      ),
                    SizedBox(height: kSpace),
                    Text(
                      "${widget.product.title}",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: kSpace),
                    if (widget.product.sale != null)
                      Text(
                        '${(widget.product.price * (100 + widget.product.sale) / 100).formatCurrencyNoName}',
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Colors.grey,
                            decoration: TextDecoration.lineThrough),
                      ),
                    Text(
                      "${widget.product.price.formatCurrencyNoName}",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Get.theme.primaryColor,
                      ),
                    ),
                    SizedBox(height: kSpace),
                    SizedBox(height: kSpace),
                    SizedBox(height: kSpace),
                    Text(
                      widget.product.info,
                      textAlign: TextAlign.justify,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 16.0, color: Colors.black),
                      maxLines: 5,
                    ),
                    SizedBox(height: 20),
                    Text(
                      widget.product.description,
                      textAlign: TextAlign.justify,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 16.0, color: Colors.black),
                      maxLines: 5,
                    ),
                    const Divider(),
                    SizedBox(height: 20),
                    Center(
                      child: Column(
                        children: [
                          Text(
                            "Biểu đồ giá",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            "(  Đơn vị : Triệu VNĐ / tháng )",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    _buildChart(),
                    const Divider(),
                    SizedBox(height: 20),
                    Text(
                      "Gợi ý",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 10),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: _suggests
                            .map((e) => GestureDetector(
                                onTap: () {
                                  Get.to(ProductDetail(product: e), preventDuplicates: false);
                                },
                                child: buildCard(e).paddingOnly(right: 10)))
                            .toList(),
                      ),
                    )
                  ],
                ).paddingSymmetric(horizontal: 16),
              ],
            ),
          ),
          SizedBox(height: 10),
          if (widget.isAddRemove)
            Obx(() {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(width: 20),
                  if (_quantity.value > 0)
                    Expanded(
                      child: Text(
                        '${(widget.product.price * _quantity.value).formatCurrencyNoName}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Get.theme.primaryColor,
                        ),
                      ).paddingOnly(right: 20),
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: _quantity.value > 0
                            ? () {
                                _quantity.value = _quantity.value - 1;
                                _appCtrl.onRemoveProduct(widget.product);
                              }
                            : null,
                        child: Icon(
                          Icons.remove_circle,
                          color: _quantity.value > 0 ? Colors.black : Colors.grey,
                        ),
                      ),
                      SizedBox(width: 30),
                      Text(_quantity.value.toString(), style: mediumText),
                      SizedBox(width: 30),
                      InkWell(
                          onTap: () {
                            _quantity.value = _quantity.value + 1;
                            _appCtrl.onAddProduct(widget.product);
                          },
                          child: Icon(Icons.add_circle)),
                    ],
                  ),
                  const SizedBox(width: 30),
                ],
              );
            }),
          SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _buildChart() {
    List<chart.Series<ProductPriceSeries, String>> series = [
      chart.Series(
        id: "Price",
        data: widget.product.getPriceSeries,
        domainFn: (ProductPriceSeries series, _) => series.month,
        measureFn: (ProductPriceSeries series, _) => series.price / 1000000,
        colorFn: (ProductPriceSeries series, _) =>
            chart.ColorUtil.fromDartColor(Get.theme.primaryColor),
      ),
    ];
    return SizedBox(
      height: 300,
      width: 400,
      child: chart.BarChart(
        series,
        animate: true,
      ),
    );
  }
}
