import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:general_mobile_drive/shared/models/car_model.dart';
import 'package:general_mobile_drive/shared/service.dart';

class DashBoardProvider extends ChangeNotifier {
  bool isLoading = true;
  final _apiService = ApiService();
  List<CarModel> carList = [];

  DashBoardProvider() {
    getCars();
  }

  Future<void> getCars() async {
    debugPrint("here");
    var url = "vehicles";
    try {
      var response = await _apiService.get(url: url);
      List items = jsonDecode(response.body) ?? [];
      carList = List.generate(
          items.length, (index) => CarModel.fromJson(items[index]));
    } catch (e) {
      debugPrint("error: ${e.toString()}");
    }
    isLoading = false;
    notifyListeners();
  }
}
