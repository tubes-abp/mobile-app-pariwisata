import 'dart:convert';

import 'package:wesata_mobile/models/product.dart';
import 'package:wesata_mobile/models/shop.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ShopProvider extends ChangeNotifier {
  Future<List<Shop>> getShopList() async {
    var result = await http.get(
      Uri.parse('https://api-abp.bagas3.my.id/public/shops'),
    );

    if (result.statusCode == 200) {
      var data = jsonDecode(result.body)['data'] as List;

      List<Shop> spaceList = data.map((item) => Shop.fromJson(item)).toList();

      return spaceList;
    } else {
      return <Shop>[];
    }
  }

  Future<List<Product>> getProductListByShopID(int shopID) async {
    var result = await http.get(
      Uri.parse('https://api-abp.bagas3.my.id/public/products/$shopID'),
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
}
