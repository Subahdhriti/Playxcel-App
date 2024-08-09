
import 'package:playxcel_app/app/models/product_model.dart';

class ProductList {
  final List<Product> productList; 
  final int page; 
  final int totalItems;

  ProductList(
    {
      required this.productList,
      required this.page,
      required this.totalItems
    }
  );

factory ProductList.fromJson(Map<String, dynamic> json) {
    var listJson = json['itemList'] as List;
    List<Product> productList = listJson.map((product) => Product.fromJson(product)).toList();

    return ProductList(
      productList: productList,
      page: (json['page'] ?? 0),
      totalItems: json['totalItems']
    );
  }

} 