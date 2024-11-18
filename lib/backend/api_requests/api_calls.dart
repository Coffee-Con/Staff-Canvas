import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

/// Start API Group Code

class ApiGroup {
  static String getBaseUrl() => 'http://82.152.142.33:5003';
  static Map<String, String> headers = {};
  static LoginCall loginCall = LoginCall();
  static GetUserCourseCall getUserCourseCall = GetUserCourseCall();
  static UserInfoCall userInfoCall = UserInfoCall();
  static CaptchaCall captchaCall = CaptchaCall();
  static VerifyCaptchaCall verifyCaptchaCall = VerifyCaptchaCall();
  static GetUserUnCompletedQuizzesCall getUserUnCompletedQuizzesCall =
      GetUserUnCompletedQuizzesCall();
  static GetUserCompletedQuizzesCall getUserCompletedQuizzesCall =
      GetUserCompletedQuizzesCall();
  static GetQuestionCall getQuestionCall = GetQuestionCall();
  static GetQuestionDetaiCall getQuestionDetaiCall = GetQuestionDetaiCall();
  static GetQuestionsDetailCall getQuestionsDetailCall =
      GetQuestionsDetailCall();
  static SubmitQuizCall submitQuizCall = SubmitQuizCall();
  static UploadQuestionAnswerCall uploadQuestionAnswerCall =
      UploadQuestionAnswerCall();
  static GetQuizAnswerCall getQuizAnswerCall = GetQuizAnswerCall();
  static GetRewardsCall getRewardsCall = GetRewardsCall();
  static GetRewardCall getRewardCall = GetRewardCall();
}

class LoginCall {
  Future<ApiCallResponse> call({
    String? email = '',
    String? password = '',
  }) async {
    final baseUrl = ApiGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "email": "${email}",
  "password": "${password}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'Login',
      apiUrl: '${baseUrl}/api/login',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? token(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.token''',
      ));
}

class GetUserCourseCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = ApiGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'GetUserCourse',
      apiUrl: '${baseUrl}/api/getUserCourses',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? courseID(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].CourseID''',
      ));
  String? courseName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].CourseName''',
      ));
  String? courseDescription(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$[:].CourseDescription''',
      ));
}

class UserInfoCall {
  Future<ApiCallResponse> call({
    String? token = '',
  }) async {
    final baseUrl = ApiGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'UserInfo',
      apiUrl: '${baseUrl}/api/getUserInfo',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: true,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? userID(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.UserID''',
      ));
  String? user(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.User''',
      ));
  String? email(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.Email''',
      ));
  String? name(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.Name''',
      ));
  int? role(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.Role''',
      ));
  String? registerTime(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.registration_time''',
      ));
}

class CaptchaCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = ApiGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'captcha',
      apiUrl: '${baseUrl}/captcha',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class VerifyCaptchaCall {
  Future<ApiCallResponse> call({
    String? email = '',
  }) async {
    final baseUrl = ApiGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "emial": "${email}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'verifyCaptcha',
      apiUrl: '${baseUrl}/api/verify-captcha',
      callType: ApiCallType.POST,
      headers: {},
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  bool? statu(dynamic response) => castToType<bool>(getJsonField(
        response,
        r'''$.success''',
      ));
  String? message(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.message''',
      ));
}

class GetUserUnCompletedQuizzesCall {
  Future<ApiCallResponse> call({
    String? token = '',
    int? courseID,
    int? userID,
  }) async {
    final baseUrl = ApiGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'getUserUnCompletedQuizzes',
      apiUrl: '${baseUrl}/api/getUserUnCompletedQuizzes/${userID}/${courseID}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? quizID(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].QuizID''',
      ));
  String? quizDescription(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].QuizDescription''',
      ));
  String? quizName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].QuizName''',
      ));
  dynamic statusid(dynamic response) => getJsonField(
        response,
        r'''$[:].StatusId''',
      );
  dynamic statusName(dynamic response) => getJsonField(
        response,
        r'''$[:].StatusName''',
      );
  dynamic score(dynamic response) => getJsonField(
        response,
        r'''$[:].Score''',
      );
  dynamic submitTime(dynamic response) => getJsonField(
        response,
        r'''$[:].SubmitTime''',
      );
}

class GetUserCompletedQuizzesCall {
  Future<ApiCallResponse> call({
    String? token = '',
    int? courseID,
    int? userID,
  }) async {
    final baseUrl = ApiGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'getUserCompletedQuizzes',
      apiUrl: '${baseUrl}/api/getUserCompletedQuizzes/${userID}/${courseID}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? quizID(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].QuizID''',
      ));
  String? quizDescription(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].QuizDescription''',
      ));
  String? quizName(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].QuizName''',
      ));
  dynamic statusid(dynamic response) => getJsonField(
        response,
        r'''$[:].StatusId''',
      );
  dynamic statusName(dynamic response) => getJsonField(
        response,
        r'''$[:].StatusName''',
      );
  dynamic score(dynamic response) => getJsonField(
        response,
        r'''$[:].Score''',
      );
  dynamic submitTime(dynamic response) => getJsonField(
        response,
        r'''$[:].SubmitTime''',
      );
}

