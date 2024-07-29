import 'package:flutter/material.dart';


import '../screen/9.2 Call Pixabay API & Represent in UI/search_api/view/PixabayApiScreen.dart';
import '../screen/Dummy_Json_API_Calling/Product/view/product_screen.dart';
import '../screen/Dummy_Json_API_Calling/Recipe/view/Recipe_screen.dart';
import '../screen/Dummy_Json_API_Calling/Recipe/view/detailPage.dart';

class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    '/': (context) => RecipePage(),
    '/d': (context) => PixabayApi(),
    '/pixa': (context) => ProductPage(),
    '/detail': (context) => DetailPage(),
  };
}
