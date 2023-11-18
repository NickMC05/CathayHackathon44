import 'package:flutter_riverpod/flutter_riverpod.dart';

final surveyProvider =
    StateNotifierProvider<SurveyProvider, Map<String, List<String>>>(
        (ref) => SurveyProvider());

class SurveyProvider extends StateNotifier<Map<String, List<String>>> {
  SurveyProvider() : super({});

  void modifySurveyAnswer(String question, List<String> answer) {
    state[question] = answer;
  }

  bool isAnswered(String question) {
    return state.containsKey(question);
  }
}
