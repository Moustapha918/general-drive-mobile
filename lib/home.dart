import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SeachComponent(),
      ],
    );
  }
}

class SeachComponent extends StatelessWidget {
  const SeachComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: const EdgeInsets.only(top: 40),
      child: Card(
          child: Row(
        children: [
          TextButton.icon(
              onPressed: () => {},
              icon: const Icon(
                Icons.location_on,
                color: Colors.pinkAccent,
              ),
              label: const Text('current location',
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
                  'When',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                )),
          )
        ],
      )),
    );
  }
}
