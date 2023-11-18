import 'dart:math';

import 'package:cathay/components/card/country_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CountryRankView extends StatelessWidget {
  final int ranking;
  final CountryCard info;
  const CountryRankView({
    super.key,
    required this.ranking,
    required this.info,
  });
  static Random random = Random();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        child: Card(
          elevation: 1,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          color: Colors.grey.shade100,
          child: Row(
            children: [
              Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: SizedBox(
                      width: 150,
                      height: 200,
                      child: Image.network(
                          "https://picsum.photos/id/${random.nextInt(500)}/150/200/"),
                    ),
                  ),
                  Positioned(
                    left: 10,
                    bottom: 20,
                    child: Container(
                      height: 30,
                      width: 70,
                      decoration: BoxDecoration(
                        color: const Color(0xff57B48D),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Text(
                          "Rank #$ranking",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                  ),
                  child: SizedBox(
                    height: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 10),
                        Text(
                          info.title,
                          style: const TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 20),
                        ),
                        Text("AI Score: ${info.score * 100}/100"),
                        Expanded(
                            child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(children: [
                              Icon(
                                Icons.star,
                                color: Colors.yellow.shade700,
                              ),
                              Text(
                                info.review.toString(),
                                style: TextStyle(color: Colors.yellow.shade700),
                              ),
                              const Text(" (47) reviews")
                            ]),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: const Color(0xff57B48D)),
                              child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  child: Text(
                                    info.tag,
                                    style: const TextStyle(color: Colors.white),
                                  )),
                            ),
                          ],
                        )),
                        Text("Ticket price: ${info.price}HKD"),
                        const SizedBox(height: 10),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {
    super.key,
    required this.gradient,
    this.style,
  });

  final String text;
  final TextStyle? style;
  final Gradient gradient;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style),
    );
  }
}
