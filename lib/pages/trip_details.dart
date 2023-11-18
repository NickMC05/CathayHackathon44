import 'package:cathay/components/trip_details_components/trip_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TripDetailsPage extends StatelessWidget {
  const TripDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    final imagePath = args['image_path'];
    final imageTitle = args['image_title'];

    var screenWidth = MediaQuery.of(context).size.width;

    return CupertinoPageScaffold(
      child: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.center,
                  child: TripImage(
                    imagePath: imagePath,
                    imageTitle: imageTitle,
                  ),
                ),
                Expanded(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 8),
                          Text(
                            imageTitle == "Shangri-la"
                                ? "With world-class staff trained to deal with every contingency, thoughtfully placed lifts and ramps, as well as impeccably diverse menu, you can't find a better hotel for people with mobility impairment and seafood allergies."
                                : "Wheelchair Taxi service offers comfortable, safe transport for those with mobility challenges. Vehicles feature spacious interiors, secure wheelchair spots, and easy-to-use ramps. Trained drivers ensure a smooth, dignified journey, meeting all accessibility needs. Ideal for daily commutes or special occasions, we provide reliable, respectful, barrier-free transportation solutions",
                            style: const TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 10),
                          Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Image.asset(
                                  imageTitle == "Shangri-la"
                                      ? "assets/hotels.jpg"
                                      : "assets/taxi_disabled.jpeg",
                                  width: screenWidth / 1.5))
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AppBar(
                iconTheme: const IconThemeData(
                  color: Color.fromARGB(255, 118, 117, 117), //change your color here
                ),
                backgroundColor: Colors.transparent, // Set to transparent color
              )),
        ],
      ),
    );
  }
}
