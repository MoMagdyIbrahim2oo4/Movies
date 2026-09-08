import 'package:firebase_auth/firebase_auth.dart' as fb_auth;
import 'package:flutter/material.dart';
import 'package:movies/features/Auth/presentation/screens/login_screen.dart';
import 'package:movies/features/main/presentation/screens/main_layout_screen.dart';
import 'package:movies/features/onboarding/presentation/screens/on_boarding_screen.dart';

class AuthWrapper extends StatelessWidget {
  final bool hasSeenOnboarding;

  const AuthWrapper({super.key, required this.hasSeenOnboarding});

  @override
  Widget build(BuildContext context) {
    if (!hasSeenOnboarding) {
      return const OnBoardingScreen();
    }

    return StreamBuilder<fb_auth.User?>(
      stream: fb_auth.FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        if (snapshot.hasData && snapshot.data != null) {
          return const MainLayoutScreen();
        }

        return const LoginScreen();
      },
    );
  }
}

