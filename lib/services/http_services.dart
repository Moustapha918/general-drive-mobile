import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/vehicle_model.dart';

class HttpServices {
  static String? hostname = dotenv.env['API_HOSTNAME'];
  static String? vehiclesUri = dotenv.env['VEHICLES_URI'];

  Future<List<VehicleModel>> getVehicles() async {
    var url = Uri.http('localhost:8080', '/api/vehicles');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body) as List;
      List<VehicleModel> vehicles = body
          .map((item) => VehicleModel.fromJsonMap((item as String)))
          .toList();

      return vehicles;
    } else {
      throw "Unable to retreive vehicles";
    }
  }
}