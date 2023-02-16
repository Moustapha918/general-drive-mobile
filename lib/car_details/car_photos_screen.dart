import 'dart:io';

import 'package:flutter/material.dart';
import 'package:general_mobile_drive/car_details/car_image_widget.dart';
import 'package:general_mobile_drive/car_details/check_box_widget.dart';
import 'package:general_mobile_drive/dashboard/dashboard_screen.dart';

class CarImagesScreen extends StatefulWidget {
  final List<String>? images;

  const CarImagesScreen({Key? key, this.images}) : super(key: key);

  @override
  State<CarImagesScreen> createState() => _CarImagesScreenState();
}

class _CarImagesScreenState extends State<CarImagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => const DashboardScreen(),
                ),
                (route) => false);
          },
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Photos",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontSize: 16),
            ),
            Text(
              "${widget.images?.length ?? 0}/4",
              style: const TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                  fontSize: 13),
            ),
          ],
        ),
        elevation: 1,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Divider(
            //   thickness: 1,
            // ),
            const CheckBoxWidget(
              text: 'Adoptez nos angles de prise de vue',
            ),
            const CheckBoxWidget(
                text: 'Choisissez un arriére-plan neutre et dégagé'),
            const CheckBoxWidget(
                text: 'Servez-vous uniquement de lumiére naturelle'),
            const Divider(
              thickness: 1,
            ),
            const SizedBox(
              height: 10,
            ),
            InkWell(
              onTap: () {
                // Navigator.pushAndRemoveUntil(context,
                //     MaterialPageRoute(builder: (context) => DetailScreen(),), (
                //         route) => false);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Text(
                  "Photo principales (${widget.images?.length ?? 0}/4)",
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 20),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ...List.generate(
              imageInfoText.length,
              (index) => CarImageWidget(
                imageContainerText: imageContainerText[index],
                imageInfoText: imageInfoText[index],
                onImageAdd: (File image) {},
              ),
            ),
            ...List.generate(
              widget.images?.length ?? [].length,
              (index) => CarImageWidget(
                imageContainerText: imageContainerText[index],
                // image: widget.images![index],
                imageInfoText: imageInfoText[index],
                onImageAdd: (File image) {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  var imageInfoText = [
    "Voir I'exemple Arriöre)",
    "Voir exemple",
    "Voir exemple",
  ];

  var imageContainerText = [
    "Intérieur",
    "Supplémentaire",
    "Supplémentaire",
  ];
}
