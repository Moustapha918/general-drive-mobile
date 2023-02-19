import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../dashboard/providers/add_car_provider.dart';
import '../extra/App_strings.dart';
import '../extra/ccolors.dart';

class RegFour extends StatelessWidget {
  RegFour({Key? key}) : super(key: key);

  late AddCarProvider carPro;


  @override
  Widget build(BuildContext context) {
    carPro = Provider.of<AddCarProvider>(context);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Where will you meet drivers for check-in?",
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          getTextField("", carPro.location),
          const SizedBox(
            height: 25,
          ),
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: Colors.yellow.withOpacity(.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              "${AppStrings.thisaddresswillbeusedtoallowdriverstorentyourcar}  ",
              style: TextStyle(
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextFormField getTextField(
    String hint,
    TextEditingController controller,
  ) {
    return TextFormField(
      controller: controller,
      style: TextStyle(
        color: CColors.textColor,
        fontSize: 16,
      ),
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(vertical: 7, horizontal: 14),
        hintText: hint,
        // prefixIcon: Icon(Icons.search, color: Colors.black38),
        labelStyle: TextStyle(
          color: CColors.textColor,
          fontSize: 14,
        ),
        fillColor: Colors.black.withOpacity(.06),
        filled: true,
      ),
    );
  }
}
