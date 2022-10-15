import 'package:deyd_kata_flutter/filter_vehicle_notifier.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class BookingDatesModal extends StatelessWidget {
  BookingDatesModal({
    Key? key,
    required this.availableDate,
    required this.hoursOfTheDay,
  }) : super(key: key);

  final List<DateTime> availableDate;
  final List hoursOfTheDay;
  DateTime? pickedStartDay;
  DateTime? pickedEndDay;
  int? pickedStartHour;
  int? pickedEndHour;

  final ButtonStyle confirmationButtonStyle = ElevatedButton.styleFrom(
      textStyle: const TextStyle(fontFamily: 'RobotoMono'),
      minimumSize: const Size.fromHeight(40),
      backgroundColor: Colors.pinkAccent);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 460,
      child: Column(
        children: [
          SizedBox(
            height: 380,
            child: DefaultTabController(
              length: 2,
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  surfaceTintColor: Colors.pinkAccent,
                  elevation: 16,
                  toolbarHeight: 20,
                  bottom: TabBar(
                    indicatorColor: Colors.pinkAccent,
                    tabs: [
                      Tab(
                          child: Column(
                        children: [
                          const Text(
                            'Date debut',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            pickedStartDay != null ? 'not picked' : 'Picked',
                            style: const TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
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
                    Row(
                      children: [
                        Expanded(
                          child: ListView.separated(
                              padding: const EdgeInsets.all(14),
                              itemCount: availableDate.length,
                              itemBuilder: (BuildContext context, int index) {
                                String dateLine;
                                if (index == 0) {
                                  dateLine = 'Aujourd\'hui';
                                } else {
                                  dateLine = DateFormat.yMMMEd()
                                      .format(availableDate[index]);
                                }

                                return SizedBox(
                                  height: 40,
                                  child: GestureDetector(
                                    onTap: () =>
                                        {pickedStartDay = availableDate[index]},
                                    child: SizedBox(
                                      child: Padding(
                                        padding: const EdgeInsets.all(6.0),
                                        child: Text(dateLine),
                                      ),
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const Divider(color: Colors.grey);
                              }),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: ListView.separated(
                            padding: const EdgeInsets.all(14),
                            itemCount: hoursOfTheDay.length,
                            itemBuilder: (BuildContext context, int index) {
                              String hourLine = hoursOfTheDay[index];
                              return GestureDetector(
                                onTap: () => pickedStartHour = index,
                                child: GestureDetector(
                                  onTap: () => pickedStartHour = index,
                                  child: SizedBox(
                                    height: 40,
                                    child: Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Text(hourLine),
                                    ),
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (BuildContext context,
                                    int index) =>
                                const Divider(color: Colors.grey, height: 2),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ListView.separated(
                            padding: const EdgeInsets.all(14),
                            itemCount: availableDate.length,
                            itemBuilder: (BuildContext context, int index) {
                              String dateLine = DateFormat.yMMMEd()
                                  .format(availableDate[index]);
                              return GestureDetector(
                                onTap: () =>
                                    pickedEndDay = availableDate[index],
                                child: SizedBox(
                                  height: 40,
                                  child: Padding(
                                    padding: const EdgeInsets.all(6.0),
                                    child: Text(dateLine),
                                  ),
                                ),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const Divider(
                                        color: Colors.pinkAccent, height: 2),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: ListView.separated(
                            padding: const EdgeInsets.all(14),
                            itemCount: hoursOfTheDay.length,
                            itemBuilder: (BuildContext context, int index) {
                              String hourLine = hoursOfTheDay[index];
                              return GestureDetector(
                                onTap: () => pickedStartHour = index,
                                child: GestureDetector(
                                  onTap: () => pickedEndHour = index,
                                  child: SizedBox(
                                    height: 40,
                                    child: Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Text(hourLine),
                                    ),
                                  ),
                                ),
                              );
                            },
                            separatorBuilder: (BuildContext context,
                                    int index) =>
                                const Divider(color: Colors.grey, height: 2),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.only(top: 16),
            width: 260,
            height: 80,
            child: ElevatedButton(
              style: confirmationButtonStyle,
              onPressed: () {
                pickedStartDay = DateTime(
                    pickedStartDay!.year,
                    pickedStartDay!.month,
                    pickedStartDay!.day,
                    pickedStartHour!);
                pickedEndDay = DateTime(pickedEndDay!.year, pickedEndDay!.month,
                    pickedEndDay!.day, pickedEndHour!);

                context
                    .read<FilterVehicleNotfier>()
                    .updateBookingDates(pickedStartDay!, pickedEndDay!);

                print(DateFormat.yMMMMEEEEd().format(pickedStartDay!));
              },
              child: const Text("Confirmer"),
            ),
          )
        ],
      ),
    );
  }
}
