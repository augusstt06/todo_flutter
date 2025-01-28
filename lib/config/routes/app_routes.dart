import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_flutter/config/routes/routes_location.dart';
import 'package:todo_flutter/screens/screens.dart';

// 경로 구조 및 네비게이션 관리
final navigationKey = GlobalKey<NavigatorState>();

final appRoutes = [
  // GoRoute를 사용해 라우팅 경로 정의.
  GoRoute(
      path: RouteLocation.home,
      parentNavigatorKey: navigationKey,
      builder: HomeScreen.builder),
  GoRoute(
      path: RouteLocation.createTodo,
      parentNavigatorKey: navigationKey,
      builder: CreateTodoScreen.builder),
];
