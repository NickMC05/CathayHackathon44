import 'package:cathay/components/trip_details_components/trip_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CountryStatisticsPage extends StatelessWidget {
  const CountryStatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    // final imagePath = args['image_path'];
    // final imageTitle = args['image_title'];

    var screenWidth = MediaQuery.of(context).size.width;

    return CupertinoPageScaffold(
      child: Stack(
        children: [
          SafeArea(
            child: Column(
              children: [
                // Align(
                //   alignment: Alignment.center,
                //   child: TripImage(
                //     imagePath: imagePath,
                //     imageTitle: imageTitle,
                //   ),
                // ),
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Image.network('https://picsum.photos/250?image=9', fit: BoxFit.fill),
                        SizedBox(height: 8),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(children: [
                            Text(
                            "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Nullam eget nisl. Nullam rhoncus aliquam metus. Nunc dapibus tortor vel mi dapibus sollicitudin. Integer rutrum, orci vestibulum ullamcorper ultricies, lacus quam ultricies odio, vitae placerat pede sem sit amet enim. Duis pulvinar. Fusce aliquam vestibulum ipsum.",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: 10),
                          ],),
                        )
                      ],
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
                  color: Color.fromARGB(255, 3, 3, 3),
                  size: 30 //change your color here
                ),
                backgroundColor: Colors.transparent, // Set to transparent color
              )),
        ],
      ),
    );
  }
}
