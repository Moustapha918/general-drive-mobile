import 'package:deyd_kata_flutter/filter_vehicle_notifier.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class BookingDatesModal extends StatefulWidget {
  BookingDatesModal({
    Key? key,
    required this.availableDate,
    required this.hoursOfTheDay,
  }) : super(key: key);

  final List<DateTime> availableDate;
  final List hoursOfTheDay;

  @override
  State<BookingDatesModal> createState() => _BookingDatesModalState();
}

class _BookingDatesModalState extends State<BookingDatesModal> {
  DateTime? pickedStartDay;

  DateTime? pickedEndDay;

  int? pickedStartHour;

  int? pickedEndHour;

  int? _pickedStartDayIndex;
  int? _pickedEndDayIndex;

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
                  toolbarHeight: 10,
                  bottom: TabBar(
                    // padding: const EdgeInsets.only(top: 10),
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
                            pickedStartDay != null && pickedStartHour != null
                                ? DateFormat.MEd().format(pickedStartDay!) +
                                    ' à ' +
                                    pickedStartHour.toString() +
                                    'H'
                                : 'Choisir ...',
                            style: const TextStyle(color: Colors.black),
                          )
                        ],
                      )),
                      Tab(
                        child: Column(
                          children: [
                            const Text(
                              'Date Fin',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              pickedEndDay != null && pickedEndHour != null
                                  ? DateFormat.MEd().format(pickedEndDay!) +
                                      ' à ' +
                                      pickedEndHour.toString() +
                                      'H'
                                  : 'Choisir ...',
                              style: const TextStyle(color: Colors.black),
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
                              itemCount: widget.availableDate.length,
                              itemBuilder: (BuildContext context, int index) {
                                String dateLine;
                                if (index == 0) {
                                  dateLine = 'Aujourd\'hui';
                                } else {
                                  dateLine = DateFormat.yMMMEd()
                                      .format(widget.availableDate[index]);
                                }

                                return Container(
                                  color: _pickedStartDayIndex == index
                                      ? const Color.fromRGBO(0, 0, 0, 0.3)
                                      : Colors.white,
                                  child: SizedBox(
                                    height: 40,
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _pickedStartDayIndex = index;
                                          pickedStartDay =
                                              widget.availableDate[index];
                                        });
                                      },
                                      child: SizedBox(
                                        child: Padding(
                                          padding: const EdgeInsets.all(6.0),
                                          child: Text(dateLine),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return const Divider(
                                    color: Colors.grey, thickness: 0.6);
                              }),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: ListView.separated(
                            padding: const EdgeInsets.all(14),
                            itemCount: widget.hoursOfTheDay.length,
                            itemBuilder: (BuildContext context, int index) {
                              String hourLine = widget.hoursOfTheDay[index];

                              return Container(
                                color: pickedStartHour == index
                                    ? const Color.fromRGBO(0, 0, 0, 0.3)
                                    : Colors.white,
                                child: GestureDetector(
                                  onTap: () => setState(() {
                                    pickedStartHour = index;
                                  }),
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
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const Divider(
                                        color: Colors.grey, thickness: 0.6),
                          ),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ListView.separated(
                            padding: const EdgeInsets.all(14),
                            itemCount: widget.availableDate.length,
                            itemBuilder: (BuildContext context, int index) {
                              String dateLine = DateFormat.yMMMEd()
                                  .format(widget.availableDate[index]);

                              return Container(
                                color: _pickedEndDayIndex == index
                                    ? const Color.fromRGBO(0, 0, 0, 0.3)
                                    : Colors.white,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      pickedEndDay =
                                          widget.availableDate[index];
                                      _pickedEndDayIndex = index;
                                    });
                                  },
                                  child: SizedBox(
                                    height: 40,
                                    child: Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Text(dateLine),
                                    ),
                                  ),
                                ),
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) =>
                                    const Divider(
                                        color: Colors.grey, thickness: 0.6),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: ListView.separated(
                            padding: const EdgeInsets.all(14),
                            itemCount: widget.hoursOfTheDay.length,
                            itemBuilder: (BuildContext context, int index) {
                              String hourLine = widget.hoursOfTheDay[index];

                              return Container(
                                color: pickedEndHour == index
                                    ? const Color.fromRGBO(0, 0, 0, 0.3)
                                    : Colors.white,
                                child: GestureDetector(
                                  onTap: () => setState(() {
                                    pickedEndHour = index;
                                  }),
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
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const Divider(
                                  color: Colors.grey, thickness: 0.6);
                            },
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
            height: 60,
            child: ElevatedButton(
              style: confirmationButtonStyle,
              onPressed: (false != null &&
                      pickedEndDay != null &&
                      pickedStartHour != null &&
                      pickedEndHour != null)
                  ? () {
                      pickedStartDay = DateTime(
                          pickedStartDay!.year,
                          pickedStartDay!.month,
                          pickedStartDay!.day,
                          pickedStartHour!);
                      pickedEndDay = DateTime(
                          pickedEndDay!.year,
                          pickedEndDay!.month,
                          pickedEndDay!.day,
                          pickedEndHour!);

                      context
                          .read<FilterVehicleNotfier>()
                          .updateBookingDates(pickedStartDay!, pickedEndDay!);
                    }
                  : null,
              child: const Text("Confirmer"),
            ),
          )
        ],
      ),
    );
  }
}
