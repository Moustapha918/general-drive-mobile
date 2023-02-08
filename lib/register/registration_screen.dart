import 'package:flutter/material.dart';
import 'package:general_mobile_drive/register/reg_five.dart';

import '../custom_widgets/custom_button.dart';
import '../extra/ccolors.dart';
import 'reg_four.dart';
import 'reg_one.dart';
import 'reg_three.dart';
import 'reg_two.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  @override
  int option = 0;

  Widget build(BuildContext context) {
    print("SCAFFOLD");
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.arrow_back_ios, color: CColors.blueColor),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        child: LinearProgressIndicator(
                          minHeight: 6,
                          backgroundColor: Colors.black12,
                          valueColor: const AlwaysStoppedAnimation<Color>(
                            Colors.yellow,
                          ),
                          value: (option == 0)
                              ? .2
                              : (option == 1)
                                  ? .4
                                  : (option == 2)
                                      ? .6
                                      : (option == 3)
                                          ? .8
                                          : .99,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.cancel_outlined,
                      color: CColors.blueColor,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                const Divider(
                  color: Colors.black38,
                ),
                const SizedBox(
                  height: 15,
                ),
                (option == 0)
                    ? const RegOne()
                    : (option == 1)
                        ? const RegTwo()
                        : (option == 2)
                            ? const RegThree()
                            : (option == 3)
                                ? const RegFour()
                                : const RegFive(),
                Expanded(
                  child: SizedBox(),
                ),
                const Divider(
                  color: Colors.black38,
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: GetButton(
                    text: 'Next',
                    w: 180,
                    onTap: () {
                      option++;
                      setState(
                        () {},
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
