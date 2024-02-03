import 'dart:developer';

import 'package:block_cubit/apiclient.dart';
import 'package:block_cubit/model/productmodel.dart';

class ProductsRepo {
  ProductModel productModel = ProductModel();

  getProduct() async {
    log(" -----?? repo called");
    productModel = await ApiClient().getProducts();
  }
}
