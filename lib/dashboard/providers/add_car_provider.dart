import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../../add_car_model.dart';

class AddCarProvider extends ChangeNotifier {
  int modelYear = 0;
  int wheelsNbr = 0;
  int sellPrice = 0;
  String brand = "";
  String type = "";
  var location = TextEditingController();
  var registrationNumber = TextEditingController();
  List<File> imageFiles = [];

  AddCarModel? addCarModel;

  var rentPrice = TextEditingController();
  var color = TextEditingController();

  Future<void> addCar() async {
    addCarModel = AddCarModel(
        brand: brand,
        type: type,
        modelYear: modelYear.toString(),
        color: color.text,
        insuranceExpirationDate: "1299938",
        registrationNumber: "1299938",
        rentPrice: int.tryParse(rentPrice.text) ?? 0,
        price: sellPrice.toDouble(),
        location: location.text,
        sellPrice: sellPrice,
        wheelsNbr: wheelsNbr);
    var url = "https://gentle-fortress-77748.herokuapp.com/api/vehicles";
    var request = http.MultipartRequest("POST", Uri.parse(url));
    request.headers.addAll({
      "Authorization":
          "Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhZG1pbiIsImF1dGgiOiJST0xFX0FETUlOLFJPTEVfVVNFUiIsImV4cCI6MTY3NjU2NzQ1MX0.JecrgiuaAFO2_9uHs7D8apyfFIVVGG7wliu3gfCdtYcLvP7lhpjStokfu3arVwwhzdBxwLWjcgaFFozebfvPcw"
    });
    request.fields["vehicle"] = "${addCarModel?.toMap()}";
    for (var element in imageFiles) {
      request.files
          .add(await http.MultipartFile.fromPath("file", element.path));
    }
    var response = await request.send();
    if (response.statusCode == 200) {
      debugPrint("product uploaded");
    }
  }
}
