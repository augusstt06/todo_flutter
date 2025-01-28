import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_flutter/config/routes/routes_location.dart';
import 'package:todo_flutter/screens/screens.dart';

// app 내의 내비게이션 상태를 관리하는데 사용되는 키.
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
