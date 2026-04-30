import 'package:flutter/material.dart';
import 'package:project_app/core/routes/routes.dart';
import 'package:project_app/features/home/ui/screens/home_screen.dart';
import 'package:project_app/features/on_bording/ui/screen/on_bording_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => const OnBordingScreen());
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
