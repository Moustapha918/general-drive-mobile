import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'owner.dart';

class VehicleModel {
  final String registrationNumber;
  final String brand;
  final String insuranceExpirationDate;
  final String modelYear;
  final int wheelsNbr;
  final String color;
  final String type;
  final int sellPrice;
  final int rentPrice;
  final List<String> images;
  Owner owner;

  VehicleModel({
    required this.registrationNumber,
    required this.brand,
    required this.insuranceExpirationDate,
    required this.modelYear,
    required this.wheelsNbr,
    required this.color,
    required this.type,
    required this.sellPrice,
    required this.rentPrice,
    required this.images,
    required this.owner,
  });

  VehicleModel copyWith({
    String? registrationNumber,
    String? brand,
    String? insuranceExpirationDate,
    String? modelYear,
    int? wheelsNbr,
    String? color,
    String? type,
    int? sellPrice,
    int? rentPrice,
    List<String>? images,
    final Owner? owner,
  }) {
    return VehicleModel(
      registrationNumber: registrationNumber ?? this.registrationNumber,
      brand: brand ?? this.brand,
      insuranceExpirationDate: insuranceExpirationDate ?? this.insuranceExpirationDate,
      modelYear: modelYear ?? this.modelYear,
      wheelsNbr: wheelsNbr ?? this.wheelsNbr,
      color: color ?? this.color,
      type: type ?? this.type,
      sellPrice: sellPrice ?? this.sellPrice,
      rentPrice: rentPrice ?? this.rentPrice,
      images: images ?? this.images,
      owner: owner ?? this.owner,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'registrationNumber': registrationNumber});
    result.addAll({'brand': brand});
    result.addAll({'insuranceExpirationDate': insuranceExpirationDate});
    result.addAll({'modelYear': modelYear});
    result.addAll({'wheelsNbr': wheelsNbr});
    result.addAll({'color': color});
    result.addAll({'type': type});
    result.addAll({'sellPrice': sellPrice});
    result.addAll({'rentPrice': rentPrice});
    result.addAll({'images': images});
    result.addAll({'owner': owner.toMap()});
  
    return result;
  }

  factory VehicleModel.fromMap(Map<String, dynamic> map) {
    return VehicleModel(
      registrationNumber: map['registrationNumber'] ?? '',
      brand: map['brand'] ?? '',
      insuranceExpirationDate: map['insuranceExpirationDate'] ?? '',
      modelYear: map['modelYear'] ?? '',
      wheelsNbr: map['wheelsNbr']?.toInt() ?? 0,
      color: map['color'] ?? '',
      type: map['type'] ?? '',
      sellPrice: map['sellPrice']?.toInt() ?? 0,
      rentPrice: map['rentPrice']?.toInt() ?? 0,
      images: List<String>.from(map['images']),
      owner: Owner.fromMap(map['owner']),
    );
  }

  String toJson() => json.encode(toMap());

  factory VehicleModel.fromJson(String source) => VehicleModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'VehicleModel(registrationNumber: $registrationNumber, brand: $brand, insuranceExpirationDate: $insuranceExpirationDate, modelYear: $modelYear, wheelsNbr: $wheelsNbr, color: $color, type: $type, sellPrice: $sellPrice, rentPrice: $rentPrice, images: $images, owner: $owner)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is VehicleModel &&
      other.registrationNumber == registrationNumber &&
      other.brand == brand &&
      other.insuranceExpirationDate == insuranceExpirationDate &&
      other.modelYear == modelYear &&
      other.wheelsNbr == wheelsNbr &&
      other.color == color &&
      other.type == type &&
      other.sellPrice == sellPrice &&
      other.rentPrice == rentPrice &&
      listEquals(other.images, images) &&
      other.owner == owner;
  }

  @override
  int get hashCode {
    return registrationNumber.hashCode ^
      brand.hashCode ^
      insuranceExpirationDate.hashCode ^
      modelYear.hashCode ^
      wheelsNbr.hashCode ^
      color.hashCode ^
      type.hashCode ^
      sellPrice.hashCode ^
      rentPrice.hashCode ^
      images.hashCode ^
      owner.hashCode;
  }
}