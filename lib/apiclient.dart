import 'dart:developer';

import 'package:block_cubit/model/productmodel.dart';
import 'package:dio/dio.dart';

class ApiClient {
  final dio = Dio();
  // Future<ListUserModel> userList() async {
  //   ListUserModel listUserModel;
  //   Response response = await dio.get("https://reqres.in/api/users?page=2");
  //   listUserModel = ListUserModel.fromJson(response.data);
  //   log("listUserModel = ${listUserModel.toJson()}");
  //   return listUserModel;
  // }

  Future<ProductModel> getProducts() async {
    ProductModel productModel;
    Response response = await dio.get("https://fakestoreapi.com/products");
    log(" api client start-----?? ");
    if (response.statusCode == 200) {
      productModel = ProductModel.fromJson(response.data);
      log("productModel -----?? $productModel");
      return productModel;
    } else {
      throw Exception("Failed To Load Products");
    }
  }
}
