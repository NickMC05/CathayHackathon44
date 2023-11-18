import 'dart:ui';

import 'package:flutter/cupertino.dart';

class TripImage extends StatelessWidget {
  final String imagePath;
  final String imageTitle;
  const TripImage({super.key, required this.imagePath, required this.imageTitle});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), // Rounded corners for the card
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.fitHeight,
        ),
      ),
      child: Stack(
        children: <Widget>[
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 0, sigmaY: 0),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [CupertinoColors.systemGrey6.withOpacity(0), const Color.fromARGB(255, 79, 79, 81).withOpacity(0.2)],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 10, // Adjust the position as needed
            child:
              Container(
                padding: const EdgeInsets.all(10.0),
                alignment: Alignment.center,
                child: Row(children: [
                Text(
                  imageTitle,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: CupertinoColors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
              )
              
          ),
        ],
      ),
    );
  }
}