import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final surveyProvider =
    StateNotifierProvider<SurveyProvider, Map<String, List<String>>>(
        (ref) => SurveyProvider());

class SurveyProvider extends StateNotifier<Map<String, List<String>>> {
  SurveyProvider() : super({});

  void modifySurveyAnswer(String question, List<String> answer) {
    state[question] = answer;
  }

  void submitSurvey(BuildContext context) async {
    // Step 1: Show the Cupertino loading screen
    showCupertinoModalPopup(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Center(
          child: Container(
            width: 200.0,
            height: 200.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CupertinoActivityIndicator(radius: 20.0),
                  SizedBox(height: 10.0),
                  Text(
                    'Generating Report...',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );

    // Step 2: Wait for 3 seconds
    await Future.delayed(const Duration(seconds: 3));

    // Step 3: Navigate to the report page
    Navigator.pop(context); // Close the Cupertino loading screen
    // ignore: use_build_context_synchronously
    Navigator.pushNamed(context, '/report');
  }

  bool isAnswered(String question) {
    return state.containsKey(question);
  }
}
