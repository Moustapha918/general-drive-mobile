import 'package:flutter/material.dart';

import 'models/owner.dart';
import 'models/vehicle_model.dart';

class VehicleList extends StatelessWidget {
  VehicleList({
    Key? key,
  }) : super(key: key);

  final List<VehicleModel> vehicles = <VehicleModel>[
    VehicleModel(
        registrationNumber: "registrationNumber",
        brand: "Mercedes Benz 390",
        modelYear: '2020',
        wheelsNbr: 4,
        color: "red",
        type: '4*4',
        sellPrice: 400,
        rentPrice: 12000,
        images: [
          'https://images.pexels.com/photos/170811/pexels-photo-170811.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
        ],
        owner: Owner(id: 3),
        insuranceExpirationDate: ''),
    VehicleModel(
        registrationNumber: "registrationNumber",
        brand: "Toyota Rav 4",
        modelYear: '2020',
        wheelsNbr: 4,
        color: "red",
        type: '4*4',
        sellPrice: 400,
        rentPrice: 14000,
        images: [
          'https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/2022-toyota-rav4-trd-offroad-003-scaled-1636723552.jpg?crop=0.686xw:0.772xh;0.138xw,0.125xh&resize=640:*'
        ],
        owner: Owner(id: 3),
        insuranceExpirationDate: ''),
    VehicleModel(
        registrationNumber: "registrationNumber",
        brand: "Sport 3.2",
        modelYear: '2020',
        wheelsNbr: 4,
        color: "red",
        type: '4*4',
        sellPrice: 400,
        rentPrice: 20000,
        images: [
          'https://npr.brightspotcdn.com/dims4/default/0f6c110/2147483647/strip/true/crop/1885x1414+0+0/resize/880x660!/quality/90/?url=https%3A%2F%2Fmedia.npr.org%2Fassets%2Fimg%2F2022%2F05%2F31%2Fscreen-shot-2022-05-31-at-8.32.41-am-90976307d1d0c1408fd60a67e511f8e832db778c.png'
        ],
        owner: Owner(id: 3),
        insuranceExpirationDate: '')
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: vehicles.length,
      itemBuilder: (BuildContext context, int index) {
        var vehicle = vehicles[index];
        return Column(
          children: [
            Image.network(vehicle.images[0]),
            SizedBox(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Text(
                      vehicle.brand,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Container(
                        margin: const EdgeInsets.only(left: 10),
                        child: Text(vehicle.modelYear)),
                    const Spacer(),
                    const Text('No reviews'),
                  ],
                ),
              ),
            ),
            Text(vehicle.rentPrice.toString() + ' MRO'),
          ],
        );
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    ));
  }
}