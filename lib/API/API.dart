import 'package:dio/dio.dart';
import 'package:h_store/models/productModel.dart';

class API {
  Future<List<Products>> getProductByCategory(categoryName) async {
    final dio = Dio();
    List<Products> result = [];
    final response =
        await dio.get('https://dummyjson.com/products/category/$categoryName');

    if (response.statusCode == 200) {
      List<dynamic> jsonData = response.data['products'];

      Products product;
      for (var e in jsonData) {
        product = Products.fromJson(e);
        result.add(product);
      }

    }else {
      print("Error in API ");
    }
    return result;
  }

  Future<List<Products>> getProduct() async {
    List<Products> products = [];
    int currentPage = 1;
    int totalPages = 4; // Assuming 4 pages with 30 products each
    List<Products> result = [];
    final dio = Dio();
    final response = await dio.get('https://dummyjson.com/products?limit=100');

    if (response.statusCode == 200) {
      final dio = Dio();

      List<dynamic> jsonData = response.data['products'];
      Products product;
      for (var e in jsonData) {
        product = Products.fromJson(e);
        result.add(product);
      }
    }else {
      print("Error in API ");
    }
    return result;
  }
}

