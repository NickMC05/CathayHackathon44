import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TripImage extends StatelessWidget {
  final String imagePath;
  final String imageTitle;
  const TripImage(
      {super.key, required this.imagePath, required this.imageTitle});
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
                    colors: [
                      CupertinoColors.systemGrey6.withOpacity(0),
                      Color.fromARGB(255, 26, 26, 26).withOpacity(0.6)
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              left: 0,
              right: 0,
              bottom: 10, // Adjust the position as needed
              child: Container(
                padding: const EdgeInsets.all(10.0),
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      imageTitle,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        color: CupertinoColors.white,
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Universal Stay Score: 5", style: TextStyle(
                          color: Color.fromARGB(255, 231, 229, 229),
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),),
                        Icon(CupertinoIcons.star_fill, color: Colors.white,)
                      ],
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
