class RecipeModal {
  late List<Recipe> recipes;
  late int total;
  late int skip;
  late int limit;

  RecipeModal({
    required this.recipes,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory RecipeModal.fromJson(Map m1) {
    return RecipeModal(
      recipes: (m1['recipes'] as List).map((e) =>Recipe.fromJson(e)).toList(),
      total: m1["total"],
      skip: m1["skip"],
      limit: m1["limit"],
    );
  }
}

class Recipe {
  late int id;
  late String name;
  late List ingredients;
  late List instructions;
  late int prepTimeMinutes;
  late int cookTimeMinutes;
  late int servings;
  late String cuisine;
  late int caloriesPerServing;
  late List tags;
  late int userId;
  late String image;



  Recipe({
    required this.id,
    required this.name,
    required this.ingredients,
    required this.instructions,
    required this.prepTimeMinutes,
    required this.cookTimeMinutes,
    required this.servings,
    required this.cuisine,
    required this.caloriesPerServing,
    required this.tags,
    required this.userId,
    required this.image,

  });

  factory Recipe.fromJson(Map m1)
  {
    return Recipe(id: m1['id'],
        name: m1['name'],
        ingredients: m1['ingredients'],
        instructions: m1['instructions'],
        prepTimeMinutes: m1['prepTimeMinutes'],
        cookTimeMinutes: m1['cookTimeMinutes'],
        servings: m1['servings'],
        cuisine: m1['cuisine'],
        caloriesPerServing: m1['caloriesPerServing'],
        tags: m1['tags'],
        userId: m1['userId'],
        image: m1['image'],

    );
  }

}