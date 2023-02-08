import 'package:flutter/material.dart';

import '../extra/ccolors.dart';

class CarDetailWidget extends StatelessWidget {
  String txt1;
  String txt2;
  double? padding;

  CarDetailWidget({
    this.padding = 5,
    required this.txt1,
    required this.txt2,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(padding!),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                txt1,
                style: TextStyle(color: CColors.textColor),
              ),
              Row(
                children: [
                  Text(txt2),
                  const SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: CColors.textColor,
                    size: 15,
                  )
                ],
              ),
            ],
          ),
          const Divider(
            thickness: 1,
          ),
        ],
      ),
    );
  }
}
