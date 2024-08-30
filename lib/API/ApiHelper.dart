import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class ApiServices
{
  String baseUrl = 'https://sheetdb.io/api/v1/72cbk3pw79lzv';
  static ApiServices apiServices = ApiServices._();
  ApiServices._();

  Future<List> fetchData()
  async {
    Response response = await http.get(Uri.parse(baseUrl));
    if(response.statusCode == 200)
    {
      print("API CALLED");
      List json = jsonDecode(response.body);
      return json;
    }else{
      throw 'Unexpected error occurred';
    }
  }
}