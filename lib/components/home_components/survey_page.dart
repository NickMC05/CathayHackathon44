import 'package:cathay/components/home_components/survey_form.dart';
import 'package:cathay/models/question_model.dart';
import 'package:cathay/providers/survey_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SurveyPage extends ConsumerStatefulWidget {
  const SurveyPage({super.key});

  @override
  ConsumerState<SurveyPage> createState() => _SurveyPageState();

}

class _SurveyPageState extends ConsumerState<SurveyPage> {
  int _currentIndex = 0;

  // 3 Types of Questions : single-select, multi-select, country-select
  final List<QuestionModel> questions = [
    QuestionModel(question: "Where do you want to go?", type: "country-select", icon: Icons.public),
    QuestionModel(question: "Accessories", type: "multi-select", icon: Icons.accessibility_rounded, choices: ["Wheelchair", "Walking Stick", "Earpiece", "Crutch", "Stroller"]),
    QuestionModel(question: "Do you need special seating arrangement?", type: "single-select", icon: Icons.money, choices: ["Yes", "No"]),
  ];



  @override
  Widget build(BuildContext context) {

    void nextQuestion() {
      if (_currentIndex < questions.length - 1) {
        setState(() {
          _currentIndex++;
        });
      }
    }

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
                  : GestureDetector(
                    onTap: (){
                      setState(() {
                        _currentIndex = index - 1;
                      });
                    },
                    child: Container(
                        margin: const EdgeInsets.only(left: 5),
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          color: ref.read(surveyProvider.notifier).isAnswered(questions[index-1].question) ? Color(0xff57b48d) : Colors.grey[300],
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
        ),
        SingleChildScrollView(
          child: Expanded(
            child: SurveyForm(
              questionDetails: questions[_currentIndex],
              toNextQuestion: nextQuestion,
            ),
          ),
        )
      ],
    );
  }
}
