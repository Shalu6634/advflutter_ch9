import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../9.2 Call Pixabay API & Represent in UI/search_api/modal/home_modal.dart';

import '../provider/product_provider.dart';

class RecipePage extends StatelessWidget {
  const RecipePage({super.key});

  @override
  Widget build(BuildContext context) {
    ProductProvider productProvider = Provider.of<ProductProvider>(context);
    ProductProvider productProviderFalse = Provider.of(context,listen: false);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('RECIPE'),
        scrolledUnderElevation: 0.1,
      ),
      body: FutureBuilder(
          future: Provider.of(context,listen: false),
          builder: (context, snapshot) {
            PixabayModal? apiModal = snapshot.data ;
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: productProvider.productModal!.hits.length,
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
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}
