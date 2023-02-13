import 'package:flutter/material.dart';

import '../extra/ccolors.dart';

class DetailWidget extends StatelessWidget {
  final String title;
  final IconData? iconData;
  final Function()? onTap;

  const DetailWidget({
    Key? key,
    required this.title,
    required this.iconData, this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap:onTap ,
          child: Row(
            children: [
              if (iconData != null)
                Icon(
                  iconData,
                  color: CColors.textColorBlue,
                  size: 30,
                ),
              const SizedBox(
                width: 10,
              ),
              Text(
                title,
                style: TextStyle(color: CColors.textColorBlue),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: CColors.textColor,
                      size: 17,
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        if( iconData !=null )
        const Padding(
          padding: EdgeInsets.only(left: 45),
          child: Divider(
            thickness: 0.5,
          ),
        ),
        const SizedBox(
          height: 2.5,
        ),
      ],
    );
  }
}
