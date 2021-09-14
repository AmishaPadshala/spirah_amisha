import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pagination_view/pagination_view.dart';
import 'package:spirah/ui/homeScreen/widgets/product_list_view.dart';

import 'controllers/home_controller.dart';
import 'models/product_filter_model.dart';
import 'widgets/category_title_view.dart';

class HomeScreen extends StatefulWidget {

  static const String routeName = "/homeScreen";

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('products'.tr)
      ),
      body: Column(
        children: [
          Expanded(
            child: PaginationView<ProductFilterModel>(
                pullToRefresh: true,
                initialLoader: Center(child: CircularProgressIndicator()),
                paginationViewType:PaginationViewType.listView,
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.only(bottom: 20),
                onError: (error) {
                  return Center(child: Text('error'.tr));
                },
                pageFetch: homeController.loadJsonFile,
                itemBuilder: (BuildContext context,
                    ProductFilterModel productFilterModel, int index) {
                  return Column(
                    children: [
                      CategoryTitleView(title: productFilterModel.name),
                      ProductListView(products: productFilterModel.productModel),
                    ],
                  );
                },
                onEmpty: Center(child: Text('noProductFound'.tr),),
            ),
          ),
        ],
      ),
    );
  }

}
