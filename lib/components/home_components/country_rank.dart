import 'package:cathay/components/card/country_card.dart';
import 'package:cathay/components/card/country_card_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Recommendations extends StatelessWidget {
  Recommendations ({super.key});

  static const List<String> topRow = [
    "All",
    "Asia",
    "Europe",
    "US",
    "Australia",
    ""
  ];

  final countries = [
    CountryCard("Ulaanbaatar, Mongolia", 0.91, 0.78, 0.86, 0.92, 0.97, 2345,
        4.9, "Best in the world"),
    CountryCard(
        "Beijing, China", 0.91, 0.78, 0.86, 0.92, 0.97, 2545, 3.2, "sus"),
    CountryCard(
        "Singapore", 0.91, 0.78, 0.86, 0.92, 0.97, 986, 1.2, "Very safe"),
    CountryCard("Bali, Indonesia", 0.91, 0.78, 0.86, 0.92, 0.97, 1344, 3.3,
        "Safe food"),
    CountryCard("Islavabat, Pakistani", 0.91, 0.78, 0.86, 0.92, 0.97, 6784, 4.1,
        "Nice People"),
    CountryCard("Ulaanbaatar, Mongolia", 0.91, 0.78, 0.86, 0.92, 0.97, 1234,
        5.0, "Best transportation"),
    CountryCard("Ulaanbaatar, Mongolia", 0.91, 0.78, 0.86, 0.92, 0.97, 4321, 5,
        "Best Hotels"),
    CountryCard("Ulaanbaatar, Mongolia", 0.91, 0.78, 0.86, 0.92, 0.97, 5643, 5,
        "Best Entertainment"),
    CountryCard("Ulaanbaatar, Mongolia", 0.91, 0.78, 0.86, 0.92, 0.97, 753, 5,
        "Wheelchair friendly"),
    CountryCard("Ulaanbaatar, Mongolia", 0.91, 0.78, 0.86, 0.92, 0.97, 984, 5,
        "Smart City"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CupertinoColors.white,
      child: Column(
        children: [
          SizedBox(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: topRow.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.only(
                      left: 10, right: 10, top: 10, bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Center(
                      child: Text(
                        topRow[index],
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: countries.length,
              itemBuilder: (context, index) {
                return CountryRankView(
                  ranking: index + 1,
                  info: countries[index],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
