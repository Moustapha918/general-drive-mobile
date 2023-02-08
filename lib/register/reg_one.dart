import 'package:flutter/material.dart';

import '../dashboard/car_detail_widget.dart';

class RegOne extends StatelessWidget {
  const RegOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("object");
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          const Text(
            "What's your plate number?",
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const TextField(
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black12),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.black12),
              ),
              border: InputBorder.none,
              hintStyle: TextStyle(color: Colors.black38),
              hintText: 'Plate Number',
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: CarDetailWidget(
              txt1: "Registration Country",
              txt2: "Farnace",
              padding: 0,
            ),
          ),
          CarDetailWidget(
            txt1: "Release Year",
            txt2: "2017",
            padding: 0,
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
            child: const Text(
              "You can find this information on the car registration certificate ",
              style: TextStyle(
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
