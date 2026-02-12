import 'package:flutter/material.dart';
import 'routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Help Center',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF4F4F4),
        fontFamily: 'Roboto',
      ),
      initialRoute: AppRoutes.helpCenter,
      routes: AppRoutes.routes,
    );
  }
}
