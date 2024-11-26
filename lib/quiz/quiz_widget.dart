import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/backend/schema/structs/index.dart';
import '/components/question_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'quiz_model.dart';
export 'quiz_model.dart';

class QuizWidget extends StatefulWidget {
  const QuizWidget({
    super.key,
    int? quizID,
    required this.courseID,
    String? quizName,
  })  : this.quizID = quizID ?? 1,
        this.quizName = quizName ?? 'Quiz';

  final int quizID;
  final int? courseID;
  final String quizName;

  @override
  State<QuizWidget> createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  late QuizModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuizModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        appBar: AppBar(
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          automaticallyImplyLeading: false,
          title: Text(
            widget!.quizName,
            style: FlutterFlowTheme.of(context).displaySmall.override(
                  fontFamily: 'Outfit',
                  letterSpacing: 0.0,
                ),
          ),
          actions: [],
          centerTitle: false,
          elevation: 0.0,
        ),
        body: SafeArea(
          top: true,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: FutureBuilder<ApiCallResponse>(
                  future: ApiGroup.getQuestionsDetailCall.call(
                    quizID: widget!.quizID,
                    token: currentAuthenticationToken,
                  ),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50.0,
                          height: 50.0,
                          child: CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(
                              FlutterFlowTheme.of(context).primary,
                            ),
                          ),
                        ),
                      );
                    }
                    final columnGetQuestionsDetailResponse = snapshot.data!;

                    return Builder(
                      builder: (context) {
                        final question = (columnGetQuestionsDetailResponse
                                    .jsonBody
                                    .toList()
                                    .map<QuestionStruct?>(
                                        QuestionStruct.maybeFromMap)
                                    .toList() as Iterable<QuestionStruct?>)
                                .withoutNulls
                                ?.toList() ??
                            [];

                        return SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:
                                List.generate(question.length, (questionIndex) {
                              final questionItem = question[questionIndex];
                              return wrapWithModel(
                                model: _model.questionModels.getModel(
                                  questionItem.questionID.toString(),
                                  questionIndex,
                                ),
                                updateCallback: () => safeSetState(() {}),
                                updateOnChange: true,
                                child: QuestionWidget(
                                  key: Key(
                                    'Key66n_${questionItem.questionID.toString()}',
                                  ),
                                  questionID: questionItem.questionID,
                                  quizID: widget!.quizID,
                                  questionType: valueOrDefault<int>(
                                    questionItem.questionType,
                                    1,
                                  ),
                                ),
                              );
                            }),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Padding(
                    padding:
                        EdgeInsetsDirectional.fromSTEB(0.0, 32.0, 0.0, 32.0),
                    child: FFButtonWidget(
                      onPressed: () async {
                        _model.answer = await ApiGroup.getQuizAnswerCall.call(
                          userID: currentUserData?.userID,
                          quizID: widget!.quizID,
                          token: currentAuthenticationToken,
                        );

                        _model.apiResultl0x =
                            await ApiGroup.submitQuizCall.call(
                          userID: currentUserData?.userID,
                          quizID: widget!.quizID,
                          answerJson: (_model.answer?.jsonBody ?? ''),
                          token: currentAuthenticationToken,
                        );

                        if ((_model.apiResultl0x?.succeeded ?? true)) {
                          context.pushNamed(
                            'QuizScore',
                            queryParameters: {
                              'submitID': serializeParam(
                                getJsonField(
                                  (_model.apiResultl0x?.jsonBody ?? ''),
                                  r'''$.ID''',
                                ),
                                ParamType.int,
                              ),
                              'score': serializeParam(
                                getJsonField(
                                  (_model.apiResultl0x?.jsonBody ?? ''),
                                  r'''$.Score''',
                                ),
                                ParamType.int,
                              ),
                              'courseID': serializeParam(
                                widget!.courseID,
                                ParamType.int,
                              ),
                            }.withoutNulls,
                          );
                        }

                        safeSetState(() {});
                      },
                      text: FFLocalizations.of(context).getText(
                        'douf1we5' /* Submit */,
                      ),
                      options: FFButtonOptions(
                        width: 300.0,
                        height: 50.0,
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        iconPadding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 0.0),
                        color: FlutterFlowTheme.of(context).primary,
                        textStyle:
                            FlutterFlowTheme.of(context).titleSmall.override(
                                  fontFamily: 'Readex Pro',
                                  color: Colors.white,
                                  letterSpacing: 0.0,
                                ),
                        elevation: 3.0,
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(40.0),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
