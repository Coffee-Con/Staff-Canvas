// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserInfoStruct extends BaseStruct {
  UserInfoStruct({
    String? img,
  }) : _img = img;

  // "img" field.
  String? _img;
  String get img =>
      _img ??
      'https://instructure-uploads-apse2.s3.ap-southeast-2.amazonaws.com/account_198030000000000001/attachments/36809/uninewcastle.png';
  set img(String? val) => _img = val;

  bool hasImg() => _img != null;

  static UserInfoStruct fromMap(Map<String, dynamic> data) => UserInfoStruct(
        img: data['img'] as String?,
      );

  static UserInfoStruct? maybeFromMap(dynamic data) =>
      data is Map ? UserInfoStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'img': _img,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'img': serializeParam(
          _img,
          ParamType.String,
        ),
      }.withoutNulls;

  static UserInfoStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserInfoStruct(
        img: deserializeParam(
          data['img'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'UserInfoStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is UserInfoStruct && img == other.img;
  }

  @override
  int get hashCode => const ListEquality().hash([img]);
}

UserInfoStruct createUserInfoStruct({
  String? img,
}) =>
    UserInfoStruct(
      img: img,
    );
