import 'dart:convert';

import 'package:flutter/cupertino.dart';

import 'models/rental_model.dart';

class LocalJsonServices {
  Future<List<RentalModel>> getAllData(
      BuildContext context, String searchQuery) async {
    var myData = <RentalModel>[];
    var assetBundle = DefaultAssetBundle.of(context);
    var data = await assetBundle.loadString('assets/data.json');
    var jsonData = json.decode(data);
    var jsonSchedule = jsonData['data'];

    for (var jsonMatch in jsonSchedule) {
      RentalModel match = RentalModel.fromJSON(jsonMatch);
      myData.add(match);
      if (searchQuery.isNotEmpty) {
        myData = myData
            .where((item) => item.name.toLowerCase().contains(searchQuery))
            .toList();
      }
    }

    return myData;
  }
}
