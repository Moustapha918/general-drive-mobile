import 'package:deyd_kata_flutter/filter_vehicle_notifier.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/bottom_sheet/multi_select_bottom_sheet.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:provider/provider.dart';

class SeachComponent extends StatefulWidget {
  const SeachComponent({Key? key}) : super(key: key);

  static final List<Ville> villes = [
    Ville(code: 'tey', title: "Teyaret"),
    Ville(code: 'ara', title: "Arafat"),
    Ville(code: 'dar', title: "Dar Naim"),
    Ville(code: 'tou', title: "Toujounin"),
    Ville(code: 'tev', title: "Tevragh zeina"),
    Ville(code: 'ksa', title: "Leksar"),
    Ville(code: 'seb', title: "sebkha"),
    Ville(code: 'min', title: "El mina"),
    Ville(code: 'riy', title: "riyad"),
  ];

  @override
  State<SeachComponent> createState() => _SeachComponentState();
}

class _SeachComponentState extends State<SeachComponent> {
  List<Ville> selectedVilles = [];
  DateTime? pickedDate;

  final _items = SeachComponent.villes
      .map((ville) => MultiSelectItem<Ville>(ville, ville.title))
      .toList();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: const EdgeInsets.only(top: 40, bottom: 10),
      child: Card(
          child: Row(
        children: [
          TextButton.icon(
              onPressed: () => {selectSeachLocations(context)},
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
                onPressed: () async => {selectSearchDates()},
                icon: const Icon(
                  Icons.calendar_month_outlined,
                  color: Colors.pinkAccent,
                ),
                label: const Text(
                  'Quand ?',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                )),
          )
        ],
      )),
    );
  }

  void selectSeachLocations(BuildContext context) async {
    await showModalBottomSheet(
      isScrollControlled: true, // required for min/max child size
      context: context,
      builder: (ctx) {
        return MultiSelectBottomSheet(
          items: _items,
          onConfirm: (values) {
            selectedVilles = values.map((value) => value as Ville).toList();
            context
                .read<FilterVehicleNotfier>()
                .updateSelectedVille(selectedVilles);
          },
          maxChildSize: 0.8,
          initialValue: const [],
        );
      },
    );
  }

  selectSearchDates() async {
    var nextDay = DateTime.now();
    List<DateTime> availableDate = [nextDay];
    for (int i = 0; i < 90; i++) {
      nextDay = nextDay.add(const Duration(days: 1));
      availableDate.add(nextDay);
    }
    await showModalBottomSheet(
      isScrollControlled: true, // required for min/max child size
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20),
        ),
      ),
      builder: (ctx) {
        return SizedBox(
          height: 380,
          child: DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 16,
                toolbarHeight: 0,
                bottom: TabBar(
                  tabs: [
                    Tab(
                        child: Column(
                      children: const [
                        Text(
                          'Date debut',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Choisir un date',
                          style: TextStyle(color: Colors.black),
                        )
                      ],
                    )),
                    Tab(
                      child: Column(
                        children: const [
                          Text(
                            'Date Fin',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Choisir un date',
                            style: TextStyle(color: Colors.black),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              body: TabBarView(
                children: [
                  const Icon(Icons.directions_car),
                  Row(
                    children: [
                      Expanded(
                        child: ListView.separated(
                          padding: const EdgeInsets.all(14),
                          itemCount: availableDate.length,
                          itemBuilder: (BuildContext context, int index) {
                            String dateLine = DateFormat.yMMMEd()
                                .format(availableDate[index]);
                            return Column(
                              children: [
                                SizedBox(
                                  height: 40,
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Text(dateLine),
                                  ),
                                )
                              ],
                            );
                          },
                          separatorBuilder: (BuildContext context, int index) =>
                              const Divider(
                                  color: Colors.pinkAccent, height: 2),
                        ),
                      ),
                      const Spacer(),
                      const Text('Hours')
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
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
