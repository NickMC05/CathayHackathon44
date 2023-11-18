import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SurveyForm extends StatefulWidget {
final String question;
final List<String> choices;

const SurveyForm({Key? key, required this.question, required this.choices}) : super(key: key);

@override
_SurveyFormState createState() => _SurveyFormState();
}

class _SurveyFormState extends State<SurveyForm> {
  List<String> _selectedChoices = [];

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(widget.question, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          ),
          ...widget.choices.map((choice) => CheckboxListTile(
              title: Text(choice),
              value: _selectedChoices.contains(choice),
              onChanged: (bool? value) {
                setState(() {
                  if (value == true) {
                    _selectedChoices.add(choice);
                  } else {
                    _selectedChoices.remove(choice);
                  }
                });
              },
          )).toList(),
        ],
      ),
    );
  }
}
