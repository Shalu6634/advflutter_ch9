import 'package:flutter/cupertino.dart';

import '../../../9.2 Call Pixabay API & Represent in UI/search_api/modal/all_api_modal.dart';
import '../api_helper/recipe_api_helper.dart';

class RecipeProvider extends ChangeNotifier
{
  RecipeApiHelper apiHelper = RecipeApiHelper();
  PixabayModal? recipeModal;

  Future<PixabayModal?> fromMap()
  async {
    final data = await apiHelper.Recipe_Api_Calling();
    recipeModal = PixabayModal.fromMap(data);
    notifyListeners();
    return recipeModal;

  }

}