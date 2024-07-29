
import 'package:flutter/material.dart';
import '../api_helper/product_api_helper.dart';
import '../modal/product_modal.dart';

class ProductProvider extends ChangeNotifier {
  ProductApiHelper productApiHelper = ProductApiHelper();
   ProductModal? productModal;

  Future<ProductModal?> jsonParsing() async {
    final data = await productApiHelper.productApiCalling();
    productModal = ProductModal.fromJson(data) ;
    print('==================================================');
    return productModal;
  }

  ProductProvider()
  {
    jsonParsing();
  }


}


// import 'package:flutter/cupertino.dart';
//
// import '../../../9.2 Call Pixabay API/modal/api_modal.dart';
// import '../Product_api_helper/Product_api_helper.dart';
//
// class ProductProvider extends ChangeNotifier
// {
//   ProductApiHelper apiHelper = ProductApiHelper();
//   PixabayModal? productModal;
//
//   Future<PixabayModal?> fromMap()
//   async {
//     final data = await apiHelper.Product_Api_Calling();
//     productModal = PixabayModal.fromMap(data);
//     notifyListeners();
//     return productModal;
//
//   }

// }