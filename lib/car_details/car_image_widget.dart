import 'dart:io';

import 'package:flutter/material.dart';
import 'package:general_mobile_drive/extra/ccolors.dart';
import 'package:images_picker/images_picker.dart';

class CarImageWidget extends StatefulWidget {
  final String imageInfoText;
  final Function(File image) onImageAdd;
  final String imageContainerText;

  const CarImageWidget({
    Key? key,
    required this.imageInfoText,
    required this.imageContainerText, required this.onImageAdd,
  }) : super(key: key);

  @override
  State<CarImageWidget> createState() => _CarImageWidgetState();
}

class _CarImageWidgetState extends State<CarImageWidget> {
  File? image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: buildImage(),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                // "Voir l'exemple (% Arriére)",
                widget.imageInfoText,
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 18),
              ),
              const Icon(Icons.info_outline),

            ],
          ),
          const SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

  Widget buildImage() {
    if (image == null) {
      return GestureDetector(
        onTap: () {
          pickImage();
        },
        child: Container(
          width: double.infinity,
          height: 200,
          decoration: const BoxDecoration(color: Color(0xfff7e6f5)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                // "Intérieur",
                widget.imageContainerText,
                style: TextStyle(
                    color: CColors.blueColor, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 5,
              ),
              Icon(
                Icons.add_circle,
                color: CColors.blueColor,
              ),
            ],
          ),
        ),
      );
    }

    return Image(
      width: double.infinity,
      height: 200,
      fit: BoxFit.cover,
      // image: AssetImage("assets/images/car.jpg"),
      image: FileImage(image!),
    );
  }

  void pickImage() async {
    var file = await ImagesPicker.openCamera(
      cropOpt: CropOption(),
      pickType: PickType.image,
      maxSize: 500,
      quality: 0.6,
    );
    if (file != null) {
      image = File(file.first.path);
      widget.onImageAdd(image!);
      setState(() {});
    }
  }
}