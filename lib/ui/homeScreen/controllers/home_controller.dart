import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:spirah/core/constants/app_assets.dart';
import 'package:spirah/ui/homeScreen/models/product_filter_model.dart';
import 'package:spirah/ui/homeScreen/models/product_model.dart';


class HomeController extends GetxController {
  late bool isNext;

  reset(){
    isNext = true;
  }

  Future<List<ProductFilterModel>> loadJsonFile(int offset) async {
    if (offset == 0) reset();
    if (isNext == false) return [];
    List<ProductModel> productList = [];
    var jsonText = await rootBundle.loadString(AppJson.jsonFile);

    List data = json.decode(jsonText);
    data.forEach((element) {
      ProductModel productModel = ProductModel.fromJson(element);
      productList.add(productModel);
    });
    Map<String, List<ProductModel>> category = {};
    productList.forEach((element) {
      if (category[element.category] == null) category[element.category] = [];
      category[element.category]!.add(element);
    });
    List<ProductFilterModel> productFilter = category.entries
        .map((e) => ProductFilterModel(name: e.key, productModel: e.value))
        .toList();
    isNext = false;
    return productFilter;
  }
}
