import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/schema/structs/index.dart';
import '/auth/custom_auth/auth_util.dart';

DateTime authTokenExpiration() {
  /// 获取当前时间
  DateTime currentTime = DateTime.now();

  /// 增加 7.5 小时
  DateTime updatedTime = currentTime.add(Duration(hours: 7, minutes: 30));

  return updatedTime;
}

dynamic getAnswer() {
  List<Map<String, dynamic>> answersList = [];

  Map<String, dynamic>? getAnswerFromComponent(
      dynamic componentInstance, String questionID) {
    // 检查组件实例是否存在，并尝试访问 _model.answer
    try {
      final answer = componentInstance?._model.answer;
      if (answer != null && answer['QuestionID'] == questionID) {
        return answer;
      }
    } catch (e) {
      print('Error accessing _model.answer: $e');
    }
    return null;
  }
}
