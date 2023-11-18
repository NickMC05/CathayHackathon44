import 'package:cathay/components/home_components/survey_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SurveyPage extends StatefulWidget {
  const SurveyPage({super.key});

  @override
  _SurveyPageState createState() => _SurveyPageState();
}

class _SurveyPageState extends State<SurveyPage> {
  int _currentIndex = 0;

  final List<String> questions = [
    "Question 1: Your favorite color?",
    "Question 2: Your favorite food?",
    // Add more questions as needed
  ];

  final Map<String, List<String>> choices = {
    "Question 1: Your favorite color?": [
      "Red",
      "Blue",
      "Green",
      "Yellow",
      "Other"
    ],
    "Question 2: Your favorite food?": [
      "Pizza",
      "Sushi",
      "Pasta",
      "Burger",
      "Other"
    ],
    // Add more question-choices pairs as needed
  };

  @override
  Widget build(BuildContext context) {
    var currentChoices = choices[questions[_currentIndex]] ?? [];

    int myChoice = -1;

    return Column(
      children: <Widget>[
        const SizedBox(height: 20), // Spacer
        // Navbar
        SizedBox(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(
              questions.length + 1,
              (index) => index == 0
                  ? const SizedBox(width: 20)
                  : Container(
                      margin: const EdgeInsets.only(left: 5),
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        color: const Color(0xff57b48d),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          index.toString(),
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
            ),
          ),
        ),
        Expanded(
          child: SurveyForm(
            question: questions[_currentIndex],
            choices: currentChoices,
          ),
        )
      ],
    );
  }
}
