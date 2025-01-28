import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_flutter/config/routes/routes.dart';

// GoRouter 인스턴스를 제공하는 프로바이더
// => GoRouter를 설정해서, 정의된 경로를 실제로 사용될수 있도록 함.
final routesProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: RouteLocation.home,
    navigatorKey: navigationKey,
    routes: appRoutes,
  );
});
