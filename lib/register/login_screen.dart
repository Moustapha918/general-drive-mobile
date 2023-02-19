import 'package:flutter/material.dart';
import 'package:general_mobile_drive/dashboard/dashboard_screen.dart';

import '../extra/App_strings.dart';
import '../extra/ccolors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white38.withOpacity(.9),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 80,
            ),
            Text(
              AppStrings.account,
              style: TextStyle(
                color: Colors.black,
                fontSize: 50,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DashboardScreen(),
                          ));
                    },
                    child: Row(
                      children: [
                        Icon(Icons.login),
                        SizedBox(width: 10),
                        Text(AppStrings.login),
                      ],
                    ),
                  ),
                  const Divider(),
                  Row(
                    children: [
                      Icon(Icons.account_circle_sharp),
                      SizedBox(width: 10),
                      Text(AppStrings.signUp),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: Icon(Icons.car_rental, size: 50),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${AppStrings.ownaCar}?",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          AppStrings.earnupto3000permonthbysharingit,
                          style: TextStyle(
                            color: Colors.black38,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                children: [
                  getRow(AppStrings.helpCenter, Icons.question_mark),
                  getRow(AppStrings.contactGetaround, Icons.mail),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                '${AppStrings.version} 8.6.4',
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getRow(String txt1, IconData icon) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              icon,
              size: 20,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              txt1,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
        Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: Icon(
              Icons.arrow_forward_ios_rounded,
              color: CColors.textColor,
              size: 15,
            )),
      ],
    );
  }
}
