import 'package:deyd_kata_flutter/filter_vehicle_notifier.dart';
import 'package:deyd_kata_flutter/services/http_services.dart';
import 'package:deyd_kata_flutter/vehicule_data.dart';
import 'package:flutter/material.dart';
import 'models/vehicle_model.dart';
import 'package:provider/provider.dart';

class VehicleList extends StatefulWidget {
  const VehicleList({
    Key? key,
  }) : super(key: key);

  @override
  State<VehicleList> createState() => _VehicleListState();
}

class _VehicleListState extends State<VehicleList> {
  final HttpServices httpServices = HttpServices();
  List<VehicleModel>? vehicles;

  @override
  Widget build(BuildContext context) => FutureBuilder(
      future: httpServices.getVehicles(),
      builder: (context, AsyncSnapshot<List<VehicleModel>> snapshot) {
        if (snapshot.hasData) {
          vehicles = snapshot.data;
          var selectedLocations =
              context.watch<FilterVehicleNotfier>().selectedLocations;

          if (selectedLocations.isNotEmpty) {
            vehicles = vehicles
                ?.where((vehicle) => selectedLocations
                    .map((ville) => ville.title.toLowerCase())
                    .toList()
                    .contains(vehicle.location.toLowerCase()))
                .toList();
          }
          return Expanded(
              child: ListView.separated(
            padding: const EdgeInsets.all(8),
            itemCount: vehicles!.length,
            itemBuilder: (BuildContext context, int index) {
              var vehicle = vehicles![index];
              return GestureDetector(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const VehiculeData(),
                  ),
                ),
                child: Column(
                  children: [
                    if (vehicle.images.isNotEmpty)
                      Image.network(vehicle.images[0],
                          errorBuilder: (BuildContext context, Object exception,
                                  StackTrace? stackTrace) =>
                              Image.asset('assets/images/broken-1.png')),
                    SizedBox(
                      child: Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            Text(
                              vehicle.brand,
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
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
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
          ));
        }
        return const Text('waiting ...');
      });
}
