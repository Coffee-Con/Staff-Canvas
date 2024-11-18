// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CourseMaterialStruct extends BaseStruct {
  CourseMaterialStruct({
    int? materialID,
    String? materialName,
    String? materialDescription,
    String? materialLink,
    int? materialType,
  })  : _materialID = materialID,
        _materialName = materialName,
        _materialDescription = materialDescription,
        _materialLink = materialLink,
        _materialType = materialType;

  // "MaterialID" field.
  int? _materialID;
  int get materialID => _materialID ?? 0;
  set materialID(int? val) => _materialID = val;

  void incrementMaterialID(int amount) => materialID = materialID + amount;

  bool hasMaterialID() => _materialID != null;

  // "MaterialName" field.
  String? _materialName;
  String get materialName => _materialName ?? '';
  set materialName(String? val) => _materialName = val;

  bool hasMaterialName() => _materialName != null;

  // "MaterialDescription" field.
  String? _materialDescription;
  String get materialDescription => _materialDescription ?? '';
  set materialDescription(String? val) => _materialDescription = val;

  bool hasMaterialDescription() => _materialDescription != null;

  // "MaterialLink" field.
  String? _materialLink;
  String get materialLink => _materialLink ?? '';
  set materialLink(String? val) => _materialLink = val;

  bool hasMaterialLink() => _materialLink != null;

  // "MaterialType" field.
  int? _materialType;
  int get materialType => _materialType ?? 1;
  set materialType(int? val) => _materialType = val;

  void incrementMaterialType(int amount) =>
      materialType = materialType + amount;

  bool hasMaterialType() => _materialType != null;

  static CourseMaterialStruct fromMap(Map<String, dynamic> data) =>
      CourseMaterialStruct(
        materialID: castToType<int>(data['MaterialID']),
        materialName: data['MaterialName'] as String?,
        materialDescription: data['MaterialDescription'] as String?,
        materialLink: data['MaterialLink'] as String?,
        materialType: castToType<int>(data['MaterialType']),
      );

  static CourseMaterialStruct? maybeFromMap(dynamic data) => data is Map
      ? CourseMaterialStruct.fromMap(data.cast<String, dynamic>())
      : null;

  Map<String, dynamic> toMap() => {
        'MaterialID': _materialID,
        'MaterialName': _materialName,
        'MaterialDescription': _materialDescription,
        'MaterialLink': _materialLink,
        'MaterialType': _materialType,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'MaterialID': serializeParam(
          _materialID,
          ParamType.int,
        ),
        'MaterialName': serializeParam(
          _materialName,
          ParamType.String,
        ),
        'MaterialDescription': serializeParam(
          _materialDescription,
          ParamType.String,
        ),
        'MaterialLink': serializeParam(
          _materialLink,
          ParamType.String,
        ),
        'MaterialType': serializeParam(
          _materialType,
          ParamType.int,
        ),
      }.withoutNulls;

  static CourseMaterialStruct fromSerializableMap(Map<String, dynamic> data) =>
      CourseMaterialStruct(
        materialID: deserializeParam(
          data['MaterialID'],
          ParamType.int,
          false,
        ),
        materialName: deserializeParam(
          data['MaterialName'],
          ParamType.String,
          false,
        ),
        materialDescription: deserializeParam(
          data['MaterialDescription'],
          ParamType.String,
          false,
        ),
        materialLink: deserializeParam(
          data['MaterialLink'],
          ParamType.String,
          false,
        ),
        materialType: deserializeParam(
          data['MaterialType'],
          ParamType.int,
          false,
        ),
      );

  @override
  String toString() => 'CourseMaterialStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CourseMaterialStruct &&
        materialID == other.materialID &&
        materialName == other.materialName &&
        materialDescription == other.materialDescription &&
        materialLink == other.materialLink &&
        materialType == other.materialType;
  }

  @override
  int get hashCode => const ListEquality().hash([
        materialID,
        materialName,
        materialDescription,
        materialLink,
        materialType
      ]);
}

CourseMaterialStruct createCourseMaterialStruct({
  int? materialID,
  String? materialName,
  String? materialDescription,
  String? materialLink,
  int? materialType,
}) =>
    CourseMaterialStruct(
      materialID: materialID,
      materialName: materialName,
      materialDescription: materialDescription,
      materialLink: materialLink,
      materialType: materialType,
    );
