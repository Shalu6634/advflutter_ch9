import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../9.2 Call Pixabay API & Represent in UI/search_api/modal/all_api_modal.dart';
import '../../Recipe/provider/recipe_provider.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    RecipeProvider recipeProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: const Icon(
          Icons.menu,
          size: 30,
        ),
        scrolledUnderElevation: 0.1,
      ),
      body: FutureBuilder(
        future: Provider.of<RecipeProvider>(context, listen: false).fromMap(),
        builder: (context, snapshot) {
          PixabayModal? apiModal = snapshot.data;
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: recipeProvider.recipeModal!.hits.length,
                itemBuilder: (context, index) => Container(
                  height: 300,
                  width: double.infinity,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(apiModal!.hits[index].webformatURL),
                    ),
                  ),
                  child: Text('${apiModal.hits[index].likes}'),
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
