import 'package:flutter/material.dart';
import 'package:general_mobile_drive/car_details/car_image_widget.dart';

class CarImagesScreen extends StatefulWidget {
  const CarImagesScreen({Key? key}) : super(key: key);

  @override
  State<CarImagesScreen> createState() => _CarImagesScreenState();
}

class _CarImagesScreenState extends State<CarImagesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text(
              "Photos",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                  fontSize: 16),
            ),
            Text(
              "3/4",
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                  fontSize: 13),
            ),
          ],
        ),
        elevation: 0,
      ),
      body: Column(
        children: const [
          Divider(
            thickness: 1,
          ),
          CarImageWidget(),
        ],
      ),
    );
  }
}
