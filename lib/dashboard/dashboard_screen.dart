import 'package:flutter/material.dart';
import 'package:general_mobile_drive/dashboard/providers/dashboard_view_provider.dart';
import 'package:general_mobile_drive/shared/models/car_model.dart';
import 'package:provider/provider.dart';

import '../car_details/details_screen.dart';
import '../extra/App_strings.dart';
import '../extra/ccolors.dart';
import '../register/registration_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return DashBoardProvider();
      },
      lazy: false,
      child: Consumer<DashBoardProvider>(
        builder: (context, provider, child) {
          return Scaffold(
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
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => const RegistrationScreen(),));
                          },
                          child: Icon(
                            Icons.add,
                            color: CColors.blueColor,
                          ),
                        ),
                        DropdownButton(
                          onChanged: (val) {},
                          value: AppStrings.toutesVosVoitures,
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
                    Text(
                      AppStrings.voitures,
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
                                hintText: "${AppStrings.rechercherparplaquedimmatric}...",
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
                        style: ElevatedButton.styleFrom(
                          backgroundColor: CColors.blueColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(AppStrings.enSaviorPlus),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Expanded(
                      child: provider.isLoading
                          ? const Center(
                              child: CircularProgressIndicator(),
                            )
                          : ListView.separated(
                              itemBuilder: (context, index) {
                                return carWidget(
                                    context, provider.carList[index]);
                              },
                              separatorBuilder: (context, index) {
                                return const Divider(
                                  thickness: 1,
                                );
                              },
                              itemCount: provider.carList.length),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget carWidget(BuildContext context, CarModel model) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>  DetailScreen(
              model: model,
            ),
          ),
        );
      },
      leading: CircleAvatar(
        backgroundImage: (model.images ?? []).isEmpty
            ? const AssetImage("assets/images/car.jpg")
            : NetworkImage(model.images!.first) as ImageProvider,
        radius: 30,
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "${model.brand} ${model.type}",
            style: const TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${model.location}",
                style: TextStyle(color: CColors.textColor, fontSize: 12),
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
              "${model.registrationNumber}",
              style: TextStyle(
                color: CColors.textColor,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
    );
  }

  var categories = [
    AppStrings.toutesvosvoitures,
    "${AppStrings.toutesvosvoitures} 2",
    "${AppStrings.toutesvosvoitures} 3",
    "${AppStrings.toutesvosvoitures} 4",
  ];
}
