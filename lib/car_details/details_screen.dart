import 'package:flutter/material.dart';
import 'package:general_mobile_drive/car_details/detail_widget.dart';

import '../extra/App_strings.dart';
import '../extra/ccolors.dart';
import '../shared/models/car_model.dart';
import 'car_photos_screen.dart';

class DetailScreen extends StatefulWidget {
  final CarModel model;

  const DetailScreen({Key? key, required this.model}) : super(key: key);

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
              leading: CircleAvatar(
                backgroundImage: (widget.model.images ?? []).isEmpty
                    ? const AssetImage("assets/images/car.jpg")
                    : NetworkImage(widget.model.images!.first) as ImageProvider,
                radius: 30,
              ),
              title: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${widget.model.brand} ${widget.model.type}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
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
                      "${widget.model.registrationNumber}",
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
            ...[
              DetailWidget(
                title: titles[0],
                iconData: icons[0],
              ),
              DetailWidget(
                title:
                    "${widget.model.brand} ${widget.model.type} ${widget.model.type}",
                iconData: icons[1],
              ),
              DetailWidget(
                title: "${widget.model.location}",
                iconData: icons[2],
              ),
              DetailWidget(
                title: titles[3],
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CarImagesScreen(
                          images: widget.model.images,
                        ),
                      ));
                },
                iconData: icons[3],
              ),
              DetailWidget(
                title: titles[4],
                iconData: icons[4],
              ),
              DetailWidget(
                title: titles[5],
                iconData: icons[5],
              ),
            ],
            const Divider(
              thickness: 1,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: DetailWidget(title: AppStrings.statutDeLlannonce, iconData: null),
            ),
            const Divider(
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
    AppStrings.reservationInstantanee,
    AppStrings.description,
    AppStrings.adresse,
    AppStrings.photos,
    AppStrings.meCconditions,
    AppStrings.assuranceEtQualite,
  ];
}
