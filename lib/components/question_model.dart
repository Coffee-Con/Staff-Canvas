import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'question_widget.dart' show QuestionWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class QuestionModel extends FlutterFlowModel<QuestionWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for ChoiceChips widget.
  FormFieldController<List<String>>? choiceChipsValueController;
  String? get choiceChipsValue =>
      choiceChipsValueController?.value?.firstOrNull;
  set choiceChipsValue(String? val) =>
      choiceChipsValueController?.value = val != null ? [val] : [];
  // Stores action output result for [Backend Call - API (UploadQuestionAnswer)] action in ChoiceChips widget.
  ApiCallResponse? apiResultfdh;
  // State field(s) for answer widget.
  FocusNode? answerFocusNode;
  TextEditingController? answerTextController;
  String? Function(BuildContext, String?)? answerTextControllerValidator;
  // Stores action output result for [Backend Call - API (UploadQuestionAnswer)] action in answer widget.
  ApiCallResponse? apiResultr7m;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    answerFocusNode?.dispose();
    answerTextController?.dispose();
  }

  /// Action blocks.
  Future test(BuildContext context) async {}
}
