// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuestionStruct extends BaseStruct {
  QuestionStruct({
    int? questionID,
    String? question,
    List<String>? answer,
    int? questionType,
    List<String>? correctAnswer,
  })  : _questionID = questionID,
        _question = question,
        _answer = answer,
        _questionType = questionType,
        _correctAnswer = correctAnswer;

  // "QuestionID" field.
  int? _questionID;
  int get questionID => _questionID ?? 0;
  set questionID(int? val) => _questionID = val;

  void incrementQuestionID(int amount) => questionID = questionID + amount;

  bool hasQuestionID() => _questionID != null;

  // "Question" field.
  String? _question;
  String get question => _question ?? '????';
  set question(String? val) => _question = val;

  bool hasQuestion() => _question != null;

  // "Answer" field.
  List<String>? _answer;
  List<String> get answer => _answer ?? const [];
  set answer(List<String>? val) => _answer = val;

  void updateAnswer(Function(List<String>) updateFn) {
    updateFn(_answer ??= []);
  }

  bool hasAnswer() => _answer != null;

  // "QuestionType" field.
  int? _questionType;
  int get questionType => _questionType ?? 0;
  set questionType(int? val) => _questionType = val;

  void incrementQuestionType(int amount) =>
      questionType = questionType + amount;

  bool hasQuestionType() => _questionType != null;

  // "CorrectAnswer" field.
  List<String>? _correctAnswer;
  List<String> get correctAnswer => _correctAnswer ?? const [];
  set correctAnswer(List<String>? val) => _correctAnswer = val;

  void updateCorrectAnswer(Function(List<String>) updateFn) {
    updateFn(_correctAnswer ??= []);
  }

  bool hasCorrectAnswer() => _correctAnswer != null;

  static QuestionStruct fromMap(Map<String, dynamic> data) => QuestionStruct(
        questionID: castToType<int>(data['QuestionID']),
        question: data['Question'] as String?,
        answer: getDataList(data['Answer']),
        questionType: castToType<int>(data['QuestionType']),
        correctAnswer: getDataList(data['CorrectAnswer']),
      );

  static QuestionStruct? maybeFromMap(dynamic data) =>
      data is Map ? QuestionStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'QuestionID': _questionID,
        'Question': _question,
        'Answer': _answer,
        'QuestionType': _questionType,
        'CorrectAnswer': _correctAnswer,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'QuestionID': serializeParam(
          _questionID,
          ParamType.int,
        ),
        'Question': serializeParam(
          _question,
          ParamType.String,
        ),
        'Answer': serializeParam(
          _answer,
          ParamType.String,
          isList: true,
        ),
        'QuestionType': serializeParam(
          _questionType,
          ParamType.int,
        ),
        'CorrectAnswer': serializeParam(
          _correctAnswer,
          ParamType.String,
          isList: true,
        ),
      }.withoutNulls;

  static QuestionStruct fromSerializableMap(Map<String, dynamic> data) =>
      QuestionStruct(
        questionID: deserializeParam(
          data['QuestionID'],
          ParamType.int,
          false,
        ),
        question: deserializeParam(
          data['Question'],
          ParamType.String,
          false,
        ),
        answer: deserializeParam<String>(
          data['Answer'],
          ParamType.String,
          true,
        ),
        questionType: deserializeParam(
          data['QuestionType'],
          ParamType.int,
          false,
        ),
        correctAnswer: deserializeParam<String>(
          data['CorrectAnswer'],
          ParamType.String,
          true,
        ),
      );

  @override
  String toString() => 'QuestionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is QuestionStruct &&
        questionID == other.questionID &&
        question == other.question &&
        listEquality.equals(answer, other.answer) &&
        questionType == other.questionType &&
        listEquality.equals(correctAnswer, other.correctAnswer);
  }

  @override
  int get hashCode => const ListEquality()
      .hash([questionID, question, answer, questionType, correctAnswer]);
}

QuestionStruct createQuestionStruct({
  int? questionID,
  String? question,
  int? questionType,
}) =>
    QuestionStruct(
      questionID: questionID,
      question: question,
      questionType: questionType,
    );
