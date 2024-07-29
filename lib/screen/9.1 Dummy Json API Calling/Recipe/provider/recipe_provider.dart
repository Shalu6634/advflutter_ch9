import 'package:flutter/cupertino.dart';

import '../api_helper/recipe_api_helper.dart';
import '../modal/recipe_modal.dart';

class RecipeProvider extends ChangeNotifier {
  RecipeApiHelper recipeApiHelper = RecipeApiHelper();
  RecipeModal? recipeModal;

  String search = '';

  Future<RecipeModal?> fromMap() async {
    try {
      final data = await recipeApiHelper.Recipe_Api_Calling();
      if (data.isNotEmpty) {
        recipeModal = RecipeModal.fromJson(data);
        notifyListeners();
        return recipeModal;
      } else {
        throw Exception('No data received from API');
      }
    } catch (e) {
      print('Error in fromMap: $e');
      return null;
    }
  }

}