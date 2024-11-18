import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/question_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'quiz_widget.dart' show QuizWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class QuizModel extends FlutterFlowModel<QuizWidget> {
  ///  Local state fields for this page.

  List<dynamic> userAnswers = [];
  void addToUserAnswers(dynamic item) => userAnswers.add(item);
  void removeFromUserAnswers(dynamic item) => userAnswers.remove(item);
  void removeAtIndexFromUserAnswers(int index) => userAnswers.removeAt(index);
  void insertAtIndexInUserAnswers(int index, dynamic item) =>
      userAnswers.insert(index, item);
  void updateUserAnswersAtIndex(int index, Function(dynamic) updateFn) =>
      userAnswers[index] = updateFn(userAnswers[index]);

  ///  State fields for stateful widgets in this page.

  // Models for Question dynamic component.
  late FlutterFlowDynamicModels<QuestionModel> questionModels;
  // Stores action output result for [Backend Call - API (getQuizAnswer)] action in Button widget.
  ApiCallResponse? answer;
  // Stores action output result for [Backend Call - API (SubmitQuiz)] action in Button widget.
  ApiCallResponse? apiResultl0x;

  @override
  void initState(BuildContext context) {
    questionModels = FlutterFlowDynamicModels(() => QuestionModel());
  }

  @override
  void dispose() {
    questionModels.dispose();
  }
}
