import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../dashboard/car_detail_widget.dart';
import '../dashboard/providers/add_car_provider.dart';
import '../extra/App_strings.dart';
import '../extra/ccolors.dart';
import 'car_details_check_widget.dart';

class RegTwo extends StatefulWidget {
  const RegTwo({Key? key}) : super(key: key);

  @override
  State<RegTwo> createState() => _RegTwoState();
}

class _RegTwoState extends State<RegTwo> {
  List<String> dropDownFuel = [
    AppStrings.Petrol,
    AppStrings.Gas,
    AppStrings.other
  ];
  var selectedFuel =  AppStrings.Petrol;
  late AddCarProvider carPro;

  int c = 0;

  @override
  Widget build(BuildContext context) {
    carPro = Provider.of<AddCarProvider>(context);

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.addmoredetails,
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          textRow(AppStrings.fuel, fuelCon()),

          TextField(
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black12),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black12),
              ),
              border: InputBorder.none,
              hintStyle: TextStyle(color: Colors.black38),
              hintText: AppStrings.Gearbox,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: (){
              c = 0;
              setState(() {

              });
            },
            child: CarDetailsCheckWidget(
              txt1: AppStrings.manualGearBox,
              check: (c == 0) ? true : false,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: (){
              c = 1;
              setState(() {

              });
            },
            child: CarDetailsCheckWidget(
              txt1: AppStrings.automaticGearBox,
              check: (c == 1) ? true : false,

            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.yellow.withOpacity(.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              "${AppStrings.youcanfindthisinformationonthecarregistrationcertificate} ",
              style: TextStyle(
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }


  Widget textRow(String txt1, Widget w2) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  txt1,
                  style: TextStyle(color: CColors.textColor),
                ),
              ),
              w2,
            ],
          ),
          const Divider(
            thickness: 1,
          ),
        ],
      ),
    );
  }
  Widget fuelCon() {
    return Container(
      width: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10)),
      child: DropdownButton<String>(
        value: selectedFuel,
        isExpanded: true,
        icon: const Icon(Icons.arrow_drop_down),
        elevation: 16,
        style: TextStyle(color: CColors.textColor),
        underline: const SizedBox(),
        onChanged: (String? newValue) {
          setState(() {
            selectedFuel = newValue!;
            carPro.type = selectedFuel;
          });
        },
        items: dropDownFuel
            .map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(value),
            ),
          );
        }).toList(),
      ),
    );
  }
}
