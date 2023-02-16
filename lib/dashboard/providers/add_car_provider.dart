import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class AddCarProvider extends ChangeNotifier{

  int modelYear = 0;
  int wheelsNbr = 0;
  int sellPrice = 0;
  String brand = "";
  String type = "";
  var location = TextEditingController();
  var registrationNumber = TextEditingController();






  var rentPrice = TextEditingController();
  var color = TextEditingController();
}