import 'package:flutter/material.dart';

import '../extra/ccolors.dart';

class GetButton extends StatelessWidget {
  final String text;
  final bool? isBlank;
  final double? w;
  final Icon? icon;
  final Function onTap;

  const GetButton(
      {Key? key,
        required this.text,
        this.w,
        required this.onTap,
        this.isBlank = false,
        this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return SizedBox(
      width: (w == null) ? MediaQuery.of(context).size.width : w,
      height: 56,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
              CColors.blueColor
          ),
          padding: const MaterialStatePropertyAll<EdgeInsets>(
            EdgeInsets.zero,
          ),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25.0),
              // side: BorderSide(
              //     color: (isBlank == false)
              //         ? Colors.transparent
              //         : Get.isDarkMode
              //         ? Colors.white70
              //         : Colors.black12),
            ),
          ),
        ),
        onPressed: () {
          onTap();
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            (icon != null)
                ? Padding(
              padding: EdgeInsets.only(right: 10),
              child: icon!,
            )
                : const SizedBox(),
            Text(
              text,
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
              )
            ),
          ],
        ),
      ),
    );
  }
}
