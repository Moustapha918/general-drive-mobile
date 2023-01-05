import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/vehicle_model.dart';

class HttpServices {
  static String? hostname = dotenv.env['API_HOSTNAME'];
  static String? vehiclesUri = dotenv.env['VEHICLES_URI'];
  static String baseUrl = 'https://gentle-fortress-77748.herokuapp.com';

  Future<List<VehicleModel>> getVehicles() async {
    var url = Uri.parse(baseUrl + '/api/vehicles');
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var res = jsonDecode(response.body)
            .map<VehicleModel>((item) => VehicleModel.fromJson(item))
            .toList();
        return res;
      } else {
        throw "Unable to retreive vehicles";
      }
    } catch (e) {
      return [];
    }
  }
}
