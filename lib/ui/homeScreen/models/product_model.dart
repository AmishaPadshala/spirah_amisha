class ProductModel {
  final int productId, price;
  final String productName, category;

  ProductModel(
      {required this.productId,
      required this.price,
      required this.productName,
      required this.category});
  factory ProductModel.fromJson(Map<String, dynamic> map) {
    return ProductModel(
        productId: map["productId"] ?? 0,
        price: map["price"] ?? 0,
        productName: map["productName"] ?? "",
        category: map["category"] ?? "");
  }
}
