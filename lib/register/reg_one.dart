import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../dashboard/car_detail_widget.dart';
import '../dashboard/providers/add_car_provider.dart';
import '../extra/App_strings.dart';
import '../extra/ccolors.dart';

class RegOne extends StatefulWidget {
  RegOne({Key? key}) : super(key: key);

  @override
  State<RegOne> createState() => _RegOneState();
}

class _RegOneState extends State<RegOne> {
  List<String> dropDownReg = [
    AppStrings.farance,
    AppStrings.Australia,
    AppStrings.Pakistan,
    AppStrings.other,
  ];
  var selectedReg = AppStrings.farance;
  List<String> dropDownYear = [
    '2000',
    '2001',
    '2002',
    '2003'
  ];
  var selectedYear = '2000';
  late AddCarProvider carPro;

  @override
  Widget build(BuildContext context) {
    carPro = Provider.of<AddCarProvider>(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.Whatsyourplatenumber,
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: carPro.registrationNumber,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black12),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black12),
              ),
              border: InputBorder.none,
              hintStyle: TextStyle(color: Colors.black38),
              hintText: AppStrings.PlateNumber,
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.symmetric(vertical: 12.0),
          //   child: CarDetailWidget(
          //     txt1: "Registration Country",
          //     txt2: "Farnace",
          //     padding: 0,
          //   ),
          // ),

          textRow("Registration Country", regCon()),
          textRow("Release Year", releaseYear()),

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

  Widget releaseYear() {
    return Container(
      width: 100,
      decoration: BoxDecoration(
          // border: Border.all(color: CColors.blueColor, width: 1),
          borderRadius: BorderRadius.circular(10)),
      child: DropdownButton<String>(
        value: selectedYear,
        isExpanded: true,
        icon: const Icon(Icons.arrow_drop_down),
        elevation: 16,
        style: TextStyle(color: CColors.textColor),
        underline: const SizedBox(),
        onChanged: (String? newValue) {
          setState(() {
            selectedYear = newValue!;
            carPro.modelYear = int.parse(selectedYear);
          });
        },
        items: dropDownYear
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

  Widget regCon() {
    return Container(
      width: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10)),
      child: DropdownButton<String>(
        value: selectedReg,
        isExpanded: true,
        icon: const Icon(Icons.arrow_drop_down),
        elevation: 16,
        style: TextStyle(color: CColors.textColor),
        underline: const SizedBox(),
        onChanged: (String? newValue) {
          setState(() {
            selectedReg = newValue!;
            carPro.brand = selectedReg;
          });
        },
        items: dropDownReg
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
