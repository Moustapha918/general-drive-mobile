import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import 'constants.dart';

class ApiService {
  Future<http.Response> get({required String url}) async {
    try {
      var apiUrl = Uri.parse("${Constants.apiUrl}$url");
      var response = await http.get(apiUrl);
      debugPrint(response.toString());
      if (response.statusCode != 200) {
        throw "Something went wrong";
      }
      return response;
    } catch (e) {
      throw "Something went wrong";
      // TODO
    }
  }
}
