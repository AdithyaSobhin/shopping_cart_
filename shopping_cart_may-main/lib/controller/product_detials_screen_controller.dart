import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_cart_may/model/product_list_res_model.dart';

class ProductDetialsScreenController with ChangeNotifier {
  ProductModel? productDetails;
  bool isLoading = false;

  Future<void> getProductDetails(String productId) async {
    final url = Uri.parse("https://fakestoreapi.com/products/$productId");
    isLoading = true;
    notifyListeners();
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        productDetails = singleProductModelFromJson(response.body);
      }
    } catch (e) {
      print(e);
    }
    isLoading = false;
    notifyListeners();
  }
}
