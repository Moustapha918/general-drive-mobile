import 'package:flutter/material.dart';
import 'package:general_mobile_drive/car_details/detail_widget.dart';

import '../extra/ccolors.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.close,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text(
          "Détails de Itannonce",
          style: TextStyle(
              fontWeight: FontWeight.w500, color: Colors.black, fontSize: 16),
        ),
        elevation: 1,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Column(
          children: [
            const SizedBox(
              height: 15,
            ),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const CircleAvatar(
                backgroundImage: AssetImage("assets/images/car.jpg"),
                radius: 30,
              ),
              title: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Toyota Yaris"),
                  const SizedBox(
                    height: 2,
                  ),
                  Container(
                    padding: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: CColors.textColor,
                      ),
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: const [
                        BoxShadow(
                          spreadRadius: 0,
                          blurStyle: BlurStyle.outer,
                          color: Colors.white,
                          blurRadius: 0.5,
                        ),
                      ],
                    ),
                    child: Text(
                      "EL52RC",
                      style: TextStyle(
                        color: CColors.textColor,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              thickness: 1,
            ),
            const SizedBox(
              height: 10,
            ),
            ...List.generate(
              titles.length,
              (index) => DetailWidget(
                title: titles[index],
                iconData: icons[index],
              ),
            ),
            Divider(
              thickness: 1,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 5
              ),
              child: DetailWidget(title: "Statut de llannonce", iconData: null ),
            ),
            Divider(
              thickness: 1,
            ),
          ],
        ),
      ),
    );
  }

  var icons = [
    Icons.flash_on_rounded,
    Icons.description,
    Icons.add_business_sharp,
    Icons.camera_alt,
    Icons.list_rounded,
    Icons.noise_aware,
  ];

  var titles = [
    "Réservation instantanée",
    "Description",
    "Adresse",
    "Photos",
    "Mes conditions",
    "Assurance et qualité",
  ];
}
