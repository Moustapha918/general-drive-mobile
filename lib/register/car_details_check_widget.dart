import 'package:flutter/material.dart';

import '../extra/ccolors.dart';

class CarDetailsCheckWidget extends StatelessWidget {
  String txt1;
  bool check;

  CarDetailsCheckWidget({
    required this.txt1,
    required this.check,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              txt1,
              style: TextStyle(color: CColors.textColor),
            ),
            Container(
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black38),
                color: (check) ? CColors.blueColor : null,
                shape: BoxShape.circle,
              ),
              child: Container(
                margin: const EdgeInsets.all(1.5),
                padding: const EdgeInsets.all(1.5),
                decoration: BoxDecoration(
                  // border: Border.all(color: Colors.black38),
                  color: (check) ? Colors.white : null,
                  shape: BoxShape.circle,
                ),
                child: Container(
                  height: 23,
                  width: 23,
                  decoration: BoxDecoration(
                    color: (check) ? CColors.blueColor : null,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            )
          ],
        ),
        const Divider(
          thickness: 1,
        ),
      ],
    );
  }
}
