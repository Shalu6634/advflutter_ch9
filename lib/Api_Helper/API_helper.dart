import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiHelper {
  static String api =
      "https://pixabay.com/images/search/flower/?manual_search=1";

  Future<Map> fetchApiData() async {
    Uri url = Uri.parse(api);
    Response response = await http.get(url);
    if (response.statusCode == 200) {
      final json = response.body;
      final Map data = jsonDecode(json);
      return data;
    } else {
      return {};
    }
  }
}
