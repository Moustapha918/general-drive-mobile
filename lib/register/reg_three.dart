import 'package:flutter/material.dart';

import '../extra/App_strings.dart';

class RegThree extends StatelessWidget {
  const RegThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("object");
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${AppStrings.WhatsyourPhonenumber}?",
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(
            height: 20,
          ),
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
              hintText: AppStrings.countrycode,
              suffixIcon: Padding(
                padding: EdgeInsets.only(top: 10, bottom: 2.5),
                child: Text(
                  "",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "456789009876",
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
