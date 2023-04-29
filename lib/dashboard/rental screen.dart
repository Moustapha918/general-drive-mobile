import 'package:flutter/material.dart';
import 'package:general_mobile_drive/extra/App_strings.dart';

import '../custom_widgets/custom_sized_box.dart';
import '../extra/ccolors.dart';
import 'in_progess_screen.dart';


class RentalsDetailScreen extends StatefulWidget {
  const RentalsDetailScreen({Key? key}) : super(key: key);

  @override
  State<RentalsDetailScreen> createState() => _RentalsDetailScreenState();
}

class _RentalsDetailScreenState extends State<RentalsDetailScreen> {
  TextEditingController searchController = TextEditingController();
  int selectIndex = 0;
  String searchQuery = '';

  void updateSearchQuery(String query) {
    setState(() {
      searchQuery = query;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              sizedBox40,
               const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
                child: Text(
                  AppStrings.rentals,
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: SizedBox(
                  height: 45,
                  child: TextField(
                    controller: searchController,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(0),
                      prefixIcon: const Icon(Icons.search_outlined),
                      hintText: AppStrings.searchForRental,
                      fillColor: CColors.gOffWhite,
                      filled: true,
                      border: InputBorder.none,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: CColors.gOffWhite),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: const BorderSide(color: CColors.gOffWhite),
                      ),
                    ),
                    onChanged: updateSearchQuery,
                  ),
                ),
              ),
              sizedBox15,
              Expanded(
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.all(10),
                      height: 50,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color:  CColors.gOffWhite,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 2, vertical: 6),
                        child: TabBar(
                          onTap: (index) {
                            setState(() {
                              selectIndex = index;
                            });
                          },
                          labelPadding:
                          const EdgeInsets.symmetric(horizontal: 05),
                          indicatorColor: CColors.gOffWhite,
                          tabs: [
                            selectIndex != 0
                                ? const Text(
                              '${AppStrings.upComing} (0)',
                              style: TextStyle(
                                  color: CColors.gBlack, fontSize: 15),
                            )
                                : Container(
                              width: 130,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                // color: const Color(0xffe9e9e9)),
                                color: CColors.gWhite,
                              ),
                              child: const Center(
                                child: Text(
                                  '${AppStrings.upComing} (0)',
                                  style: TextStyle(
                                      color: CColors.gBlack, fontSize: 15),
                                ),
                              ),
                            ),
                            selectIndex != 1
                                ? const Text(
                              '${AppStrings.inProgress} (0)',
                              style: TextStyle(
                                  color: CColors.gBlack, fontSize: 15),
                            )
                                : Container(
                              width: 130,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                // color: const Color(0xffe9e9e9)),
                                color: CColors.gWhite,
                              ),
                              child: const Center(
                                child: Text(
                                  '${AppStrings.inProgress} (0)',
                                  style: TextStyle(
                                      color: CColors.gBlack, fontSize: 15),
                                ),
                              ),
                            ),
                            selectIndex != 2
                                ? const Text(
                              AppStrings.ended,
                              style: TextStyle(
                                  color: CColors.gBlack, fontSize: 15),
                            )
                                : Container(
                              width: 130,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                // color: const Color(0xffe9e9e9)),
                                color: CColors.gWhite,
                              ),
                              child: const Center(
                                child: Text(
                                  AppStrings.ended,
                                  style: TextStyle(
                                      color: CColors.gBlack, fontSize: 18),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        physics: const NeverScrollableScrollPhysics(),
                        children: [
                          InProgressScreen(
                            searchQuery: searchQuery,
                          ),
                          InProgressScreen(
                            searchQuery: searchQuery,
                          ),
                          InProgressScreen(
                            searchQuery: searchQuery,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
