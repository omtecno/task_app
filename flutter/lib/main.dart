import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'screens/stress_sources_screen.dart';
import 'screens/stress_location_screen.dart';
import 'screens/stress_challenges_screen.dart';
import 'screens/learning_preference_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      initialRoute: '/',
      routes: {
        '/': (_) => const StressSourcesScreen(),
        '/stressLocation': (_) => const StressLocationScreen(),
        '/stressChallenges': (_) => const StressChallengesScreen(),
        '/learningPreference': (_) => const LearningPreferenceScreen(),
      },
    );
  }
}
