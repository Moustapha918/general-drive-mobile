class AddCarModel {
  late String color,
      registrationNumber,
      brand,
      insuranceExpirationDate,
      modelYear,
      location,
      type;

  late int sellPrice, rentPrice, wheelsNbr;

  late double price;

  AddCarModel({
    required this.brand,
    required this.type,
    required this.modelYear,
    required this.color,
    required this.insuranceExpirationDate,
    required this.registrationNumber,
    required this.rentPrice,
    required this.price,
    required this.location,
    required this.sellPrice,
    required this.wheelsNbr,
  });

  AddCarModel.fromMap(Map<String, dynamic> data) {
    brand = data["brand"];
    type = data["type"];
    modelYear = data["modelYear"];
    color = data["color"];
    price = data["price"];
    insuranceExpirationDate = data["insuranceExpirationDate"];
    registrationNumber = data["registrationNumber"];
    rentPrice = data["rentPrice"];
    price = data["price"];
    location = data["location"];
    sellPrice = data["sellPrice"];
    wheelsNbr = data["wheelsNbr"];
  }

  Map<String, dynamic> toMap() {
    return {
      "brand": brand,
      "color": color,
      "sellPrice": sellPrice,
      "wheelsNbr": wheelsNbr,
      "rentPrice": rentPrice,
      "registrationNumber": registrationNumber,
      "insuranceExpirationDate": insuranceExpirationDate,
      "type": type,
      "modelYear": modelYear,
      "price": price,
      "location": location,
    };
  }
}
