import 'package:flutter/material.dart';
import 'package:learn_api/presentaion/resouece/go.dart';
import 'package:learn_api/presentaion/resouece/theme_manager.dart';

import 'app/di.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppModel();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.getRoute,
      theme: getApplicationTheme(),
      initialRoute: Routes.mainRoute,
    );
  }
}
