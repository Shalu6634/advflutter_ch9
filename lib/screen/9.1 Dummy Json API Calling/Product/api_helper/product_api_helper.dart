import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/http.dart' as http;


class ProductApiHelper
{
  String api = "https://pixabay.com/api/?key=45138225-a416a2324ca13675c0a531b07&q=yellow+flowers&image_type=photo&pretty=true";

  Future<Map> productApiCalling()
  async {
    Uri Url = Uri.parse(api);
    Response response = await http.get(Url);

    if(response.statusCode==200)
      {
        final json = response.body;
        final Map data = jsonDecode(json);
        return data;
      }
    else
      {
        return {};
      }
  }
}
// import 'dart:convert';
//
// import 'package:http/http.dart' as http;
// import 'package:http/http.dart';
//
// class ProductApiHelper
// {
//   String api = 'https://pixabay.com/api/?key=45140193-022d8adb1e5eee0ac2ab1bcac&q=products&image_type=photo&pretty=true';
//
//   Future<Map> Product_Api_Calling()
//   async {
//     Uri Url = Uri.parse(api);
//     Response response = await http.get(Url);
//     if(response.statusCode==200)
//     {
//       final json = response.body;
//       final Map data = jsonDecode(json);
//       return data;
//     }
//     else
//     {
//       return {};
//     }
//   }
// }
