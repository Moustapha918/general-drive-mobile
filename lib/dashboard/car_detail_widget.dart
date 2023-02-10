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
      padding: EdgeInsets.all(padding??8),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 5
                ),
                child: Text(
                  txt1,
                  style: TextStyle(color: CColors.textColor),
                ),
              ),
              Row(
                children: [
                  Text(
                    txt2,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
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
