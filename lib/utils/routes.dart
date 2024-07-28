import 'package:flutter/material.dart';

import '../screen/9.1 Dummy Json API Calling/Product/view/product_screen.dart';
import '../screen/9.2 Call Pixabay API & Represent in UI/search_api/view/homeScreen.dart';

class AppRoutes
{
  static Map<String, Widget Function(BuildContext)> routes = {
    '/':(context) =>  RecipePage(),

  };
}
