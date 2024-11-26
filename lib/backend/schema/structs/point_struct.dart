// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PointStruct extends BaseStruct {
  PointStruct({
    int? rewardPoint,
  }) : _rewardPoint = rewardPoint;

  // "RewardPoint" field.
  int? _rewardPoint;
  int get rewardPoint => _rewardPoint ?? 0;
  set rewardPoint(int? val) => _rewardPoint = val;

  void incrementRewardPoint(int amount) => rewardPoint = rewardPoint + amount;

  bool hasRewardPoint() => _rewardPoint != null;

  static PointStruct fromMap(Map<String, dynamic> data) => PointStruct(
        rewardPoint: castToType<int>(data['RewardPoint']),
      );

  static PointStruct? maybeFromMap(dynamic data) =>
      data is Map ? PointStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'RewardPoint': _rewardPoint,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'RewardPoint': serializeParam(
          _rewardPoint,
          ParamType.int,
        ),
      }.withoutNulls;

  static PointStruct fromSerializableMap(Map<String, dynamic> data) =>
      PointStruct(
        rewardPoint: deserializeParam(
          data['RewardPoint'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'PointStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is PointStruct && rewardPoint == other.rewardPoint;
  }

  @override
  int get hashCode => const ListEquality().hash([rewardPoint]);
}

PointStruct createPointStruct({
  int? rewardPoint,
}) =>
    PointStruct(
      rewardPoint: rewardPoint,
    );
