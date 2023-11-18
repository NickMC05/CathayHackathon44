import 'package:flutter/cupertino.dart';

class QuestionModel{
  String question;
  String type;
  IconData icon;
  List<String> choices;

  QuestionModel({required this.question, required this.type, required this.icon, this.choices = const []});
}