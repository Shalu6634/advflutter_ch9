
import 'package:flutter/cupertino.dart';
import '../api_helper/recipe_api_helper.dart';
import '../modal/Recipe_modal.dart';
class RecipeProvider extends ChangeNotifier
{
  RecipeApiHelper apiHelper = RecipeApiHelper();
  RecipeModal? recipeModal;

  Future<RecipeModal?> fromJsonData()
  async {
    final data = await apiHelper.Recipe_Api_Calling();
    recipeModal = RecipeModal.fromJson(data);
    notifyListeners();
    return recipeModal;

  }

}
