// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserActionStruct extends BaseStruct {
  UserActionStruct({
    int? actionId,
    int? userId,
    String? action,
    String? actionDetails,
    DateTime? actionTime,
    int? rewardPoint,
  })  : _actionId = actionId,
        _userId = userId,
        _action = action,
        _actionDetails = actionDetails,
        _actionTime = actionTime,
        _rewardPoint = rewardPoint;

  // "ActionId" field.
  int? _actionId;
  int get actionId => _actionId ?? 0;
  set actionId(int? val) => _actionId = val;

  void incrementActionId(int amount) => actionId = actionId + amount;

  bool hasActionId() => _actionId != null;

  // "UserId" field.
  int? _userId;
  int get userId => _userId ?? 0;
  set userId(int? val) => _userId = val;

  void incrementUserId(int amount) => userId = userId + amount;

  bool hasUserId() => _userId != null;

  // "Action" field.
  String? _action;
  String get action => _action ?? '';
  set action(String? val) => _action = val;

  bool hasAction() => _action != null;

  // "ActionDetails" field.
  String? _actionDetails;
  String get actionDetails => _actionDetails ?? '';
  set actionDetails(String? val) => _actionDetails = val;

  bool hasActionDetails() => _actionDetails != null;

  // "ActionTime" field.
  DateTime? _actionTime;
  DateTime? get actionTime => _actionTime;
  set actionTime(DateTime? val) => _actionTime = val;

  bool hasActionTime() => _actionTime != null;

  // "RewardPoint" field.
  int? _rewardPoint;
  int get rewardPoint => _rewardPoint ?? 0;
  set rewardPoint(int? val) => _rewardPoint = val;

  void incrementRewardPoint(int amount) => rewardPoint = rewardPoint + amount;

  bool hasRewardPoint() => _rewardPoint != null;

  static UserActionStruct fromMap(Map<String, dynamic> data) =>
      UserActionStruct(
        actionId: castToType<int>(data['ActionId']),
        userId: castToType<int>(data['UserId']),
        action: data['Action'] as String?,
        actionDetails: data['ActionDetails'] as String?,
        actionTime: data['ActionTime'] as DateTime?,
        rewardPoint: castToType<int>(data['RewardPoint']),
      );

  static UserActionStruct? maybeFromMap(dynamic data) => data is Map
      ? UserActionStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'ActionId': _actionId,
        'UserId': _userId,
        'Action': _action,
        'ActionDetails': _actionDetails,
        'ActionTime': _actionTime,
        'RewardPoint': _rewardPoint,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'ActionId': serializeParam(
          _actionId,
          ParamType.int,
        ),
        'UserId': serializeParam(
          _userId,
          ParamType.int,
        ),
        'Action': serializeParam(
          _action,
          ParamType.String,
        ),
        'ActionDetails': serializeParam(
          _actionDetails,
          ParamType.String,
        ),
        'ActionTime': serializeParam(
          _actionTime,
          ParamType.DateTime,
        ),
        'RewardPoint': serializeParam(
          _rewardPoint,
          ParamType.int,
        ),
      }.withoutNulls;

  static UserActionStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserActionStruct(
        actionId: deserializeParam(
          data['ActionId'],
          ParamType.int,
          false,
        ),
        userId: deserializeParam(
          data['UserId'],
          ParamType.int,
          false,
        ),
        action: deserializeParam(
          data['Action'],
          ParamType.String,
          false,
        ),
        actionDetails: deserializeParam(
          data['ActionDetails'],
          ParamType.String,
          false,
        ),
        actionTime: deserializeParam(
          data['ActionTime'],
          ParamType.DateTime,
          false,
        ),
        rewardPoint: deserializeParam(
          data['RewardPoint'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'UserActionStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserActionStruct &&
        actionId == other.actionId &&
        userId == other.userId &&
        action == other.action &&
        actionDetails == other.actionDetails &&
        actionTime == other.actionTime &&
        rewardPoint == other.rewardPoint;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([actionId, userId, action, actionDetails, actionTime, rewardPoint]);
}

UserActionStruct createUserActionStruct({
  int? actionId,
  int? userId,
  String? action,
  String? actionDetails,
  DateTime? actionTime,
  int? rewardPoint,
}) =>
    UserActionStruct(
      actionId: actionId,
      userId: userId,
      action: action,
      actionDetails: actionDetails,
      actionTime: actionTime,
      rewardPoint: rewardPoint,
    );
