import 'package:flutter/material.dart';

class SeachComponent extends StatelessWidget {
  const SeachComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: const EdgeInsets.only(top: 20, bottom: 10),
      child: Card(
          child: Row(
        children: [
          TextButton.icon(
              onPressed: () => {},
              icon: const Icon(
                Icons.location_on,
                color: Colors.pinkAccent,
              ),
              label: const Text('Ou ?',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black))),
          const Spacer(),
          const VerticalDivider(
            width: 20,
            thickness: 1,
            indent: 10,
            endIndent: 10,
            color: Colors.grey,
          ),
          Padding(
            padding: const EdgeInsets.only(right: 40.0),
            child: TextButton.icon(
                onPressed: () => {},
                icon: const Icon(
                  Icons.calendar_month_outlined,
                  color: Colors.pinkAccent,
                ),
                label: const Text(
                  'Qaund ?',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                )),
          )
        ],
      )),
    );
  }
}
