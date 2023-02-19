import 'package:flutter/material.dart';
import 'package:general_mobile_drive/dashboard/car_detail_widget.dart';

import '../extra/App_strings.dart';
import '../extra/ccolors.dart';
import '../register/registration_screen.dart';

class CarDetailScreen extends StatefulWidget {
  const CarDetailScreen({Key? key}) : super(key: key);

  @override
  State<CarDetailScreen> createState() => _CarDetailScreenState();
}

class _CarDetailScreenState extends State<CarDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.bottomRight,
                  child: CloseButton(onPressed: () {
                    Navigator.of(context).pop();
                  }),
                ),
                const Text(
                  "Voitures",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
                const SizedBox(
                  height: 20,
                ),
                ...List.generate(
                  heading.length,
                  (index) => CarDetailWidget(
                    txt1: heading[index],
                    txt2: values[index],
                  ),
                ),
                // CarDetailWidget(txt1: "Marque", txt2: "Volkswagen"),
                // CarDetailWidget(txt1: "Marque", txt2: "Volkswagen"),
                // CarDetailWidget(txt1: "Marque", txt2: "Volkswagen"),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.1),
                                    blurStyle: BlurStyle.outer,
                                    blurRadius: 2),
                              ]),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Column(
                            children: [
                              const Text(
                                "495 \$",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30),
                              ),
                              Text(
                                "estimate per mois",
                                style: TextStyle(
                                    color: CColors.textColor, fontSize: 15),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const RegistrationScreen(),
                                  ));
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: CColors.blueColor,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12))),
                            child: Text(AppStrings.continuar),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  var heading = [
    AppStrings.marque,
    AppStrings.model,
    AppStrings.anneedimmatriculation,
    AppStrings.kilometrage,
    AppStrings.presde,
  ];

  var values = [
    AppStrings.volkswagen,
    AppStrings.gold,
    "2017",
    "50-100 000 km",
    AppStrings.paris,
  ];
}
