// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CourseStruct extends BaseStruct {
  CourseStruct({
    int? courseID,
    String? courseName,
    String? courseDescription,
  })  : _courseID = courseID,
        _courseName = courseName,
        _courseDescription = courseDescription;

  // "CourseID" field.
  int? _courseID;
  int get courseID => _courseID ?? 0;
  set courseID(int? val) => _courseID = val;

  void incrementCourseID(int amount) => courseID = courseID + amount;

  bool hasCourseID() => _courseID != null;

  // "CourseName" field.
  String? _courseName;
  String get courseName => _courseName ?? '';
  set courseName(String? val) => _courseName = val;

  bool hasCourseName() => _courseName != null;

  // "CourseDescription" field.
  String? _courseDescription;
  String get courseDescription => _courseDescription ?? '';
  set courseDescription(String? val) => _courseDescription = val;

  bool hasCourseDescription() => _courseDescription != null;

  static CourseStruct fromMap(Map<String, dynamic> data) => CourseStruct(
        courseID: castToType<int>(data['CourseID']),
        courseName: data['CourseName'] as String?,
        courseDescription: data['CourseDescription'] as String?,
      );

  static CourseStruct? maybeFromMap(dynamic data) =>
      data is Map ? CourseStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'CourseID': _courseID,
        'CourseName': _courseName,
        'CourseDescription': _courseDescription,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'CourseID': serializeParam(
          _courseID,
          ParamType.int,
        ),
        'CourseName': serializeParam(
          _courseName,
          ParamType.String,
        ),
        'CourseDescription': serializeParam(
          _courseDescription,
          ParamType.String,
        ),
      }.withoutNulls;

  static CourseStruct fromSerializableMap(Map<String, dynamic> data) =>
      CourseStruct(
        courseID: deserializeParam(
          data['CourseID'],
          ParamType.int,
          false,
        ),
        courseName: deserializeParam(
          data['CourseName'],
          ParamType.String,
          false,
        ),
        courseDescription: deserializeParam(
          data['CourseDescription'],
          ParamType.String,
          false,
        ),
      );

  @override
  String toString() => 'CourseStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is CourseStruct &&
        courseID == other.courseID &&
        courseName == other.courseName &&
        courseDescription == other.courseDescription;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([courseID, courseName, courseDescription]);
}

CourseStruct createCourseStruct({
  int? courseID,
  String? courseName,
  String? courseDescription,
}) =>
    CourseStruct(
      courseID: courseID,
      courseName: courseName,
      courseDescription: courseDescription,
    );
