// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class QuizSubmitedStruct extends BaseStruct {
  QuizSubmitedStruct({
    int? id,
    int? score,
  })  : _id = id,
        _score = score;

  // "ID" field.
  int? _id;
  int get id => _id ?? 0;
  set id(int? val) => _id = val;

  void incrementId(int amount) => id = id + amount;

  bool hasId() => _id != null;

  // "Score" field.
  int? _score;
  int get score => _score ?? 0;
  set score(int? val) => _score = val;

  void incrementScore(int amount) => score = score + amount;

  bool hasScore() => _score != null;

  static QuizSubmitedStruct fromMap(Map<String, dynamic> data) =>
      QuizSubmitedStruct(
        id: castToType<int>(data['ID']),
        score: castToType<int>(data['Score']),
      );

  static QuizSubmitedStruct? maybeFromMap(dynamic data) => data is Map
      ? QuizSubmitedStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'ID': _id,
        'Score': _score,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'ID': serializeParam(
          _id,
          ParamType.int,
        ),
        'Score': serializeParam(
          _score,
          ParamType.int,
        ),
      }.withoutNulls;

  static QuizSubmitedStruct fromSerializableMap(Map<String, dynamic> data) =>
      QuizSubmitedStruct(
        id: deserializeParam(
          data['ID'],
          ParamType.int,
          false,
        ),
        score: deserializeParam(
          data['Score'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'QuizSubmitedStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is QuizSubmitedStruct &&
        id == other.id &&
        score == other.score;
  }

  @override
  int get hashCode => const ListEquality().hash([id, score]);
}

QuizSubmitedStruct createQuizSubmitedStruct({
  int? id,
  int? score,
}) =>
    QuizSubmitedStruct(
      id: id,
      score: score,
    );
