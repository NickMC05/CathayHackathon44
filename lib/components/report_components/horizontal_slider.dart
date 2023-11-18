import 'package:flutter/material.dart';


class HorizontalSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Calculate the width of the card. Assuming 2.5 cards are visible at a time.
    double cardWidth = MediaQuery.of(context).size.width / 2.5;

    return Container(
      height: 200, // Adjust the height as needed
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10, // Number of cards
        itemBuilder: (context, index) {
          return Container(
            // width: cardWidth,
            height: 110,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              // color: Colors.grey[300],
            ),
            margin: EdgeInsets.symmetric(horizontal: 8, vertical: 10),
            child: Card(
              child: 
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    // color: Colors.grey[300],
                  ),
                  child: Image.network(
                    'https://www.syfy.com/sites/syfy/files/styles/scale_1280/public/2019/11/courage-the-cowardly-dog.jpg', // Replace with your image URL
                    fit: BoxFit.cover,
                ),
                 )
              
            ),
          );
        },
      ),
    );
  }
}
