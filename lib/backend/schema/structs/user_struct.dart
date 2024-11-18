// ignore_for_file: unnecessary_getters_setters

import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UserStruct extends BaseStruct {
  UserStruct({
    int? userID,
    String? user,
    String? email,
    String? name,
    int? role,
    String? salt,
    String? hashedPW,
    String? registrationTime,
    String? token,
    List<CourseStruct>? courses,
  })  : _userID = userID,
        _user = user,
        _email = email,
        _name = name,
        _role = role,
        _salt = salt,
        _hashedPW = hashedPW,
        _registrationTime = registrationTime,
        _token = token,
        _courses = courses;

  // "UserID" field.
  int? _userID;
  int get userID => _userID ?? 0;
  set userID(int? val) => _userID = val;

  void incrementUserID(int amount) => userID = userID + amount;

  bool hasUserID() => _userID != null;

  // "User" field.
  String? _user;
  String get user => _user ?? '';
  set user(String? val) => _user = val;

  bool hasUser() => _user != null;

  // "Email" field.
  String? _email;
  String get email => _email ?? '';
  set email(String? val) => _email = val;

  bool hasEmail() => _email != null;

  // "Name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;

  bool hasName() => _name != null;

  // "Role" field.
  int? _role;
  int get role => _role ?? 0;
  set role(int? val) => _role = val;

  void incrementRole(int amount) => role = role + amount;

  bool hasRole() => _role != null;

  // "Salt" field.
  String? _salt;
  String get salt => _salt ?? '';
  set salt(String? val) => _salt = val;

  bool hasSalt() => _salt != null;

  // "HashedPW" field.
  String? _hashedPW;
  String get hashedPW => _hashedPW ?? '';
  set hashedPW(String? val) => _hashedPW = val;

  bool hasHashedPW() => _hashedPW != null;

  // "registration_time" field.
  String? _registrationTime;
  String get registrationTime => _registrationTime ?? '';
  set registrationTime(String? val) => _registrationTime = val;

  bool hasRegistrationTime() => _registrationTime != null;

  // "token" field.
  String? _token;
  String get token => _token ?? '';
  set token(String? val) => _token = val;

  bool hasToken() => _token != null;

  // "courses" field.
  List<CourseStruct>? _courses;
  List<CourseStruct> get courses => _courses ?? const [];
  set courses(List<CourseStruct>? val) => _courses = val;

  void updateCourses(Function(List<CourseStruct>) updateFn) {
    updateFn(_courses ??= []);
  }

  bool hasCourses() => _courses != null;

  static UserStruct fromMap(Map<String, dynamic> data) => UserStruct(
        userID: castToType<int>(data['UserID']),
        user: data['User'] as String?,
        email: data['Email'] as String?,
        name: data['Name'] as String?,
        role: castToType<int>(data['Role']),
        salt: data['Salt'] as String?,
        hashedPW: data['HashedPW'] as String?,
        registrationTime: data['registration_time'] as String?,
        token: data['token'] as String?,
        courses: getStructList(
          data['courses'],
          CourseStruct.fromMap,
        ),
      );

  static UserStruct? maybeFromMap(dynamic data) =>
      data is Map ? UserStruct.fromMap(data.cast<String, dynamic>()) : null;

  Map<String, dynamic> toMap() => {
        'UserID': _userID,
        'User': _user,
        'Email': _email,
        'Name': _name,
        'Role': _role,
        'Salt': _salt,
        'HashedPW': _hashedPW,
        'registration_time': _registrationTime,
        'token': _token,
        'courses': _courses?.map((e) => e.toMap()).toList(),
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'UserID': serializeParam(
          _userID,
          ParamType.int,
        ),
        'User': serializeParam(
          _user,
          ParamType.String,
        ),
        'Email': serializeParam(
          _email,
          ParamType.String,
        ),
        'Name': serializeParam(
          _name,
          ParamType.String,
        ),
        'Role': serializeParam(
          _role,
          ParamType.int,
        ),
        'Salt': serializeParam(
          _salt,
          ParamType.String,
        ),
        'HashedPW': serializeParam(
          _hashedPW,
          ParamType.String,
        ),
        'registration_time': serializeParam(
          _registrationTime,
          ParamType.String,
        ),
        'token': serializeParam(
          _token,
          ParamType.String,
        ),
        'courses': serializeParam(
          _courses,
          ParamType.DataStruct,
          isList: true,
        ),
      }.withoutNulls;

  static UserStruct fromSerializableMap(Map<String, dynamic> data) =>
      UserStruct(
        userID: deserializeParam(
          data['UserID'],
          ParamType.int,
          false,
        ),
        user: deserializeParam(
          data['User'],
          ParamType.String,
          false,
        ),
        email: deserializeParam(
          data['Email'],
          ParamType.String,
          false,
        ),
        name: deserializeParam(
          data['Name'],
          ParamType.String,
          false,
        ),
        role: deserializeParam(
          data['Role'],
          ParamType.int,
          false,
        ),
        salt: deserializeParam(
          data['Salt'],
          ParamType.String,
          false,
        ),
        hashedPW: deserializeParam(
          data['HashedPW'],
          ParamType.String,
          false,
        ),
        registrationTime: deserializeParam(
          data['registration_time'],
          ParamType.String,
          false,
        ),
        token: deserializeParam(
          data['token'],
          ParamType.String,
          false,
        ),
        courses: deserializeStructParam<CourseStruct>(
          data['courses'],
          ParamType.DataStruct,
          true,
          structBuilder: CourseStruct.fromSerializableMap,
        ),
      );

  @override
  String toString() => 'UserStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is UserStruct &&
        userID == other.userID &&
        user == other.user &&
        email == other.email &&
        name == other.name &&
        role == other.role &&
        salt == other.salt &&
        hashedPW == other.hashedPW &&
        registrationTime == other.registrationTime &&
        token == other.token &&
        listEquality.equals(courses, other.courses);
  }

  @override
  int get hashCode => const ListEquality().hash([
        userID,
        user,
        email,
        name,
        role,
        salt,
        hashedPW,
        registrationTime,
        token,
        courses
      ]);
}

UserStruct createUserStruct({
  int? userID,
  String? user,
  String? email,
  String? name,
  int? role,
  String? salt,
  String? hashedPW,
  String? registrationTime,
  String? token,
}) =>
    UserStruct(
      userID: userID,
      user: user,
      email: email,
      name: name,
      role: role,
      salt: salt,
      hashedPW: hashedPW,
      registrationTime: registrationTime,
      token: token,
    );
