import 'package:flutter/material.dart';
import 'package:multi_select_flutter/bottom_sheet/multi_select_bottom_sheet.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

class SeachComponent extends StatefulWidget {
  SeachComponent({
    Key? key,
  }) : super(key: key);

  static final List<Ville> villes = [
    Ville(code: 'v1', title: "Lion"),
    Ville(code: 'v2', title: "Flamingo"),
    Ville(code: 'v3', title: "Hippo"),
  ];

  @override
  State<SeachComponent> createState() => _SeachComponentState();
}

class _SeachComponentState extends State<SeachComponent> {
  List<Ville> selectedVille = [];

  final _items = SeachComponent.villes
      .map((ville) => MultiSelectItem<Ville>(ville, ville.title))
      .toList();

  void _showMultiSelect(BuildContext context) async {
    await showModalBottomSheet(
      isScrollControlled: true, // required for min/max child size
      context: context,
      builder: (ctx) {
        return MultiSelectBottomSheet(
          items: _items,
          onConfirm: (values) {
          },
          maxChildSize: 0.8,
          initialValue: const [],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: const EdgeInsets.only(top: 40, bottom: 10),
      child: Card(
          child: Row(
        children: [
          TextButton.icon(
              onPressed: () => {_showMultiSelect(context)},
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

class Ville {
  String code;
  String title;
  Ville({
    required this.code,
    required this.title,
  });
}
