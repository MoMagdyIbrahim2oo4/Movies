import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil_plus/flutter_screenutil_plus.dart';
import 'package:movies/core/routing/app_routes.dart';
import 'package:movies/core/routing/auth_wrapper.dart';
import 'package:movies/core/theme/dark_theme.dart';
import 'package:movies/features/Auth/manager/auth_provider.dart';
import 'package:movies/features/Auth/presentation/screens/forget_password_screen.dart';
import 'package:movies/features/Auth/presentation/screens/login_screen.dart';
import 'package:movies/features/Auth/presentation/screens/register_screen.dart';
import 'package:movies/features/main/presentation/screens/main_layout_screen.dart';
import 'package:movies/features/onboarding/data/services/onboarding_prefs.dart';
import 'package:movies/features/onboarding/presentation/screens/on_boarding_screen.dart';
import 'package:movies/features/updateProfile/presentation/screens/update_profile_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final bool hasSeenOnboarding = await OnboardingPrefs.hasSeenOnboarding();

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (context) => AuthProvider(),
        ),
      ],
      child: EasyLocalization(
        supportedLocales: const [Locale('en'), Locale('ar')],
        path: 'assets/lang',
        fallbackLocale: const Locale('en'),
        child: DevicePreview(
          enabled: true,
          builder: (context) => MyApp(hasSeenOnboarding: hasSeenOnboarding),
        ),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool hasSeenOnboarding;
  const MyApp({super.key, required this.hasSeenOnboarding});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilPlusInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (childContext, child) {
        return MaterialApp(
          title: 'Movies',
          debugShowCheckedModeBanner: false,
          localizationsDelegates: context.localizationDelegates,
          supportedLocales: context.supportedLocales,
          locale: context.locale,
          // builder: DevicePreview.appBuilder,
          home: AuthWrapper(hasSeenOnboarding: hasSeenOnboarding),
          routes: {
            AppRoutes.onboardingScreen: (context) => OnBoardingScreen(),
            AppRoutes.loginScreen: (context) => LoginScreen(),
            AppRoutes.registerScreen: (context) => RegisterScreen(),
            AppRoutes.forgetPasswordScreen: (context) => ForgetPasswordScreen(),
            AppRoutes.updateProfileScreen: (context) => UpdateProfileScreen(),
            AppRoutes.mainLayoutScreen: (context) => MainLayoutScreen(),
          },
          darkTheme: DarkTheme.dark,
          themeMode: ThemeMode.dark,
        );
      },
    );
  }
}
