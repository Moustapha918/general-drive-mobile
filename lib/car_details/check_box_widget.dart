import 'package:flutter/material.dart';

class CheckBoxWidget extends StatefulWidget {
  final String text;

  const CheckBoxWidget({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  State<CheckBoxWidget> createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  bool checkValue = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Flexible(
          child: Checkbox(
            value: checkValue,
            activeColor: const Color(0xff0fda94),
            onChanged: (value) {
              setState(() {
                checkValue = value!;
              });
            },
            shape: const CircleBorder(),
          ),
        ),
        Text(widget.text)
      ],
    );
  }
}
