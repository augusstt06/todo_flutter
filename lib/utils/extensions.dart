/// BuildContext 클래스에 대해 속성, 메서드 추가.
/// BuildContext : 플러터에서 제공하는 위젯의 위치, 정보를 알려주는 객체
///
library;

import 'package:flutter/material.dart';

extension BuildContextExtenstions on BuildContext {
  ThemeData get _theme => Theme.of(this);
  TextTheme get textTheme => _theme.textTheme;
  ColorScheme get colorScheme => _theme.colorScheme;
  Size get deviceSize => MediaQuery.sizeOf(this);
}
