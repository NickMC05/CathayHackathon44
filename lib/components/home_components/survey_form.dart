import 'package:cathay/models/question_model.dart';
import 'package:cathay/providers/survey_provider.dart';
import 'package:country_list_pick/country_list_pick.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SurveyForm extends ConsumerStatefulWidget {
  final QuestionModel questionDetails;
  final void Function() toNextQuestion;

  const SurveyForm(
      {Key? key,
      required this.questionDetails,
      required this.toNextQuestion})
      : super(key: key);

  @override
  ConsumerState<SurveyForm> createState() => _SurveyFormState();
}

class _SurveyFormState extends ConsumerState<SurveyForm> {
  String? selectedChoice; // For single-select
  Set<String> selectedChoices = {}; // For multi-select

  @override
  Widget build(BuildContext context) {
    String questionText = widget.questionDetails.question;
    IconData questionIcon = widget.questionDetails.icon;
    String questionType = widget.questionDetails.type;
    return Material(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: _buildQuestion(questionText, questionIcon),
          ),
          questionType == "country-select"
              ? Card(
                  color: Colors.grey[100],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: _buildChoice("Country", questionType),
                  ))
              : Container(),


          ...widget.questionDetails.choices
              .map((choice) => Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: Card(
                        color: Colors.grey[100],
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15)),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: _buildChoice(choice, questionType),
                        )),
                  ))
              .toList(),
          CupertinoButton(
              child: const Text("Submit"),
              onPressed: () {
                if (questionType == "single-select" || questionType == "country-select") {
                  ref.read(surveyProvider.notifier).modifySurveyAnswer(
                      widget.questionDetails.question, [selectedChoice!]);
                } else if (questionType == "multi-select") {
                  ref.read(surveyProvider.notifier).modifySurveyAnswer(
                      widget.questionDetails.question,
                      selectedChoices.toList());
                }

                widget.toNextQuestion();
              })
        ],
      ),
    );
  }

  Widget _buildQuestion(String question, IconData icon) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Icon(icon, size: 40),
          const SizedBox(width: 15),
          Text(question,
              style:
                  const TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildChoice(String choice, String type) {
    if (type == "single-select") {
      // Your existing single-select code
      return RadioListTile<String>(
        title: Text(choice,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 24)),
        value: choice,
        groupValue: selectedChoice,
        onChanged: (String? value) {
          setState(() {
            selectedChoice = value;
          });
        },
      );
    } else if (type == "multi-select") {
      // Modified multi-select code
      return CheckboxListTile(
        title: Text(choice,
            style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 24)),

        value: selectedChoices.contains(choice),
        controlAffinity: ListTileControlAffinity
            .leading, // This line positions the checkbox on the left
        onChanged: (bool? value) {
          setState(() {
            if (value == true) {
              selectedChoices.add(choice);
            } else {
              selectedChoices.remove(choice);
            }
          });
        },
      );
    } else if (type == "country-select") {
      return CountryListPick(
        theme: CountryTheme(
          isShowFlag: true,
          isShowTitle: true,
          isShowCode: false,
          isDownIcon: true,
          showEnglishName: true,
          labelColor: Colors.black,
        ),
        initialSelection: selectedChoice,
        onChanged: (CountryCode? code) {
          setState(() {
            selectedChoice = code!.dialCode;
          });
        },
      );
    } else {
      return Text("Error: Invalid type");
    }
  }
}
