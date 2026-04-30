import 'package:flutter/material.dart';

extension NavExtension on BuildContext {
  dynamic navigateTo({required String routeName, Object? arguments}) {
    return Navigator.pushNamed(this, routeName, arguments: arguments);
  }

  dynamic navigateAndReplace({required String routeName, Object? arguments}) {
    return Navigator.pushReplacementNamed(
      this,
      routeName,
      arguments: arguments,
    );
  }

  void pop() {
    Navigator.pop(this);
  }
}
