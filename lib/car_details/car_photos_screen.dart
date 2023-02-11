import 'package:flutter/material.dart';
import 'package:general_mobile_drive/car_details/car_image_widget.dart';
import 'package:general_mobile_drive/car_details/check_box_widget.dart';

import 'details_screen.dart';

class CarImagesScreen extends StatefulWidget {
  const CarImagesScreen({Key? key}) : super(key: key);

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
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text(
              "Photos",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontSize: 16),
            ),
            Text(
              "3/4",
              style: TextStyle(
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
            onTap: (){
              Navigator.pushAndRemoveUntil(context,
                  MaterialPageRoute(builder: (context) => DetailScreen(),), (
                      route) => false);
            },
            child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 12),
        child: Text(
          "Photo principales (3/4)",
          style: TextStyle(
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
