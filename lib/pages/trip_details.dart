import 'package:cathay/components/trip_details_components/trip_image.dart';
import 'package:flutter/cupertino.dart';

class TripDetailsPage extends StatelessWidget {
  const TripDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    final imagePath = args['image_path'];
    final imageTitle = args['image_title'];

    return CupertinoPageScaffold(
      child: SafeArea(
        child: Column(
          children: [
             Align(alignment: Alignment.center, child: TripImage(imagePath: imagePath, imageTitle: imageTitle,)),

            Expanded(
              // Wrap the text container in an Expanded widget
              child: Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(imageTitle, style: const TextStyle(fontSize: 24)),
                    const SizedBox(height: 8),
                    Text(
                      'Lorem ipsum dolor sit amet, consectetur adipiscing elit...',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
