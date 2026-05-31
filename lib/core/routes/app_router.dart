import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_app/core/di/dependecy_injection.dart';
import 'package:project_app/core/routes/routes.dart';
import 'package:project_app/features/auth/logic/cubit/login_cubit.dart';
import 'package:project_app/features/auth/logic/cubit/signup_cubit.dart';
import 'package:project_app/features/auth/ui/screens/login_screen.dart';
import 'package:project_app/features/auth/ui/screens/sigin_up_screen.dart';
import 'package:project_app/features/home/ui/screens/home_screen.dart';
import 'package:project_app/features/on_bording/ui/screen/on_bording_screen.dart';

class AppRouter {
  Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => const OnBordingScreen());
      case Routes.home:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case Routes.login:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
      case Routes.register:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<SignupCubit>(),
            child: const SiginUpScreen(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('No route defined for ${settings.name}')),
          ),
        );
    }
  }
}
