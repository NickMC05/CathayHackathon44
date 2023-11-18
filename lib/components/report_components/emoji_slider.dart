import 'package:flutter/material.dart';

class EmojiSlider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Calculate the width of the card. Assuming 2.5 cards are visible at a time.
    double cardWidth = MediaQuery.of(context).size.width / 2.5;
    final List<String> display = [
      "🐶",
      "💬",
      "🛡️"
    ];

    final List<String> image_title = [
      'Guide Dog Import',
      'Assistance Request Form',
      'Insurance Coverage'
    ];

    return SizedBox(
      height: 200, // Adjust the height as needed
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3, // Number of cards
        itemBuilder: (context, index) {
          return Container(
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
                          Align(
                            alignment: Alignment.center,
                            child: Text(display[index], style: TextStyle(fontSize: 84),)
                    ))),
                  const SizedBox(height: 10.0),
                  Text(image_title[index])
                ],
                )
          );
        },
      ),
    );
  }
}
