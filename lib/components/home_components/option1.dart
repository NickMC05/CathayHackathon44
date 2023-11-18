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
  "Question 1: Your favorite color?": ["Red", "Blue", "Green", "Yellow", "Other"],
  "Question 2: Your favorite food?": ["Pizza", "Sushi", "Pasta", "Burger", "Other"],
  // Add more question-choices pairs as needed
};

  @override
  Widget build(BuildContext context) {
    var currentChoices = choices[questions[_currentIndex]] ?? [];
    return Column(
      children: <Widget>[
        SizedBox(height: 20), // Spacer
        // Navbar
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            questions.length,
            (index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: CupertinoButton(
                child: Text((index + 1).toString()),
                onPressed: () {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
            ),
          ),
        ),
        SurveyForm(question: questions[_currentIndex], choices: currentChoices)
      ],
    );
  }
}
