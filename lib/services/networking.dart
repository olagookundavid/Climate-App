// ignore_for_file: avoid_print

import 'package:http/http.dart' as http;
import 'dart:convert';


class NetworkHelper{
  NetworkHelper(this.url);
  final String url;

  Future<void> getData() async{
    http.Response response = await http.get(Uri.parse(
        url));
    if (response.statusCode == 200) {
      String data = response.body;
      jsonDecode(data);
    } 
else {
      print(response.statusCode);
    }
  }
}