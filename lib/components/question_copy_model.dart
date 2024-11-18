import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'question_copy_widget.dart' show QuestionCopyWidget;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class QuestionCopyModel extends FlutterFlowModel<QuestionCopyWidget> {
  ///  Local state fields for this component.

  String selectedText = 'null';

  dynamic answer;

  ///  State fields for stateful widgets in this component.

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
}
