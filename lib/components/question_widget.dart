import '/auth/custom_auth/auth_util.dart';
import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_choice_chips.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'question_model.dart';
export 'question_model.dart';

class QuestionWidget extends StatefulWidget {
  const QuestionWidget({
    super.key,
    this.questionID,
    required this.quizID,
    required this.questionType,
  });

  final int? questionID;
  final int? quizID;
  final int? questionType;

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  late QuestionModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => QuestionModel());

    _model.answerTextController ??= TextEditingController();
    _model.answerFocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(16.0, 16.0, 16.0, 16.0),
      child: FutureBuilder<ApiCallResponse>(
        future: ApiGroup.getQuestionDetailCall.call(
          questionID: widget!.questionID,
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
          final containerGetQuestionDetailResponse = snapshot.data!;

          return Container(
            width: MediaQuery.sizeOf(context).width * 1.0,
            decoration: BoxDecoration(
              color: FlutterFlowTheme.of(context).secondaryBackground,
              boxShadow: [
                BoxShadow(
                  blurRadius: 4.0,
                  color: Color(0x33000000),
                  offset: Offset(
                    0.0,
                    2.0,
                  ),
                  spreadRadius: 0.0,
                )
              ],
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: GestureDetector(
                onScaleUpdate: (details) async {
                  _model.selectedText = _model.choiceChipsValue!;
                  safeSetState(() {});
                },
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      valueOrDefault<String>(
                        getJsonField(
                          containerGetQuestionDetailResponse.jsonBody,
                          r'''$.Question''',
                        )?.toString(),
                        '???',
                      ),
                      style: FlutterFlowTheme.of(context).bodyLarge.override(
                            fontFamily: 'Readex Pro',
                            letterSpacing: 0.0,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                    if (widget!.questionType == 1)
                      Align(
                        alignment: AlignmentDirectional(-1.0, 0.0),
                        child: FlutterFlowChoiceChips(
                          options: (getJsonField(
                            containerGetQuestionDetailResponse.jsonBody,
                            r'''$.Answer''',
                            true,
                          ) as List)
                              .map<String>((s) => s.toString())
                              .toList()!
                              .map((label) => ChipData(label))
                              .toList(),
                          onChanged: (val) async {
                            safeSetState(() =>
                                _model.choiceChipsValue = val?.firstOrNull);
                            _model.selectedText = _model.choiceChipsValue!;
                            _model.answer = <String, dynamic>{
                              'QuestionID': widget!.questionID,
                              'Answer': _model.choiceChipsValue,
                            };
                            safeSetState(() {});
                            _model.apiResultfdh =
                                await ApiGroup.uploadQuestionAnswerCall.call(
                              userID: currentUserData?.userID,
                              quizID: widget!.quizID,
                              questionID: widget!.questionID,
                              answer: _model.choiceChipsValue,
                              token: currentAuthenticationToken,
                            );

                            safeSetState(() {});
                          },
                          selectedChipStyle: ChipStyle(
                            backgroundColor:
                                FlutterFlowTheme.of(context).primary,
                            textStyle: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context).info,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                ),
                            iconColor: FlutterFlowTheme.of(context).primaryText,
                            iconSize: 18.0,
                            elevation: 2.0,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          unselectedChipStyle: ChipStyle(
                            backgroundColor: Color(0x1A4B39EF),
                            textStyle: FlutterFlowTheme.of(context)
                                .bodySmall
                                .override(
                                  fontFamily: 'Readex Pro',
                                  color: FlutterFlowTheme.of(context).primary,
                                  fontSize: 14.0,
                                  letterSpacing: 0.0,
                                ),
                            iconColor: FlutterFlowTheme.of(context).primaryText,
                            iconSize: 18.0,
                            elevation: 0.0,
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          chipSpacing: 800.0,
                          rowSpacing: 12.0,
                          multiselect: false,
                          alignment: WrapAlignment.start,
                          controller: _model.choiceChipsValueController ??=
                              FormFieldController<List<String>>(
                            [],
                          ),
                          wrapped: true,
                        ),
                      ),
                    if (widget!.questionType == 2)
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(
                            16.0, 12.0, 16.0, 0.0),
                        child: Container(
                          width: double.infinity,
                          child: TextFormField(
                            controller: _model.answerTextController,
                            focusNode: _model.answerFocusNode,
                            onChanged: (_) => EasyDebounce.debounce(
                              '_model.answerTextController',
                              Duration(milliseconds: 2000),
                              () async {
                                _model.apiResultr7m = await ApiGroup
                                    .uploadQuestionAnswerCall
                                    .call(
                                  userID: currentUserData?.userID,
                                  questionID: widget!.questionID,
                                  quizID: widget!.quizID,
                                  answer: _model.answerTextController.text,
                                  token: currentAuthenticationToken,
                                );

                                safeSetState(() {});
                              },
                            ),
                            obscureText: false,
                            decoration: InputDecoration(
                              labelText: FFLocalizations.of(context).getText(
                                'z6kbff3s' /* Your Answer */,
                              ),
                              labelStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                              hintText: FFLocalizations.of(context).getText(
                                '0u35dval' /* Enter your answer... */,
                              ),
                              hintStyle: FlutterFlowTheme.of(context)
                                  .labelMedium
                                  .override(
                                    fontFamily: 'Readex Pro',
                                    letterSpacing: 0.0,
                                  ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).alternate,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).primary,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: FlutterFlowTheme.of(context).error,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              filled: true,
                              fillColor: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              contentPadding: EdgeInsetsDirectional.fromSTEB(
                                  24.0, 24.0, 20.0, 24.0),
                            ),
                            style: FlutterFlowTheme.of(context)
                                .bodyMedium
                                .override(
                                  fontFamily: 'Readex Pro',
                                  letterSpacing: 0.0,
                                ),
                            maxLines: null,
                            cursorColor: FlutterFlowTheme.of(context).primary,
                            validator: _model.answerTextControllerValidator
                                .asValidator(context),
                          ),
                        ),
                      ),
                  ].divide(SizedBox(height: 16.0)),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
