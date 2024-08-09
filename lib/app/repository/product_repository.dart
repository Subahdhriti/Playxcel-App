import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:playxcel_app/app/models/product_details_model.dart';
import 'package:playxcel_app/app/models/product_list_response.dart';
import 'package:playxcel_app/constants.dart';

Future<ProductList> fetchProducts(String categoryId, String token) async {
  final response = await http.post(Uri.parse(productListUrl),
        headers: {
            'Content-Type': 'application/json',
            'customerHash' : token
        },
        body: jsonEncode(<String, String>{
          'categoryId': categoryId,
        }
      ));

  if (response.statusCode == 200) {
    Map<String, dynamic>  jsonResponse = json.decode(response.body);
    return ProductList.fromJson(jsonResponse);
  } else {
    throw Exception('Failed to load products');
  }
  
}


Future<ProductDetails> fetchProductDetails(String productId, String token) async {
  final response = await http.post(Uri.parse(productDetailsUrl),
        headers: {
            'Content-Type': 'application/json',
            'customerHash' : token
        },
        body: jsonEncode(<String, String>{
          'itemId': productId,
        }
      ));

  if (response.statusCode == 200) {
    Map<String, dynamic>  jsonResponse = json.decode(response.body);
    return ProductDetails.fromJson(jsonResponse);
  } else {
    throw Exception('Failed to load product detail');
  }
  
}