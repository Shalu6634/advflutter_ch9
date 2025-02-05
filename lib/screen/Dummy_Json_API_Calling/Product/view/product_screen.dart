
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../modal/product_modal.dart';
import '../provider/product_provider.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    var productProviderTrue =
        Provider.of<ProductProvider>(context, listen: true);
    return Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.menu),
          centerTitle: true,
          shadowColor: Colors.black,
          elevation: 3,
          actions: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Icon(Icons.person_2_outlined),
            ),
          ],
          title: Text(
            'Products',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: FutureBuilder(
          future: Provider.of<ProductProvider>(context, listen: false)
              // provider create method put
              .jsonParsing(),

          builder: (context, snapshot) {

            if (snapshot.hasData) {
              ProductModal? pro = snapshot.data;

              return ListView.builder(
                itemBuilder: (context, index) => Card(
                  child: ListTile(
                    title: Text(pro!.products[index].title),
                  ),
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ));
  }
}
