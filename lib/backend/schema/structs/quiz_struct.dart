// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuizStruct extends BaseStruct {
  QuizStruct({
    int? quizID,
    String? quizName,
    String? quizDescription,
    int? statusID,
    String? statusName,
    double? score,
    DateTime? submitTime,
  })  : _quizID = quizID,
        _quizName = quizName,
        _quizDescription = quizDescription,
        _statusID = statusID,
        _statusName = statusName,
        _score = score,
        _submitTime = submitTime;

  // "QuizID" field.
  int? _quizID;
  int get quizID => _quizID ?? 0;
  set quizID(int? val) => _quizID = val;

  void incrementQuizID(int amount) => quizID = quizID + amount;

  bool hasQuizID() => _quizID != null;

  // "QuizName" field.
  String? _quizName;
  String get quizName => _quizName ?? '';
  set quizName(String? val) => _quizName = val;

  bool hasQuizName() => _quizName != null;

  // "QuizDescription" field.
  String? _quizDescription;
  String get quizDescription => _quizDescription ?? '';
  set quizDescription(String? val) => _quizDescription = val;

  bool hasQuizDescription() => _quizDescription != null;

  // "StatusID" field.
  int? _statusID;
  int get statusID => _statusID ?? 0;
  set statusID(int? val) => _statusID = val;

  void incrementStatusID(int amount) => statusID = statusID + amount;

  bool hasStatusID() => _statusID != null;

  // "StatusName" field.
  String? _statusName;
  String get statusName => _statusName ?? '';
  set statusName(String? val) => _statusName = val;

  bool hasStatusName() => _statusName != null;

  // "Score" field.
  double? _score;
  double get score => _score ?? 0.0;
  set score(double? val) => _score = val;

  void incrementScore(double amount) => score = score + amount;

  bool hasScore() => _score != null;

  // "SubmitTime" field.
  DateTime? _submitTime;
  DateTime? get submitTime => _submitTime;
  set submitTime(DateTime? val) => _submitTime = val;

  bool hasSubmitTime() => _submitTime != null;

  static QuizStruct fromMap(Map<String, dynamic> data) => QuizStruct(
        quizID: castToType<int>(data['QuizID']),
        quizName: data['QuizName'] as String?,
        quizDescription: data['QuizDescription'] as String?,
        statusID: castToType<int>(data['StatusID']),
        statusName: data['StatusName'] as String?,
        score: castToType<double>(data['Score']),
        submitTime: data['SubmitTime'] as DateTime?,
      );

  static QuizStruct? maybeFromMap(dynamic data) =>
      data is Map ? QuizStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'QuizID': _quizID,
        'QuizName': _quizName,
        'QuizDescription': _quizDescription,
        'StatusID': _statusID,
        'StatusName': _statusName,
        'Score': _score,
        'SubmitTime': _submitTime,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'QuizID': serializeParam(
          _quizID,
          ParamType.int,
        ),
        'QuizName': serializeParam(
          _quizName,
          ParamType.String,
        ),
        'QuizDescription': serializeParam(
          _quizDescription,
          ParamType.String,
        ),
        'StatusID': serializeParam(
          _statusID,
          ParamType.int,
        ),
        'StatusName': serializeParam(
          _statusName,
          ParamType.String,
        ),
        'Score': serializeParam(
          _score,
          ParamType.double,
        ),
        'SubmitTime': serializeParam(
          _submitTime,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static QuizStruct fromSerializableMap(Map<String, dynamic> data) =>
      QuizStruct(
        quizID: deserializeParam(
          data['QuizID'],
          ParamType.int,
          false,
        ),
        quizName: deserializeParam(
          data['QuizName'],
          ParamType.String,
          false,
        ),
        quizDescription: deserializeParam(
          data['QuizDescription'],
          ParamType.String,
          false,
        ),
        statusID: deserializeParam(
          data['StatusID'],
          ParamType.int,
          false,
        ),
        statusName: deserializeParam(
          data['StatusName'],
          ParamType.String,
          false,
        ),
        score: deserializeParam(
          data['Score'],
          ParamType.double,
          false,
        ),
        submitTime: deserializeParam(
          data['SubmitTime'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'QuizStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is QuizStruct &&
        quizID == other.quizID &&
        quizName == other.quizName &&
        quizDescription == other.quizDescription &&
        statusID == other.statusID &&
        statusName == other.statusName &&
        score == other.score &&
        submitTime == other.submitTime;
  }

  @override
  int get hashCode => const ListEquality().hash([
        quizID,
        quizName,
        quizDescription,
        statusID,
        statusName,
        score,
        submitTime
      ]);
}

QuizStruct createQuizStruct({
  int? quizID,
  String? quizName,
  String? quizDescription,
  int? statusID,
  String? statusName,
  double? score,
  DateTime? submitTime,
}) =>
    QuizStruct(
      quizID: quizID,
      quizName: quizName,
      quizDescription: quizDescription,
      statusID: statusID,
      statusName: statusName,
      score: score,
      submitTime: submitTime,
    );
