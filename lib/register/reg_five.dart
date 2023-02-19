import 'package:flutter/material.dart';

import '../extra/App_strings.dart';
import '../extra/ccolors.dart';

class RegFive extends StatefulWidget {
  RegFive({Key? key}) : super(key: key);

  @override
  State<RegFive> createState() => _RegFiveState();
}

class _RegFiveState extends State<RegFive> {
  int a = 22;

  int b = 35;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.setyourpricesperdayaccordingtodemand,
            style: TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Row(
                      children: [
                        getColorContainer(Colors.green.withOpacity(.3), () {

                        }),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          AppStrings.low,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      AppStrings.forexampleweekdaysinschoolterms,
                      style: TextStyle(color: Colors.black38),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "€$a",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.green,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: getContainer(Icons.remove, () {
                        a--;
                        setState(() {});
                      }),
                    ),
                    getContainer(Icons.add, () {
                      a++;
                      setState(() {});
                    })
                  ],
                ),
              )
            ],
          ),
          SizedBox(
            height: 40,
          ),
          Row(
            children: [
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    Row(
                      children: [
                        getColorContainer(Colors.green.withOpacity(.8), () {}),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text(
                          "Medium",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                      Text(
                      AppStrings.forexampleweekdaysinschoolterms,
                      style: TextStyle(color: Colors.black38),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "€$b",
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.green,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: getContainer(Icons.remove, () {
                        b--;
                        setState(() {});
                      }),
                    ),
                    getContainer(Icons.add, () {
                      b++;
                      setState(() {});
                    })
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget getContainer(IconData icon, Function() onTap) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black38),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Icon(
            icon,
            color: CColors.blueColor,
          ),
        ),
      ),
    );
  }

  Widget getColorContainer(Color col, Function() onTap) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 25,
        width: 25,
        decoration: BoxDecoration(
          color: col,
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
