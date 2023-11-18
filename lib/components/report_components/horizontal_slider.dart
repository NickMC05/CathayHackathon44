import 'package:flutter/material.dart';

class HorizontalSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Calculate the width of the card. Assuming 2.5 cards are visible at a time.
    double cardWidth = MediaQuery.of(context).size.width / 2.5;
    final List<String> imagePaths = [
      'assets/wheelchair_taxis_london.png',
      'assets/shangri-la.jpg',
      'assets/british_museum.jpg',
    ];

    final List<String> image_title = [
      'Wheelchair taxi',
      'Shangri-la',
      'British Museums'
    ];

    return Container(
      height: 200, // Adjust the height as needed
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3, // Number of cards
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/trip_details', arguments: {
                'image_path': imagePaths[index],
                'image_title': image_title[index]
              });
            },
            child: Container(
              // width: cardWidth,
              height: 110,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                // color: Colors.grey[300],
              ),
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              child: Column(
                    children: [
                      Card(
                        child:Container(
                          width: 230,
                          height: 110,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            // color: Colors.grey[300],
                          ),
                          child: 
                              Image.asset(
                                imagePaths[index], // Replace with your image URL
                                fit: BoxFit.cover,)
                          ),
                      ),
                      SizedBox(height: 10.0),
                      Text(image_title[index])
                    ],
                  )
            ),
          );
        },
      ),
    );
  }
}
