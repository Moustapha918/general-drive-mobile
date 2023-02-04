import 'package:flutter/material.dart';

import '../extra/ccolors.dart';

class CarDetailWidget extends StatelessWidget {
  const CarDetailWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Marque",
                style: TextStyle(color: CColors.textColor),
              ),
              Row(
                children: [
                  const Text("Volkswagen"),
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
