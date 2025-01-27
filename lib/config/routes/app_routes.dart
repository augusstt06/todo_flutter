import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:todo_flutter/config/routes/routes_location.dart';
import 'package:todo_flutter/screens/home_screen.dart';

final navigatorKey = GlobalKey<NavigatorState>();

final appRoutes = [
  GoRoute(
      path: RouteLocation.home,
      parentNavigatorKey: navigatorKey,
      builder: HomeScreen.builder),
];
