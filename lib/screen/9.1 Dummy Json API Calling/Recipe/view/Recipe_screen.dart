
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/Recipe_provider.dart';
import '../modal/recipe_modal.dart';

class RecipePage  extends StatelessWidget {
  const RecipePage ({super.key});

  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    RecipeProvider recipeProviderFalse =
    Provider.of<RecipeProvider>(context, listen: false);
    RecipeProvider recipeProviderTrue =
    Provider.of<RecipeProvider>(context, listen: true);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: const Text(
            'Recipes',
            style: TextStyle(color: Colors.white),
          ),
          leading: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 20, left: 10, right: 10),
              child: Center(
                child: Container(
                  height: 180,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(13),
                      image: const DecorationImage(
                        image: AssetImage('assets/img/food.jpg'),
                        fit: BoxFit.cover,

                      ),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.grey,
                            offset: Offset(0, 2),
                            // spreadRadius: 1,
                            blurRadius: 1)
                      ]
                  ),
                ),
              ),
            ),SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25),
                  child: Text(
                    'All Recipes',
                    textAlign: TextAlign.left,
                    style: TextStyle(color: Colors.black, fontSize: 20,fontWeight: FontWeight.bold),
                  ),
                ),

              ],
            ),
            Expanded(
              child: FutureBuilder(
                future: Provider.of<RecipeProvider>(context,listen: false).fromMap() ,
                builder:(context,snapShot) {
                  RecipeModal? ha = snapShot.data as RecipeModal?;
                  if (snapShot.hasData) {
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ListView.builder(
                        physics: BouncingScrollPhysics(),
                        itemCount: ha!.recipes.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () {
                                selectedIndex = index;
                                Navigator.of(context).pushNamed('/detail');
                              },
                              child: RecipeBox(ha, index));
                        },
                      ),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(color: Colors.black,),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget RecipeBox(RecipeModal ha, int index) {
    return Row(
      children: [
        Container(
          height: 160,
          width: 150,
          margin: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: NetworkImage(ha.recipes[index].image),
              fit: BoxFit.cover,
              opacity: 0.9
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  ha.recipes[index].name,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Difficulty: ${ha.recipes[index].difficulty}',
                ),
                const SizedBox(height: 5),
                Text(
                  'Cuisine: ${ha.recipes[index].cuisine}',

                ),
                const SizedBox(height: 5),
                Text(
                  'Servings: ${ha.recipes[index].servings}',

                ),Text(
                  'cookTimeMinutes: ${ha.recipes[index].cookTimeMinutes
                  }',

                ),
                const SizedBox(height: 5),
                Text(
                  '⭐ ⭐ ⭐',

                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
int selectedIndex = 0;