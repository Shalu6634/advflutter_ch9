import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../modal/recipe_modal.dart';
import '../provider/recipe_provider.dart';
import 'Recipe_screen.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    RecipeProvider recipeProvider = Provider.of(context);
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: height * 0.3,
                    width: width * 0.999,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(recipeProvider
                              .recipeModal!.recipes[selectedIndex].image),
                          fit: BoxFit.cover),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            recipeProvider
                                .recipeModal!.recipes[selectedIndex].name,
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            height: height * 0.015,
                          ),
                          Row(
                            children: [
                              Text(
                                'Cuisine: ',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                              Text(
                                '${recipeProvider.recipeModal!.recipes[selectedIndex].cuisine}',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          Row(
                            // mainAxisAlignment: MainAxisAlignment.,
                            children: [
                              Text(
                                'Difficulty: ',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              ),

                              SizedBox(
                                width: width * 0.4,
                              ),
                              Text(
                                '🕗 :${recipeProvider.recipeModal!.recipes[selectedIndex].cookTimeMinutes} ',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Divider(),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Text(
                            '⭐⭐⭐',
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Text(
                            'Ingredients:   ',
                            style: TextStyle(
                                fontSize: 27, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Text(
                            '${recipeProvider.recipeModal!.recipes[selectedIndex].ingredients} ',
                            style: TextStyle(fontSize: 20),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          Text(
                            'Instructions : ',
                            style: TextStyle(
                                fontSize: 27, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.black26,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ListView.builder(
                                physics: NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: recipeProvider.recipeModal!
                                    .recipes[selectedIndex].instructions.length,
                                itemBuilder: (context, index) {
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 4.0),
                                    child: Text(
                                      'Step ${index + 1} - ${recipeProvider.recipeModal!.recipes[selectedIndex].instructions[index]}',
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        // FutureBuilder(
        //   future: Provider.of<RecipeProvider>(context, listen: false).fromMap(),
        //   builder: (context, snapShot) {
        //     RecipeModal? ha = snapShot.data;
        //     if (snapShot.hasData) {
        //       return Padding(
        //         padding: const EdgeInsets.all(5.0),
        //         child: ListView.builder(
        //           physics: BouncingScrollPhysics(),
        //           itemCount: ha!.recipes.length,
        //           itemBuilder: (context, index) {
        //             return GestureDetector(
        //                 onTap: () {
        //                   selectedIndex = index;
        //                   Navigator.of(context).pushNamed('/detail');
        //                 },
        //                 child: builDetailBox(ha, index));
        //           },
        //         ),
        //       );
        //     } else {
        //       return const Center(
        //         child: CircularProgressIndicator(),
        //       );
        //     }
        //   },
        // ),
      ),
    );
  }

  Widget builDetailBox(RecipeModal? ha, int index) {
    return Stack(
      children: [
        Image.network(
          ha!.recipes[selectedIndex].image,
          width: double.infinity,
          height: 330,
          fit: BoxFit.cover,
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 16.0),
                  Text(
                    ha.recipes[selectedIndex].name,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Text(
                        '⏱ ${ha.recipes[selectedIndex].cookTimeMinutes} - ${ha.recipes[selectedIndex].prepTimeMinutes} min',
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Cuisine: ${ha.recipes[selectedIndex].cuisine}',
                        style: const TextStyle(color: Colors.white70),
                      ),
                      Text(
                        '⭐ ⭐ ⭐',
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Servings: ${ha.recipes[selectedIndex].servings}',
                  ),
                  const SizedBox(height: 16),
                  Divider(),
                  const SizedBox(height: 16),
                  Text(
                    'Instructions',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: ha.recipes[selectedIndex].instructions.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Text(
                          'Step ${index + 1} - ${ha.recipes[selectedIndex].instructions[index]}',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Ingredients (${ha.recipes[selectedIndex].ingredients.length})',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Card(
                    color: Colors.grey[900],
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.builder(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: ha.recipes[selectedIndex].ingredients.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Text(
                              '${ha.recipes[selectedIndex].ingredients[index]}',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
