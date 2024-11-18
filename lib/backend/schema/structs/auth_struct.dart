// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class AuthStruct extends BaseStruct {
  AuthStruct({
    String? token,
    DateTime? expiresAt,
  })  : _token = token,
        _expiresAt = expiresAt;

  // "token" field.
  String? _token;
  String get token => _token ?? '';
  set token(String? val) => _token = val;

  bool hasToken() => _token != null;

  // "expiresAt" field.
  DateTime? _expiresAt;
  DateTime? get expiresAt => _expiresAt;
  set expiresAt(DateTime? val) => _expiresAt = val;

  bool hasExpiresAt() => _expiresAt != null;

  static AuthStruct fromMap(Map<String, dynamic> data) => AuthStruct(
        token: data['token'] as String?,
        expiresAt: data['expiresAt'] as DateTime?,
      );

  static AuthStruct? maybeFromMap(dynamic data) =>
      data is Map ? AuthStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'token': _token,
        'expiresAt': _expiresAt,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'token': serializeParam(
          _token,
          ParamType.String,
        ),
        'expiresAt': serializeParam(
          _expiresAt,
          ParamType.DateTime,
        ),
      }.withoutNulls;

  static AuthStruct fromSerializableMap(Map<String, dynamic> data) =>
      AuthStruct(
        token: deserializeParam(
          data['token'],
          ParamType.String,
          false,
        ),
        expiresAt: deserializeParam(
          data['expiresAt'],
          ParamType.DateTime,
          false,
        ),
      );

  @override
  String toString() => 'AuthStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is AuthStruct &&
        token == other.token &&
        expiresAt == other.expiresAt;
  }

  @override
  int get hashCode => const ListEquality().hash([token, expiresAt]);
}

AuthStruct createAuthStruct({
  String? token,
  DateTime? expiresAt,
}) =>
    AuthStruct(
      token: token,
      expiresAt: expiresAt,
    );
