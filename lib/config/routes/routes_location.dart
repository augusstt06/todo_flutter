import 'package:flutter/material.dart';

// 어플리케이션 내에서 사용되는 경로 위치 정의
@immutable
class RouteLocation {
  const RouteLocation._();

  static String get home => '/home';
  static String get createTodo => '/createTodo';
}
