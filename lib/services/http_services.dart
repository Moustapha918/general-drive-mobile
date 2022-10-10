import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/vehicle_model.dart';

class HttpServices {
  static String? hostname = dotenv.env['API_HOSTNAME'];
  static String? vehiclesUri = dotenv.env['VEHICLES_URI'];

  Future<List<VehicleModel>> getVehicles() async {
    var url = Uri.http('localhost:8080', '/api/vehicles');
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
