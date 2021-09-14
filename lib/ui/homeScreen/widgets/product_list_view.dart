import 'package:flutter/material.dart';
import 'package:pagination_view/pagination_view.dart';
import 'package:spirah/core/utils/globals.dart';
import 'package:spirah/core/utils/size_config.dart';
import 'package:spirah/ui/homeScreen/models/product_model.dart';
import 'package:get/get.dart';
import 'package:spirah/core/extensions/app_color_extension.dart';

class ProductListView extends StatelessWidget {
  final List<ProductModel> products;
  late bool isNext;

  ProductListView({Key? key, required this.products}) : super(key: key);

  reset(){
    isNext = true;
  }

  Future<List<ProductModel>> getProducts(int offset) async {
    if (offset == 0) reset();
    if (isNext == false) return [];
    isNext = false;
    return Future.delayed(Duration(milliseconds: 100),(){
      return products;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height:getProportionateScreenWidth(160),
      child: PaginationView<ProductModel>(
        pullToRefresh: true,
        initialLoader: Center(child: CircularProgressIndicator()),
        paginationViewType:PaginationViewType.listView,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.only(bottom: 5, left: 15, right: 15),
        onError: (error) {
          return Center(child: Text('error'.tr));
        },
        pageFetch: getProducts,
        itemBuilder: (BuildContext context,
            ProductModel productModel, int index) {
          return Container(
            margin: EdgeInsets.only(
              right: index == products.length - 1 ? 0 : 15,
            ),
            width: getProportionateScreenWidth(125),
            decoration: BoxDecoration(
              color: appColor.appColor,
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    blurRadius: 5.0,
                    spreadRadius: 1.0,
                    offset: Offset(0, 2))
              ],
              borderRadius: BorderRadius.circular(7),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    products[index].productName,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    softWrap: true,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    currencyFormat.format(products[index].price),
                    style: TextStyle(
                      color: appColor.textBlueColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        onEmpty: Center(child: Text('noProductFound'.tr),),
      ),
    );

    // return SizedBox(
    //     height: 160,
    //     child: ListView.builder(
    //       physics: BouncingScrollPhysics(),
    //       itemCount: productModel.length,
    //       clipBehavior: Clip.none,
    //       padding: EdgeInsets.symmetric(horizontal: 15),
    //       scrollDirection: Axis.horizontal,
    //       itemBuilder: (context, index) {
    //         return Container(
    //           margin: EdgeInsets.only(
    //             right: index == productModel.length - 1 ? 0 : 15,
    //           ),
    //           width: 125,
    //           decoration: BoxDecoration(
    //             color: Colors.orange.shade100,
    //             boxShadow: [
    //               BoxShadow(
    //                   color: Colors.grey.withOpacity(0.5),
    //                   blurRadius: 5.0,
    //                   spreadRadius: 1.0,
    //                   offset: Offset(0, 2))
    //             ],
    //             borderRadius: BorderRadius.circular(7),
    //           ),
    //           alignment: Alignment.centerLeft,
    //           child: Padding(
    //             padding: const EdgeInsets.all(10.0),
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               mainAxisAlignment: MainAxisAlignment.end,
    //               children: [
    //                 Text(
    //                   productModel[index].productName,
    //                   style: TextStyle(
    //                     fontSize: 13,
    //                     fontWeight: FontWeight.w600,
    //                   ),
    //                 ),
    //                 SizedBox(
    //                   height: 5,
    //                 ),
    //                 Text(
    //                   currencyFormat.format(productModel[index].price),
    //                   style: TextStyle(
    //                     fontSize: 13,
    //                     color: Colors.blue,
    //                     fontWeight: FontWeight.w600,
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         );
    //       },
    //     ));
  }
}