class GetQuestionCall {
  Future<ApiCallResponse> call({
    String? token = '',
    int? quizID,
  }) async {
    final baseUrl = ApiGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'GetQuestion',
      apiUrl: '${baseUrl}/api/getQuizQuestions/${quizID}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${token}',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  dynamic questionID(dynamic response) => getJsonField(
        response,
        r'''$[:].QuestionID''',
      );
  dynamic question(dynamic response) => getJsonField(
        response,
        r'''$[:].Question''',
      );
  dynamic questionType(dynamic response) => getJsonField(
        response,
        r'''$[:].QuestionType''',
      );
  dynamic answer(dynamic response) => getJsonField(
        response,
        r'''$[:].Answer''',
      );
  dynamic questionTypeId(dynamic response) => getJsonField(
        response,
        r'''$[:].QuestionTypeId''',
      );
  dynamic questionTypeName(dynamic response) => getJsonField(
        response,
        r'''$[:].QuestionTypeName''',
      );
  dynamic correctAnswer(dynamic response) => getJsonField(
        response,
        r'''$[:].CorrectAnswer''',
      );
}

class GetQuestionDetaiCall {
  Future<ApiCallResponse> call({
    int? questionID,
  }) async {
    final baseUrl = ApiGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'getQuestionDetai',
      apiUrl: '${baseUrl}/api/getQuestion/${questionID}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? questionID(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.QuestionID''',
      ));
  int? questionType(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.QuestionType''',
      ));
  String? question(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.Question''',
      ));
  List<String>? answer(dynamic response) => (getJsonField(
        response,
        r'''$.Answer''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetQuestionsDetailCall {
  Future<ApiCallResponse> call({
    int? quizID,
  }) async {
    final baseUrl = ApiGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'getQuestionsDetail',
      apiUrl: '${baseUrl}/api/getQuestions/${quizID}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  String? topic(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].Question''',
      ));
  int? type(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].QuestionType''',
      ));
  List<String>? answer(dynamic response) => (getJsonField(
        response,
        r'''$[:].Answer''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
  int? questionID(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$[:].QuestionID''',
      ));
}

class SubmitQuizCall {
  Future<ApiCallResponse> call({
    int? userID,
    dynamic? answerJson,
    int? quizID,
  }) async {
    final baseUrl = ApiGroup.getBaseUrl();

    final answer = _serializeJson(answerJson, true);
    final ffApiRequestBody = '''
{
  "UserID": ${userID},
  "QuizID": ${quizID},
  "Answer": ${answer}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'SubmitQuiz',
      apiUrl: '${baseUrl}/api/submitQuiz',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  int? submitID(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.ID''',
      ));
  int? userID(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.UserID''',
      ));
  int? quizID(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.QuizID''',
      ));
  int? score(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.Score''',
      ));
}

class UploadQuestionAnswerCall {
  Future<ApiCallResponse> call({
    int? userID,
    int? questionID,
    String? answer = '',
    int? quizID,
  }) async {
    final baseUrl = ApiGroup.getBaseUrl();

    final ffApiRequestBody = '''
{
  "UserID": ${userID},
  "QuizID": ${quizID},
  "QuestionID": ${questionID},
  "Answer": "${escapeStringForJson(answer)}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'UploadQuestionAnswer',
      apiUrl: '${baseUrl}/api/saveUserQuizQuestionAnswer',
      callType: ApiCallType.POST,
      headers: {
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetQuizAnswerCall {
  Future<ApiCallResponse> call({
    int? userID,
    int? quizID,
  }) async {
    final baseUrl = ApiGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'getQuizAnswer',
      apiUrl: '${baseUrl}/api/getUserQuizAnswers/${userID}/${quizID}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  List<int>? questionID(dynamic response) => (getJsonField(
        response,
        r'''$[:].QuestionID''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<int>(x))
          .withoutNulls
          .toList();
  List<String>? answer(dynamic response) => (getJsonField(
        response,
        r'''$[:].Answer''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class GetRewardsCall {
  Future<ApiCallResponse> call() async {
    final baseUrl = ApiGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'getRewards',
      apiUrl: '${baseUrl}/api/getRewards',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

class GetRewardCall {
  Future<ApiCallResponse> call({
    int? rewardID,
  }) async {
    final baseUrl = ApiGroup.getBaseUrl();

    return ApiManager.instance.makeApiCall(
      callName: 'getReward',
      apiUrl: '${baseUrl}/api/getReward/${rewardID}',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }
}

/// End API Group Code

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}

String? escapeStringForJson(String? input) {
  if (input == null) {
    return null;
  }
  return input
      .replaceAll('\\', '\\\\')
      .replaceAll('"', '\\"')
      .replaceAll('\n', '\\n')
      .replaceAll('\t', '\\t');
}