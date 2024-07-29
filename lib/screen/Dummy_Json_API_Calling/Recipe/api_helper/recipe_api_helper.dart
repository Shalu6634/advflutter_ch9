
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class RecipeApiHelper {

  String api = 'https://dummyjson.com/recipes';

  Future<Map> Recipe_Api_Calling()
   async {
    Uri Url = Uri.parse(api);
    Response response = await http.get(Url);
    if (response.statusCode == 200) {
      final json = response.body;
      Map data = jsonDecode(json);
      return data;
    } else {
      return {};
    }
  }
}
