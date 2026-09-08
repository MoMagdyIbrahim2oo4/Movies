// Basic smoke test to verify the app widget tree builds without errors.
//
// Firebase and SharedPreferences calls are bypassed by passing pre-resolved
// values directly, so this test runs without any native plugins.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movies/main.dart';
import 'package:provider/provider.dart';
import 'package:movies/features/Auth/manager/auth_provider.dart';

void main() {
  testWidgets('MyApp builds without throwing', (WidgetTester tester) async {
    // Provide the same wrapper that main() provides so Provider is available.
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider<AuthProvider>(
            create: (_) => AuthProvider(),
          ),
        ],
        // Pass hasSeenOnboarding: false so AuthWrapper renders OnBoardingScreen,
        // which does NOT require Firebase or an active auth state.
        child: MyApp(hasSeenOnboarding: false),
      ),
    );

    // If the widget tree built without throwing, the test passes.
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
