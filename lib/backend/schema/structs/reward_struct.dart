// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class RewardStruct extends BaseStruct {
  RewardStruct({
    int? rewardID,
    String? rewardName,
    String? rewardDescription,
    int? rewardPoint,
  })  : _rewardID = rewardID,
        _rewardName = rewardName,
        _rewardDescription = rewardDescription,
        _rewardPoint = rewardPoint;

  // "RewardID" field.
  int? _rewardID;
  int get rewardID => _rewardID ?? 0;
  set rewardID(int? val) => _rewardID = val;

  void incrementRewardID(int amount) => rewardID = rewardID + amount;

  bool hasRewardID() => _rewardID != null;

  // "RewardName" field.
  String? _rewardName;
  String get rewardName => _rewardName ?? '';
  set rewardName(String? val) => _rewardName = val;

  bool hasRewardName() => _rewardName != null;

  // "RewardDescription" field.
  String? _rewardDescription;
  String get rewardDescription => _rewardDescription ?? '';
  set rewardDescription(String? val) => _rewardDescription = val;

  bool hasRewardDescription() => _rewardDescription != null;

  // "RewardPoint" field.
  int? _rewardPoint;
  int get rewardPoint => _rewardPoint ?? 0;
  set rewardPoint(int? val) => _rewardPoint = val;

  void incrementRewardPoint(int amount) => rewardPoint = rewardPoint + amount;

  bool hasRewardPoint() => _rewardPoint != null;

  static RewardStruct fromMap(Map<String, dynamic> data) => RewardStruct(
        rewardID: castToType<int>(data['RewardID']),
        rewardName: data['RewardName'] as String?,
        rewardDescription: data['RewardDescription'] as String?,
        rewardPoint: castToType<int>(data['RewardPoint']),
      );

  static RewardStruct? maybeFromMap(dynamic data) =>
      data is Map ? RewardStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'RewardID': _rewardID,
        'RewardName': _rewardName,
        'RewardDescription': _rewardDescription,
        'RewardPoint': _rewardPoint,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'RewardID': serializeParam(
          _rewardID,
          ParamType.int,
        ),
        'RewardName': serializeParam(
          _rewardName,
          ParamType.String,
        ),
        'RewardDescription': serializeParam(
          _rewardDescription,
          ParamType.String,
        ),
        'RewardPoint': serializeParam(
          _rewardPoint,
          ParamType.int,
        ),
      }.withoutNulls;

  static RewardStruct fromSerializableMap(Map<String, dynamic> data) =>
      RewardStruct(
        rewardID: deserializeParam(
          data['RewardID'],
          ParamType.int,
          false,
        ),
        rewardName: deserializeParam(
          data['RewardName'],
          ParamType.String,
          false,
        ),
        rewardDescription: deserializeParam(
          data['RewardDescription'],
          ParamType.String,
          false,
        ),
        rewardPoint: deserializeParam(
          data['RewardPoint'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'RewardStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is RewardStruct &&
        rewardID == other.rewardID &&
        rewardName == other.rewardName &&
        rewardDescription == other.rewardDescription &&
        rewardPoint == other.rewardPoint;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([rewardID, rewardName, rewardDescription, rewardPoint]);
}

RewardStruct createRewardStruct({
  int? rewardID,
  String? rewardName,
  String? rewardDescription,
  int? rewardPoint,
}) =>
    RewardStruct(
      rewardID: rewardID,
      rewardName: rewardName,
      rewardDescription: rewardDescription,
      rewardPoint: rewardPoint,
    );
