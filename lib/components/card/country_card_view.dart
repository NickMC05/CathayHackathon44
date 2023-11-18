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
                        Text("Overall score: ${info.score * 100}/100"),
                        Expanded(child: Container()),
                        Text("Start From: ${info.price}HKD"),
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
