import 'package:firebase_auth/firebase_auth.dart' as fb_auth;
import 'package:flutter/material.dart';
import 'package:movies/features/Auth/presentation/screens/login_screen.dart';
import 'package:movies/features/main/presentation/screens/main_layout_screen.dart';
import 'package:movies/features/onboarding/presentation/screens/on_boarding_screen.dart';

class AuthWrapper extends StatefulWidget {
  final bool hasSeenOnboarding;

  const AuthWrapper({super.key, required this.hasSeenOnboarding});

  @override
  State<AuthWrapper> createState() => _AuthWrapperState();
}

class _AuthWrapperState extends State<AuthWrapper> {
  late final Stream<fb_auth.User?> _authStateChanges;

  @override
  void initState() {
    super.initState();
    _authStateChanges = fb_auth.FirebaseAuth.instance.authStateChanges();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.hasSeenOnboarding) {
      return const OnBoardingScreen();
    }

    return StreamBuilder<fb_auth.User?>(
      stream: _authStateChanges,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const MainLayoutScreen();
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        return const LoginScreen();
      },
    );
  }
}
