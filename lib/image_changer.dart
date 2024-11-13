import 'dart:math';
import 'package:flutter/material.dart';

final randomizer = Random();

class ImageChanger extends StatefulWidget {
  const ImageChanger({super.key});

  @override
  State<ImageChanger> createState() => _ImageChangerState();
}

class _ImageChangerState extends State<ImageChanger> {
  var currentImage = 1;
  var totalScore = 0;

  void changeImage() {
    final randomNo = randomizer.nextInt(706) + 1;
    setState(() {
      currentImage = randomNo;
      totalScore += randomNo;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final imageSize = screenWidth * 1;
    final buttonPadding = EdgeInsets.symmetric(
      horizontal: screenWidth * 0.1,
      vertical: screenHeight * 0.02,
    );

    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: imageSize,
            height: imageSize,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Image.asset(
              "assets/images/image-$currentImage.jpg",
              errorBuilder: (context, error, stackTrace) {
                return const Center(
                  child: Text(
                    'Image not found',
                    style: TextStyle(color: Colors.red),
                  ),
                );
              },
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: screenHeight * 0.03),
          ElevatedButton(
            onPressed: changeImage,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
              padding: buttonPadding,
              textStyle: TextStyle(
                fontSize: screenWidth * 0.05,
                fontWeight: FontWeight.bold,
              ),
            ),
            child: const Text('Change Image'),
          ),
          SizedBox(height: screenHeight * 0.03),
          Text(
            'Total Score: $totalScore',
            style: TextStyle(
              fontSize: screenWidth * 0.06,
              color: Colors.white,
            ),
          ),
          SizedBox(height: screenHeight * 0.03),
          Text(
            'View Images To Get Score',
            style: TextStyle(
              fontSize: screenWidth * 0.06,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
