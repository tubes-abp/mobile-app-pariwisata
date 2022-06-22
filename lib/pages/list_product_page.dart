import 'dart:convert';

import 'package:provider/provider.dart';
import 'package:wesata_mobile/models/product.dart';
import 'package:wesata_mobile/models/shop.dart';
import 'package:wesata_mobile/providers/shop_provider.dart';
import 'package:wesata_mobile/theme.dart';
import 'package:flutter/material.dart';
import 'package:wesata_mobile/widgets/product_card.dart';
import 'package:http/http.dart' as http;

class ListProductPage extends StatefulWidget {
  final Shop shop;
  const ListProductPage(this.shop, {super.key});

  @override
  _ListProductPageState createState() => _ListProductPageState();
}

class _ListProductPageState extends State<ListProductPage> {
  List<bool> categoriesActive = [false, false];
  late Future _dataProduct;

  Future<List<Product>> getProductListByShopID(int shopID,
      [String type = ""]) async {
    String url = 'https://api-abp.bagas3.my.id/public/products/$shopID';
    if (type != "") {
      url =
          'https://api-abp.bagas3.my.id/public/products/$shopID?filter[type]=$type';
    }
    var result = await http.get(
      Uri.parse(url),
    );

    if (result.statusCode == 200) {
      var data = jsonDecode(result.body)['data'] as List;

      List<Product> productList =
          data.map((item) => Product.fromJson(item)).toList();

      return productList;
    } else {
      return <Product>[];
    }
  }

  @override
  void initState() {
    super.initState();
    // var shopProvider = Provider.of<ShopProvider>(context);
    _dataProduct = getProductListByShopID(widget.shop.id!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.only(top: edge, left: edge, bottom: edge),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // NOTE: TITLE/HEADER
              Text(
                "List Product Shop",
                style: blackTextStyle.copyWith(
                  fontSize: 24,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Categories: ${categoriesActive[0]}",
                    style: blackTextStyle,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 80,
                    height: 25,
                    child: ElevatedButton(
                      onPressed: () {
                        var type = "";
                        if (!categoriesActive[0]) {
                          type = "product";
                        }
                        categoriesActive[0] = !categoriesActive[0];
                        categoriesActive[1] = false;
                        setState(() {
                          categoriesActive;
                        });
                        _dataProduct =
                            getProductListByShopID(widget.shop.id!, type);
                      },
                      style: categoriesActive[0]
                          ? btnCategoriesActiveStyle
                          : btnCategoriesNonActiveStyle,
                      child: Text(
                        'Product',
                        style: categoriesActive[0]
                            ? whiteTextStyle.copyWith(
                                fontSize: 10,
                              )
                            : blueTextStyle.copyWith(
                                fontSize: 10,
                              ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 80,
                    height: 25,
                    child: ElevatedButton(
                      onPressed: () {
                        var type = "";
                        if (!categoriesActive[1]) {
                          type = "ticket";
                        }
                        categoriesActive[0] = false;
                        categoriesActive[1] = !categoriesActive[1];
                        setState(() {
                          categoriesActive;
                        });
                        _dataProduct =
                            getProductListByShopID(widget.shop.id!, type);
                      },
                      style: categoriesActive[1]
                          ? btnCategoriesActiveStyle
                          : btnCategoriesNonActiveStyle,
                      child: Text(
                        'Ticket',
                        style: categoriesActive[1]
                            ? whiteTextStyle.copyWith(
                                fontSize: 10,
                              )
                            : blueTextStyle.copyWith(
                                fontSize: 10,
                              ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              FutureBuilder(
                future: _dataProduct,
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    List<Product> data = snapshot.requireData;

                    return Column(
                      children: data.map((Product item) {
                        return Container(
                          child: ProductCard(item),
                        );
                      }).toList(),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
              SizedBox(
                height: edge,
              ),
              SizedBox(
                width: 120,
                height: 30,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: blueColor,
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: whiteColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(17)),
                  ),
                  label: Text(
                    'Back',
                    style: blueTextStyle.copyWith(
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
