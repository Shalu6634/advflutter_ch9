import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../9.2 Call Pixabay API & Represent in UI/search_api/modal/all_api_modal.dart';
import '../api_helper/product_api_helper.dart';

class ProductProvider extends ChangeNotifier {
  ProductApiHelper apiHelper = ProductApiHelper();
  PixabayModal? productModal;

  Future<PixabayModal?> jsonParsing() async {
    final data = await apiHelper.productApiCalling();
    productModal = PixabayModal.fromMap(data) ;
    notifyListeners();
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