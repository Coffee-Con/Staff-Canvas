// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class LeaderBoardStruct extends BaseStruct {
  LeaderBoardStruct({
    int? userID,
    String? name,
    int? score,
  })  : _userID = userID,
        _name = name,
        _score = score;

  // "UserID" field.
  int? _userID;
  int get userID => _userID ?? 0;
  set userID(int? val) => _userID = val;

  void incrementUserID(int amount) => userID = userID + amount;

  bool hasUserID() => _userID != null;

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "Score" field.
  int? _score;
  int get score => _score ?? 0;
  set score(int? val) => _score = val;

  void incrementScore(int amount) => score = score + amount;

  bool hasScore() => _score != null;

  static LeaderBoardStruct fromMap(Map<String, dynamic> data) =>
      LeaderBoardStruct(
        userID: castToType<int>(data['UserID']),
        name: data['Name'] as String?,
        score: castToType<int>(data['Score']),
      );

  static LeaderBoardStruct? maybeFromMap(dynamic data) => data is Map
      ? LeaderBoardStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'UserID': _userID,
        'Name': _name,
        'Score': _score,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'UserID': serializeParam(
          _userID,
          ParamType.int,
        ),
        'Name': serializeParam(
          _name,
          ParamType.String,
        ),
        'Score': serializeParam(
          _score,
          ParamType.int,
        ),
      }.withoutNulls;

  static LeaderBoardStruct fromSerializableMap(Map<String, dynamic> data) =>
      LeaderBoardStruct(
        userID: deserializeParam(
          data['UserID'],
          ParamType.int,
          false,
        ),
        name: deserializeParam(
          data['Name'],
          ParamType.String,
          false,
        ),
        score: deserializeParam(
          data['Score'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'LeaderBoardStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is LeaderBoardStruct &&
        userID == other.userID &&
        name == other.name &&
        score == other.score;
  }

  @override
  int get hashCode => const ListEquality().hash([userID, name, score]);
}

LeaderBoardStruct createLeaderBoardStruct({
  int? userID,
  String? name,
  int? score,
}) =>
    LeaderBoardStruct(
      userID: userID,
      name: name,
      score: score,
    );
