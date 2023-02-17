import 'dart:io';

import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:http_parser/src/media_type.dart';

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
    // var request = http.MultipartRequest("POST", Uri.parse(url));
    // request.headers.addAll({
    //   "Authorization":
    //       "Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhZG1pbiIsImF1dGgiOiJST0xFX0FETUlOLFJPTEVfVVNFUiIsImV4cCI6MTY3NjU2NzQ1MX0.JecrgiuaAFO2_9uHs7D8apyfFIVVGG7wliu3gfCdtYcLvP7lhpjStokfu3arVwwhzdBxwLWjcgaFFozebfvPcw"
    // });
    // request.headers.addAll({
    //   "content-Type":
    //       "multipart/form-data"
    // });
    // request.fields["vehicle"] = "${addCarModel?.toMap()}";
    // request.fields["vehicle"] = ;

    List<MultipartFile> links = [];

    Dio dio1 = Dio();
    dio1.options.headers['content-Type'] = 'multipart/form-data';
    dio1.options.headers["Authorization"] =
        "Bearer eyJhbGciOiJIUzUxMiJ9.eyJzdWIiOiJhZG1pbiIsImF1dGgiOiJST0xFX0FETUlOLFJPTEVfVVNFUiIsImV4cCI6MTY3NjU2NzQ1MX0.JecrgiuaAFO2_9uHs7D8apyfFIVVGG7wliu3gfCdtYcLvP7lhpjStokfu3arVwwhzdBxwLWjcgaFFozebfvPcw";
    for (var element in imageFiles) {
      MultipartFile object = await MultipartFile.fromFile(element.path,
          contentType: MediaType('image', 'jpeg'));
      links.add(object);
      debugPrint("fileeee");
    }
    var v = {
      "registrationNumber": "12431X00",
      "brand": "TOYOTA",
      "insuranceExpirationDate": "1299938",
      "modelYear": "2020",
      "location": "TEYARET",
      "type": "RAV 4",
      "sellPrice": 19000000,
      "rentPrice": 20000,
      "wheelsNbr": 4,
      "color": "red"
    };
    var formData = dio.FormData.fromMap({
      'file': links,
      // "vehicle": addCarModel?.toMap(),
      "vehicle":v,
    });
    debugPrint(formData.files.length.toString());
    try {
      var response = await dio1.post(url, data: formData);
      debugPrint(response.statusCode.toString());
    } on DioError catch (e) {
      debugPrint(e.toString());
      // TODO
    }

    // for (var element in imageFiles) {
    //   request.files
    //       .add(await http.MultipartFile.fromPath("file", element.path));
    // }
    // var response = await request.send();
    // debugPrint(response.statusCode.toString());
    // if (response.statusCode == 200) {
    //   debugPrint("product uploaded");
    // }
  }

  void addImage(File image) {
    imageFiles.add(image);
    debugPrint("added");
    notifyListeners();
  }
}
