import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart'; // Needed for NetworkImage

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Gradual Blur Effect'),
        ),
        child: Center(
          child: GradualBlurCard(),
        ),
      ),
    );
  }
}

class GradualBlurCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 360,
      height: 220,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), // Rounded corners for the card
        image: DecorationImage(
          image: Image.asset('assets/wheelchair_taxis_london.png').image,
          fit: BoxFit.cover,
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
                    colors: [CupertinoColors.systemGrey6.withOpacity(0), CupertinoColors.systemGrey6.withOpacity(0.8)],
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
                Icon(CupertinoIcons.battery_25, color: CupertinoColors.destructiveRed, size: 30),
                SizedBox(width: 10,),
                Text(
                  'Charge wheelchair before trip!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: CupertinoColors.black,
                    fontSize: 18,
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
