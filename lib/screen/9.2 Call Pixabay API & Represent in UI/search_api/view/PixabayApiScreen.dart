import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../modal/Pixabay_api_modal.dart';
import '../provider/PixabayApiProvider.dart';

class PixabayApi extends StatelessWidget {
  const PixabayApi({super.key});

  @override
  Widget build(BuildContext context) {
    PixabayProvider pixabayProviderFalse =
        Provider.of<PixabayProvider>(context, listen: false);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          leading: const Icon(
            Icons.menu,
            size: 30,
          ),
          scrolledUnderElevation: 0.1,
          title: TextField(
            onChanged: (value) {
              pixabayProviderFalse.findImage(value);
            },
            controller: txtSearch,
            decoration: InputDecoration(
              hintText: 'Search',
              suffixIcon: Icon(Icons.search),
              enabledBorder: OutlineInputBorder(),
              focusedBorder: OutlineInputBorder(),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.black, width: 1)),
            ),
            cursorColor: Colors.black,
          ),
        ),
        body: FutureBuilder(
          future: Provider.of<PixabayProvider>(context, listen: false).fromJson(
              Provider.of<PixabayProvider>(context, listen: true).search),
          builder: (context, snapshot) {
            PixabayModal? listOfImage = snapshot.data;
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: listOfImage!.hits.length,
                itemBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.all(10),
                  child: Container(
                    height: 250,
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              listOfImage.hits[index].webformatURL),
                        )),
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
