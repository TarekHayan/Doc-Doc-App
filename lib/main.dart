import 'package:flutter/material.dart';
import 'package:project_app/core/di/dependecy_injection.dart';
import 'package:project_app/core/routes/app_router.dart';
import 'package:project_app/doc_doc_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencyInjection();
  runApp(DocDocApp(appRouter: AppRouter()));
}
