import 'package:advflutter_ch9/screen/9.2%20Call%20Pixabay%20API%20&%20Represent%20in%20UI/search_api/provider/PixabayApiProvider.dart';
import 'package:advflutter_ch9/screen/Dummy_Json_API_Calling/Product/provider/product_provider.dart';
import 'package:advflutter_ch9/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'screen/Dummy_Json_API_Calling/Recipe/provider/recipe_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => PixabayProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ProductProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => RecipeProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: AppRoutes.routes,
      ),
    ),
  );
}
