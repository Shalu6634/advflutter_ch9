import 'package:advflutter_ch9/screen/9.1%20Dummy%20Json%20API%20Calling/Product/provider/product_provider.dart';
import 'package:advflutter_ch9/screen/9.1%20Dummy%20Json%20API%20Calling/Recipe/Provider/Recipe_provider.dart';
import 'package:advflutter_ch9/screen/9.2%20Call%20Pixabay%20API%20&%20Represent%20in%20UI/search_api/provider/PixabayApiProvider.dart';
import 'package:advflutter_ch9/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => RecipeProvider(),
        ), ChangeNotifierProvider(
          create: (context) => PixabayProvider(),
        ),
      ],
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: AppRoutes.routes,
      ),
    ),
  );
}


