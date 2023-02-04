import 'package:flutter/material.dart';
import 'package:general_mobile_drive/dashboard/car_detail.dart';

import '../extra/ccolors.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: CColors.blueColor,
          unselectedItemColor: CColors.textColor,
          iconSize: 20,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: const TextStyle(fontSize: 12),
          unselectedLabelStyle: const TextStyle(fontSize: 12),
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.car_crash,
                  color: CColors.blueColor,
                ),
                label: "Voltures"),
            const BottomNavigationBarItem(
                icon: Icon(Icons.mail), label: "Dememdes"),
            const BottomNavigationBarItem(
                icon: Icon(Icons.key), label: "Locations"),
            const BottomNavigationBarItem(
                icon: Icon(Icons.bar_chart), label: "Performance"),
            const BottomNavigationBarItem(
                icon: Icon(Icons.person), label: "Compte"),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.add,
                    color: CColors.blueColor,
                  ),
                  DropdownButton(
                    onChanged: (val) {},
                    value: "Toutes vos voitures",
                    icon: Icon(
                      Icons.arrow_drop_down,
                      color: CColors.blueColor,
                    ),
                    underline: const SizedBox(),
                    items: categories
                        .map(
                          (e) => DropdownMenuItem(
                            value: e,
                            child: Text(
                              e,
                              style: TextStyle(
                                  color: CColors.blueColor,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ],
              ),
              const Text(
                "Voitures",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: CColors.greyColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.search,
                      color: CColors.textColor,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: TextFormField(
                        style: TextStyle(color: CColors.textColor),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintStyle: TextStyle(color: CColors.textColor),
                          isDense: true,
                          hintText: "Rechercher par plaque d'immatric...",
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text("En Savior Plus"),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: CColors.blueColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12))),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return ListTile(
                        contentPadding: EdgeInsets.zero,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const CarDetailScreen(),
                              ));
                        },
                        leading: const CircleAvatar(
                          backgroundImage: AssetImage("assets/images/car.jpg"),
                          radius: 30,
                        ),
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            const Text(
                              "Pass de litre",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Nanterre Préfecture RER, 92000 Nant",
                                  style: TextStyle(
                                      color: CColors.textColor, fontSize: 12),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 15,
                                  color: CColors.textColor,
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 2,
                            ),
                            Container(
                              padding: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: CColors.textColor,
                                ),
                                boxShadow: [
                                  const BoxShadow(
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
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider(
                        thickness: 1,
                      );
                    },
                    itemCount: 10),
              ),
            ],
          ),
        ),
      ),
    );
  }

  var categories = [
    "Toutes vos voitures",
    "Toutes vos voitures 2",
    "Toutes vos voitures 3",
    "Toutes vos voitures 4",
  ];
}
